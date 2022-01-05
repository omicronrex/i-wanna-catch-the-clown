#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
w=4
image_yscale=w/12
h=0
timer=0
image_speed=0
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

if (w>4) if (place_meeting(x,y,TouhouHitbox)) kill_player()

image_yscale=w/12
image_xscale=h
image_index=red
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
texture_set_interpolation(1)
draw_self()
texture_set_interpolation(0)
draw_set_blend_mode(0)
