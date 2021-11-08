#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
spin=choose(-1,1)*random_range(5,10)

speed=random_range(0,2)
direction=random(360)

z=10
zspeed=random_range(3,6)
landed=0
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
    landed=1
    depth=1
    zspeed=abs(zspeed)*0.8
    hspeed*=2/3
    vspeed=(vspeed*2+Racecar.mapspeed)/3
    spin*=-0.9
}

image_angle+=spin
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (landed) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y-z,1,1,image_angle,$ffffff,1)
