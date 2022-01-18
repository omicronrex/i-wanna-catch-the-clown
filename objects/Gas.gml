#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=Racecar.mapspeed/2
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x,y,CarExplode)
i.image_xscale*=2
i.image_yscale*=2
i.image_speed/=2
instance_destroy()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>room_height) instance_destroy()
