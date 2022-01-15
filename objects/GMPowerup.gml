#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=3
if (instance_exists(GMShip))
    direction=direction_to_object(GMShip)
#define Collision_GMShip
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndItem")
GM3DLives.count+=1
instance_destroy()
