#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=irandom_range(5,10)
image_angle=choose(0,90,180,270)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=Racecar.mapspeed
#define Collision_Racecar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndRenBoink")

if (!hit) {
    hit=1
    hspeed=choose(-2,2)
    vspeed=-other.mapspeed/2
    alarm[0]=irandom_range(5,10)
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>room_height) instance_destroy()
