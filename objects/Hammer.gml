#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=270
vspeed=8

rotate=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(GMShip)) if (y>GMShip.y && image_angle=270) {
    sound_play("beep7")
    rotate=sign(GMShip.x-x)
    speed=0
}

if (rotate!=0) {
    image_angle+=rotate*5
    if (image_angle<=180 || image_angle>=360) {
        hspeed=8*rotate
        rotate=0
        image_angle=direction
    }
}
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
    s=3-3*abs(angle_difference(image_angle mod 90,45))/45
    draw_sprite_ext(sprBossGMGame,0,x,y,s,s,0,$ffffff,1)
}
draw_self()
