#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
image_yscale=4
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=sound_play_paused("sndBlockChange")
sound_pitch(i,0.7)
sound_resume(i)
scaleh=4
camera_shake(16,80)
event_inherited()
