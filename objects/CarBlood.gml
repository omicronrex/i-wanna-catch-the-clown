#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=irandom(3)
spin=choose(-1,1)*random_range(5,10)

speed=random_range(0,2)
direction=random(360)

vspeed+=Racecar.mapspeed

z=10
zspeed=random_range(3,6)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
zspeed-=0.4

z+=zspeed
if (z<0) {
    z=0
    zspeed=0
    hspeed=0
    vspeed=Racecar.mapspeed
    spin=0
    depth=1
}

image_angle+=spin
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
draw_sprite_ext(sprite_index,image_index,x,y-z,1,1,image_angle,$ffffff,1)
