#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-20
image_alpha=0.5
image_xscale=3
image_yscale=3
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effect_create_below(ef_flare,x,y,1,$8080)
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Collision_Clownpiece
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) event_user(0)
instance_destroy()
