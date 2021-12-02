#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=-30
alarm[0]=150
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>ystart) {
    y=ystart
    vspeed=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y+8*!!Herman.whatsthat)
if (Herman.speakfade>0) {
    d3d_set_fog(1,$40b8,0,0)
    draw_sprite_ext(sprite_index,0,x,y+8*!!Herman.whatsthat,1,1,0,$ffffff,Herman.speakfade)
    d3d_set_fog(0,0,0,0)
}
