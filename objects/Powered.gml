#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mode=1
alpha=0
alarm[0]=100
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mode=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mode) alpha=min(1,alpha+0.02)
else {
    alpha=max(0,alpha-0.02)
    if (alpha==0) {
        instance_create(0,0,FadeIn)
        room_goto(rmTitle)
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x-100,y+10)
draw_sprite(sprite_index,1,x+100,y+10)
draw_set_halign(1)
draw_set_valign(1)
draw_set_font(fntFileBig)
draw_text(x,y-90,"Powered by")
draw_set_font(fntFileSmall)
draw_text(x-100,y+90,"Game Maker 8.2")
draw_text(x+100,y+90,"renex engine")
draw_set_halign(0)
draw_set_valign(0)
rect(0,0,800,608,0,1-alpha)
