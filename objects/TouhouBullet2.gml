#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-10
image_alpha=0.75
alarm[0]=100
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=45

if (instance_exists(Clownpiece)) if (Clownpiece.vulnerable) motion_add(direction_to_object(Clownpiece),0.8)

speed=min(11,speed)
#define Collision_Clownpiece
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.vulnerable) {
    with (other) event_user(0)
    effect_create_below(ef_flare,x,y,1,$8080ff)
    instance_destroy()
}
