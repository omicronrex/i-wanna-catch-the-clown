#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=Racecar.mapspeed/2
image_xscale=4
image_yscale=4
image_speed=0.5
instance_create(x,y,Scorch)
sound_play("sndRenExplode")
camera_shake(16)

used=0
#define Collision_Racecar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!used && image_index<1) {
    other.damage+=1
    used=1
}
#define Collision_CarGoUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) if (!dead) {
    dead=1
    carticles()
    image_index+=4
    gravity=0.05
}
#define Collision_CarGoDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) if (!dead) {
    dead=1
    carticles()
    image_index+=4
    gravity=0.05
}
#define Collision_Police
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) if (!dead) {
    dead=1
    carticles()
    sprite_index=sprPolDed
    gravity=0.05
    sound_stop(snd)
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
