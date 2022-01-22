#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (AutoSign) if (msg="Beware of dog.") {msg="Beware of dog(s)." active=max(active,100)}
instance_destroy_id(object_index)
