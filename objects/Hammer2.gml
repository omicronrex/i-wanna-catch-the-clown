#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rotate=0
f=0
rot=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("beep7")
rotate=1
speed=0
rot=abs(angle_difference(direction,270))/10
f=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (rotate!=0) {
    direction=inch_angle(direction,270,10)
    if (abs(direction-270)<10) {
        vspeed=8
        rotate=0
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=direction
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (rotate!=0) {
    f+=1/rot
    s=(1-abs(0.5-f)*2)*3
    draw_sprite_ext(sprBossGMGame,0,x,y,s,s,0,$ffffff,1)
}
draw_self()
