#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=90
image_yscale=choose(-0.9,0.9)
image_speed=0.2
special=0
dead=0
friction=0.1
spin=0

snd=sound_loop_paused("sirens")

sound_volume(snd,0.3)
sound_set_pos(snd,random(1))
sound_resume(snd)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(snd)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=Racecar.mapspeed

image_angle+=spin
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>room_height) instance_destroy()
