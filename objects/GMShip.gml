#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.5
vspeed=-12
gravity=0.5
hspeed=-3

active=0
flash=0
lifec=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=xstart
y=ystart
image_speed=0.5
vspeed=-12
gravity=0.5
hspeed=-3
active=0
flash=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    xp+=global.input_h*6
    yp+=global.input_v*6
    xp=median(32,xp,800-32)
    yp=median(32,yp,608-32)

    x=mean(x,xp)
    y=mean(y,yp)
}

if (flash) {
    flash+=1
    visible=flash mod 4<2
    if (flash=100) {
        flash=0
        visible=1
    }
}

if (instance_exists(Player)) {
    move_player(x,y,0)
    cutscene=1
    Player.visible=0
    Player.speed=0
} else event_user(0)

if (vspeed>0 && y>608-48) {
    gravity=0
    speed=0
    active=1
    xp=x
    yp=y
}

if (global.key[key_shoot] && active) {
    timer-=1
    if (timer<0) {
        timer=4
        play_sound("laser5")
        s=abs(cos((image_index/image_number)*pi))
        p=instance_create(x-12*s,y-4,GMShipBullet)
        p.direction=90+7*s
        p=instance_create(x+12*s,y-4,GMShipBullet)
        p.direction=90-7*s

        if (!instance_exists(GMShipBulletStronger))
            instance_create(x,y-4,GMShipBulletStronger)
        else instance_create(x,y-4,GMShipBullet)
    }
} else timer=0
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Player.visible=1
cutscene=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
p=instance_create(x,y,GMBossExplosion)
p.image_xscale=2
p.image_yscale=2
play_sound("sndRenExplode")
y=999
alarm[0]=50
active=0

if (!instance_exists(Player)) instance_destroy()
