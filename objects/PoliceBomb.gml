#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
z=100
y+=100
speed=distance_to_object(Racecar)/75
zspeed=5.5
direction=direction_to_object(Racecar)

dx=Racecar.x
dy=Racecar.y
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle-=22.5

zspeed-=0.15
z+=zspeed
if (z<0) {
    instance_create(x,y,CarExplode)
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprTarget,0,dx,dy)
draw_sprite_ext(sprite_index,image_index,x,y-z,1,1,image_angle,$ffffff,1)
