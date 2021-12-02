#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
dead=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dead) {
    image_alpha-=0.05
    if (image_alpha<0) instance_destroy()
} else {
    image_alpha=min(0.75,image_alpha+0.02)
}

motion_add(random(360),0.1)
if (instance_exists(owner)) {motion_add(owner.direction,0.05) f=owner.f}
motion_add(point_direction(x,y,Clownpiece.x,Clownpiece.y),f)
speed=min(7,speed)

d=point_distance(x,y,Clownpiece.x,Clownpiece.y)
if (d<100) {friction=f*0.5 direction-=angle_difference(direction,point_direction(x,y,Clownpiece.x,Clownpiece.y))/10}
if (d<50) dead=1
