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
go=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (x>xstart+32) depth=-1
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.x=max(other.x,bbox_right+7)
#define Collision_GMClown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.x=max(other.x,bbox_right+1)
#define Collision_Grave
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.x=max(other.x,bbox_right+7)
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!go) {
    go=1
    sound_play("TankStart01")
    hspeed=3
}
