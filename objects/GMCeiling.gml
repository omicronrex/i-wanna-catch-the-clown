#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
broken=0
side=0
nond=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=rot
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
b=instance_create(x,y,Block)
rot=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!broken) {
    broken=1
    with (b) instance_destroy()
    hspeed=(x-other.x)/64
    rot=random_range(-5,5)
    gravity=random_range(0.2,0.3)

    with (instance_place(x-32,y,object_index)) side=-1
    with (instance_place(x+32,y,object_index)) side=1
}
