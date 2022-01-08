#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=8
image_yscale=5

image_speed=0.2

angle=90

hp=100

dead=0

snd=sound_loop_paused("sirens")
sound_pitch(snd,0.7)
sound_resume(snd)

Racecar.shoot=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    if (x<Racecar.x-48) angle=max(80,angle-1)
    else if (x>Racecar.x+48) angle=min(100,angle+1)

    hspeed=dcos(angle)*Racecar.mapspeed

    if (bbox_top>608-96) y-=2

    if (!Racecar.dead && bbox_top>96) y-=0.75

    if (hp<=0) {
        dead=1
        sprite_index=sprPolDed
        gravity=0.05
        sound_stop(snd)
        camera_shake(32)
        Racecar.maxmapspeed=12
    }
} else hspeed=0

if (dead) {
    dead*=1.02
    image_angle=-dead
    gravity=0.04
    o=instance_create(x+random_range(-100,100),y+random_range(-150,150),RenGMExplosion)
    o.image_xscale=3
    o.image_yscale=3
    if (!irandom(4)) sound_play("sndRenExplode2")

    if (bbox_top>620) {
        y=620
        o=instance_create(x,y,RenGMExplosion)
        o.image_xscale=20
        o.image_yscale=20
        o.image_speed=0.2
        instance_destroy()
        sound_play("sndKittyBoom")
        carticles()
        camera_shake(80)
        Racecar.alarm[1]=100
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=(angle-90)/4
draw_self()
image_angle=0


dx=20
dy=500

draw_set_font(fArial12)
draw_text(dx,dy,"Police:")

col=$ff
if (hp>40) col=$ffff
if (hp>70) col=$ff00

draw_healthbar(dx+60,dy,dx+160,dy+20,hp,0,col,col,0,1,1)
