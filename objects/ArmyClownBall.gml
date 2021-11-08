#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

dampmul=0.5
dampsub=0.2
dampfrc=0.1
radius=14
sound="sndRenBoink"

speed=random_range(2,5)
direction=point_direction(RenClownHeart.x,RenClownHeart.y,x,y)

rotsp=choose(-1,1)*random_range(2,8)
