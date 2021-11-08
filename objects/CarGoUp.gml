#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=irandom(3)

slot=irandom(2)
x=400+(0.5+slot)*60
y=-50

if (slot=2) vspeed=3
if (slot=1) vspeed=2
if (slot=0) vspeed=1

image_yscale=-1

if (place_meeting(x,y,object_index)) instance_destroy()
if (place_meeting(x,y,Police)) instance_destroy()


dead=0
hp=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>650) instance_destroy()
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy_id(other)
hp-=1
sound_play("sndBlockBreakYuuutu")

if (hp<=0) if (!dead) {
    dead=1
    carticles()
    image_index+=4
    gravity=0.05
}
#define Collision_CarGoUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    dead=1
    carticles()
    image_index+=4
    vspeed=other.vspeed
}
#define Collision_Police
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    dead=1
    carticles()
    image_index+=4
    vspeed=other.vspeed
    gravity=0.05
}
