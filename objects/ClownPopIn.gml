#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r=400
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=Clownpiece.x
y=Clownpiece.y

r-=20
if (r<=0) instance_destroy()

draw_set_circle_precision(64)
draw_set_blend_mode(bm_add)
draw_set_alpha(1-r/400)
draw_circle_color(x,y,r,0,$ff0000,0)
draw_set_alpha(1)
draw_set_blend_mode(0)
draw_set_circle_precision(16)
