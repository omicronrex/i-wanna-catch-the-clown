#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
image_xscale=3
image_yscale=3
image_alpha=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=max(1,image_xscale-0.25)
image_yscale=image_xscale
image_alpha=1-(image_xscale-1)/2

image_angle-=5
#define Collision_ClownMoon
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effect_create_above(ef_flare,x,y,2,$ff0000)
effect_create_above(ef_flare,x,y,1,$ffffff)

instance_destroy()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,1,x,y,1.5,1.5,image_angle,$ffffff,image_alpha*0.5)
draw_self()
