#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.2

if (irandom(2)) {
    x=400+(0.5+irandom(2))*60
    y=650
    if (place_meeting(x,y,CarGoUp)) y+=60
} else {
    x=400+(0.5+irandom(2))*60
    y=-50
    if (place_meeting(x,y,CarGoUp)) y-=60
}

angle=90

hp=15

dead=0

snd=sound_loop("sirens")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    if (x<Racecar.x-16) angle=max(70,angle-2)
    else if (x>Racecar.x+16) angle=min(110,angle+2)
    if (place_meeting(x+sign(Racecar.x-x)*16,y,CarGoUp) || place_meeting(x+sign(Racecar.x-x)*16,y,CarGoDown))
        angle=inch(angle,90,10)

    hspeed=dcos(angle)*Racecar.mapspeed

    y=inch(y,Racecar.y,1)
} else hspeed=0

if (y>700) {instance_destroy() sound_stop(snd)}
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
    sprite_index=sprPolDed
    gravity=0.05
    sound_stop(snd)
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
    sprite_index=sprPolDed
    vspeed=other.vspeed
    gravity=0.05
    sound_stop(snd)
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
    sprite_index=sprPolDed
    vspeed=other.vspeed
    gravity=0.05
    sound_stop(snd)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=angle-90
draw_self()
image_angle=0
