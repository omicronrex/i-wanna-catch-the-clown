#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=-347

k=random_range(0.25,0.8)
depth=-1-k
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=view_xview/800

x=1150-300*f*k
y+=k*8
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_ext(bgCartParallax3,x+105,y,1,1,270,$808080,1)
