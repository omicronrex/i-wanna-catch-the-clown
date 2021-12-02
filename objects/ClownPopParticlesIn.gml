#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=random_range(2,3)

rand=choose(10,-10,15,-15)

j=random(360)

image_alpha=0

image_speed=0
image_index=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=min(0.5,image_alpha+0.1)

image_angle+=rand

image_xscale=scale*sin(image_angle/90+j)
image_yscale=scale*1.5

move_towards_point(Clownpiece.x,Clownpiece.y,16)
if (point_distance(x,y,Clownpiece.x,Clownpiece.y)<50) {
    scale-=0.3
    image_alpha-=0.2
    if (scale<0) instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_self()
draw_set_blend_mode(0)
