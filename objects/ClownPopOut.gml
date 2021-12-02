#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r+=30
if (r>600) instance_destroy()

draw_set_blend_mode(bm_add)
draw_set_alpha(1-r/600)
draw_circle_color(x,y,r,0,$8000ff,0)
draw_set_alpha(1)
draw_set_blend_mode(0)
