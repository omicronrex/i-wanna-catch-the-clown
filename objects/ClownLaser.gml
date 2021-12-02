#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
w=4
h=0
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1

h+=20

if (timer>40 && timer<60) {
    w+=0.75
}
if (timer>80) {
    w-=0.75
    if (w<0) instance_destroy()
}

x=xstart-w/2
image_xscale=w
if (timer>40) image_yscale=h
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_rectangle_color(x,y,x+w/2,y+h,$ff0000,$ffffff,$ffffff,$ff0000,0)
draw_rectangle_color(x+w/2,y,x+w,y+h,$ffffff,$ff0000,$ff0000,$ffffff,0)
draw_set_blend_mode(0)
