#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=random_range(0,180)
speed=random(10)
gravity=0.2

angle=random(360)
spinx=random(8)
spiny=random(8)

rotx=0
roty=0

image_xscale=0.5
image_yscale=0.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rotx+=spinx
roty+=spiny
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>0)
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_rotation_x(rotx)
d3d_transform_add_rotation_y(roty)
d3d_transform_add_translation(x,y,0)

draw_set_color(merge_color(merge_color($ffffff,$c0c0c0,min(1,1+dsin(rotx))),0,max(0,dsin(rotx))))
draw_triangle(-8,8,0,-8,8,8,0)
draw_set_color($ffffff)

d3d_transform_set_identity()
