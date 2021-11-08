#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat (200) instance_create(random_range(32,800-32),random_range(32,608-32),Star)
alarm[0]=5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=5
instance_create(0,random_range(32,608-32),Star)
