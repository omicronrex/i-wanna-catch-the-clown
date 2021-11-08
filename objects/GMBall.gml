#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=round(x/32)*32
gravity=0.2
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed>1) {
    play_sound("sndRenBoink")
    move_contact_solid(270,vspeed)
    vspeed=-abs(vspeed*0.6)
} else {
    instance_create(x+16,y+16,RenGMExplosion)
    instance_destroy()
}
