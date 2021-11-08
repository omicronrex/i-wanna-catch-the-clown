#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=round(x/32)*32
gravity=0.2
bounce=0
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!bounce) {
    bounce=1
    play_sound("sndRenBoink")
    direction=random_range(45,135)
    speed=random_range(3,6)
} else {
    instance_create(x+16,y+16,RenGMExplosion)
    instance_destroy()
}
