#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bepp=0

if (difficulty=0) spd=10
else spd=16
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bepp+=1
if (bepp>13) instance_destroy()

instance_create_moving(x,y,StraightBullet,spd,dir)
