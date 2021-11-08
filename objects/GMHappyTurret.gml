#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hp=10

image_xscale=0.25
image_yscale=0.25

flash=0
shoot=0

dead=0

grav=0.1+random(0.1)

randspin=choose(-2,-1,1,2)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (GameMaker3D) {
    for (i=0;i<3;i+=1) {
        if (turretleft[i]=other.id) turretleft[i]=0
        if (turretright[i]=other.id) turretright[i]=0
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=randspin

if (dead) gravity=grav

if (flash) flash-=1

if (shoot) {
    shoot+=1
    if (shoot=20 || shoot=40 || shoot=60) {
        sound_play("zap")
        instance_create_moving(x,y,CaveBullet4,10,270)
    }
    if (shoot=60) shoot=0
}

if (hp<=0) {
    p=instance_create(x,y,GMBossExplosion)
    p.image_xscale=2
    p.image_yscale=2
    play_sound("sndRenExplode2")
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flash) d3d_set_fog(1,$ffffff,0,0)
texture_set_interpolation(1)
draw_self()
texture_reset_interpolation()
if (flash) d3d_set_fog(0,0,0,0)
