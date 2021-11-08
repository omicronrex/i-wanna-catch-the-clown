#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
depth=1002
sound="dogbark"
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
if (image_yscale==2) {
    i=sound_play_paused(sound)
    sound_pitch(i,0.7)
    sound_resume(i)
} else sound_play("dogbark")
hspeed=8*sign(image_xscale)
