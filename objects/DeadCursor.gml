#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effect_create_above(ef_firework,x,y,1,$808080)
effect_create_above(ef_smoke,x,y,0,$808080)
sound_play("sndRenGlass")
room_caption="Catch the Clown Score: 0"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//random delay between glitches
alarm[0]=irandom_range(1,30)

//select spooky sentences
str="Catch the Clown Score: 0"
if (!irandom(20)) str="Press F1 for Help Score: 0"
if (!irandom(20)) str="Catch the Clown! He's right there catch him before he escapes."
if (!irandom(20)) str="You are not going anywhere without the snowman."
if (!irandom(20)) str="CATCH THE CLOWN"
if (!irandom(20)) str="GET THE SNOWMAN"
if (!irandom(20)) str="Please help me Score: 0"

//scromble it up just a little bit
repeat (irandom(5)) {
    p=irandom(string_length(str))
    str=string_insert(choose(chr(irandom_range(32,127)),string_upper(string_char_at(str,p))),string_delete(str,p,1),p)
}

//yeaj
room_caption=string_repeat(" ",irandom(3))+str
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inside_view() && point_distance(x,y,mouse_x,mouse_y)<20) {
    instance_destroy()
}
