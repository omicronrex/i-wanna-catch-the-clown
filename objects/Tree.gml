#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
activated=0
dir=90
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!activated) {
    activated=1
    instance_create_moving(x+16,y+16,Bug,spd,dir)
}
