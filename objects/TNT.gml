#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=Racecar.mapspeed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=Racecar.mapspeed
#define Collision_CarGoUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndRenExplode")
o=instance_create(x,y,RenGMExplosion)
o.image_xscale=4
o.image_yscale=4
instance_destroy()

with (other) if (!dead) {
    dead=1
    carticles()
    image_index+=4
    vspeed=Racecar.mapspeed
}
#define Collision_CarGoDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndRenExplode")
o=instance_create(x,y,RenGMExplosion)
o.image_xscale=4
o.image_yscale=4
instance_destroy()

with (other) if (!dead) {
    dead=1
    carticles()
    image_index+=4
    vspeed=Racecar.mapspeed
}
#define Collision_Police
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndRenExplode")
o=instance_create(x,y,RenGMExplosion)
o.image_xscale=4
o.image_yscale=4
instance_destroy()

with (other) if (!dead) {
    dead=1
    carticles()
    sprite_index=sprPolDed
    vspeed=Racecar.mapspeed
    sound_stop(snd)
}
#define Collision_BigPolice
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndRenExplode")
o=instance_create(x,y,RenGMExplosion)
o.image_xscale=4
o.image_yscale=4
instance_destroy()

with (other) hp-=20
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
