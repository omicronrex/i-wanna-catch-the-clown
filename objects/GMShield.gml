#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=0.5
image_yscale=0.5

hp=40
flash=0
salvo=0
spinner=0
time=0
dead=0
dying=0
circular=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dead || GameMaker3D.dying) exit

if (dying) {
    dying+=1
    flash=dying mod 4

    if (dying>40 && !irandom(5)) {
        p=instance_create(x,y,GMBossExplosion)
        p.image_xscale=3
        p.image_yscale=4
        play_sound("sndRenExplode")
        dead=1
    }
    vspeed+=0.2
    exit
}


if (flash) flash-=1

if (salvo) {
    salvo+=1
    if (salvo mod 2) {
        shoot_bullet(x,y,1,270,6+salvo)
        sound_play("laser5")
    }
    if (salvo=16) salvo=0
}

if (spinner=1) {
    if (brupp<360*2) {
        brupp=brupp+30/6
        if !(brupp mod 30) {
            shoot_bullet(x,y,0,brupp,6)
            sound_play("laser5")
        }
    }
} else brupp=0

if (spinner=2) {
    time+=1
    if (time=12) {
        time=0
        shoot_bullet(x,y,1,270,random_range(4,8))
        sound_play("laser5")
    }
}

if (circular) {
    circular+=1

    if (circular=30 || circular=70 || circular=110) {
        instance_create_moving(x,y,CaveBullet4,6,270)
        sound_play("laser5")
    }
    if (circular=35 || circular=65 || circular=75 || circular=105 || circular=115) {
        instance_create_moving(x,y,CaveBullet4,6,240)
        instance_create_moving(x,y,CaveBullet4,6,300)
        sound_play("laser5")
    }
    if (circular=40 || circular=60 || circular=80 || circular=100 || circular=120) {
        instance_create_moving(x,y,CaveBullet4,6,210)
        instance_create_moving(x,y,CaveBullet4,6,330)
        sound_play("laser5")
    }
    if (circular=45 || circular=55 || circular=85 || circular=95 || circular=125) {
        instance_create_moving(x,y,CaveBullet4,6,180)
        instance_create_moving(x,y,CaveBullet4,6,0)
        sound_play("laser5")
    }
    if (circular=50 || circular=90) {
        instance_create_moving(x,y,CaveBullet4,6,150)
        instance_create_moving(x,y,CaveBullet4,6,30)
        sound_play("laser5")
    }
    if (circular>125) circular=0
}

if (hp<=0) {
    p=instance_create(x,y,GMBossExplosion)
    p.image_xscale=3
    p.image_yscale=3
    play_sound("sndRenExplode")
    dead=1
    with (GameMaker3D) straightsalvo=1
}

d=direction_to_object(Player)
if (d!=-1) aim=d
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dead) exit
if (flash) d3d_set_fog(1,$ffffff,0,0)
draw_self()
if (flash) d3d_set_fog(0,0,0,0)
