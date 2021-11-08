#define Collision_Wasp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (falling) {
    sound_play("sndDeath")
    with (other) instance_destroy()
}
#define Collision_Fish
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (falling) {
    sound_play("sndDeath")
    with (other) instance_destroy()
}
