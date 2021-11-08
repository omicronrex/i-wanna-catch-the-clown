#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
canjump=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=4
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!place_meeting(x,y+vspeed,other.id)) vspeed=4
else {vspeed=0 image_index=!image_index canjump=1}
hspeed=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (canjump) {
    vspeed=-4
    if (image_index) hspeed=4
    else hspeed=-4
    alarm[0]=64/4
    canjump=0
}
