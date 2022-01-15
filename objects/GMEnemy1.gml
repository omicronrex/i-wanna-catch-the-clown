#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=-0.1

alarm[0]=50

alarm[2]=250

hp=8
flash=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shoot_bullet(x,y,0,270,6)
shoot_bullet(x,y,0,225,6)
shoot_bullet(x,y,0,315,6)

vspeed=0
hspeed=-sign(hspeed)
gravity=0
alarm[1]=50
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=-0.1
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flash) flash-=1

if (hp<=0) {
    p=instance_create(x,y,GMBossExplosion)
    p.image_xscale=3
    p.image_yscale=3
    play_sound("sndRenExplode2")
    instance_destroy()
    GMShip.lifec+=1
    if (GMShip.lifec=3) {
        sound_play("sndRenBall")
        instance_create(x,y,GMPowerup)
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flash) d3d_set_fog(1,$ffffff,0,0)
draw_self()
if (flash) d3d_set_fog(0,0,0,0)
