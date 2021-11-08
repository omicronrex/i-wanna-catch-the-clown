#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=round((x-16)/32)*32+16
vspeed=8
alarm[0]=16
active=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=16
play_sound("sndPac")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) direction=inch_angle(direction,direction_to_object(GameMaker),2)

image_angle=direction

if (hspeed<0) image_yscale=-1
else image_yscale=1
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    with (other) instance_destroy()
    active=1
    GameMaker.shootskull=1
    play_sound("sndRenClown")
    y-=vspeed
    hspeed=0
    vspeed=-8
}
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed>0) {
    move_contact_solid(270,vspeed)
    vspeed=0
    if (instance_exists(Player)) hspeed=8*sign(Player.x-x)
    if (hspeed=0) hspeed=8
} else {
    instance_create(x,y,RenGMExplosion)
    instance_destroy()
}
#define Collision_GameMaker
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    play_sound("sndRenExplode")
    other.hp-=10
    instance_create(x,y,GMBossExplosion)
    instance_destroy()
}
