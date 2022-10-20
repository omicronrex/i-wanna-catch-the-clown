#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=0.05
image_yscale=0.05
image_alpha=0
image_speed=0
image_index=irandom(7)
image_angle=random(360)
rotspd=random_range(-5,5)
friction=0.04
direction+=random_range(-5,5)
speed+=random(2)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale+=1/80
image_yscale=image_xscale
rotspd*=0.98
image_angle+=rotspd
image_alpha=(image_xscale+0.3)*(speed-1)

if (image_alpha<=0) instance_destroy()
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=0
