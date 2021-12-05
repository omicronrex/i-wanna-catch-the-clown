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
effect_create_above(ef_flare,x,y,1,$ff0000)
effect_create_above(ef_flare,x,y,0,$ffffff)

instance_destroy()
sound_play_single("se_etbreak")
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
