#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle-=20
#define Collision_ClownMoon
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effect_create_above(ef_flare,x,y,1,$ff)
effect_create_above(ef_flare,x,y,0,$ffffff)

instance_destroy()
if (global.se_etbreak) sound_stop(global.se_etbreak)
global.se_etbreak=sound_play("se_etbreak")
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
