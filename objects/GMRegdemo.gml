#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=random_range(0.5,0.75)
image_yscale=image_xscale
image_angle=random(360)
image_blend=make_color_rgb(16+random(240),16+random(240),16+random(240))
image_alpha=0.4+random(0.6)

gravity=0.2

rot=random_range(-5,5)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=rot
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
