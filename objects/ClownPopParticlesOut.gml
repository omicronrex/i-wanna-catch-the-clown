#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=random_range(2,3)

rand=choose(10,-10,15,-15)

j=random(360)

speed=random_range(16,24)
direction=random(360)

friction=1

image_speed=0
image_index=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=rand

image_xscale=scale*sin(image_angle/90+j)
image_yscale=scale*1.5

image_alpha=min(1,speed/5)
if (speed==0) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_self()
draw_set_blend_mode(0)
