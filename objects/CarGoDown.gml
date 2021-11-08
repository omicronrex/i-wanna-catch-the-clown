#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=irandom(3)

slot=irandom(2)
x=400-(0.5+slot)*60
y=-50

if (slot=2) vspeed=8
if (slot=1) vspeed=7
if (slot=0) vspeed=6.5


if (place_meeting(x,y,object_index)) instance_destroy()
if (place_meeting(x,y,Police)) instance_destroy()

dead=0
hp=4
horn=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>650) instance_destroy()

if (!horn && Racecar.x<400) {
    if (distance_to_object(Racecar)<100) {
        horn=1
        snd=sound_play_paused("carhorn")
        sound_pitch(snd,random_range(0.9,1.1))
        sound_resume(snd)
    }
}
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
#define Collision_CarGoDown
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
    vspeed=other.speed
    gravity=0.05
}
