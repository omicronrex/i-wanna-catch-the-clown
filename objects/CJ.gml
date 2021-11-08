#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dead=0
walking=0
image_speed=0
patience=30
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,ManBullet)
alarm[0]=irandom_range(10,20)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dead) {
    dead+=1
    if (dead<20) {
        repeat (10) {
            instance_create(x,y+8,CarBlood)
        }
    }
} else {
    if (walking) {
        if (Racecar.vol2==1 && x>200) patience-=1
        if (patience==0) {
            //honk at me mothafucka
            speed=0
            sprite_index=sprManDown
            image_speed=0
            alarm[0]=30
            walking=0
        }
        if (x<-250 && !instance_exists(RenSave)) {
            hspeed=2
            image_xscale=-1
            instance_create(x-16,y-16,RenSave)
        }
        if (hspeed>0) {
            RenSave.x=x+8
            if (x>160) {
                hspeed=-2
                image_xscale=1
                Racecar.save=1
            }
        }
    }
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inside_view()) if (!dead) {
    dead=1
    with (Semaphore) {
        polis=1
        alarm[0]=1
        sound_loop("sirens")
    }
    sprite_index=sprManDead
    sound_play("sndDeath")
    speed=other.speed/3
    direction=other.direction
    friction=0.5
}
#define Collision_Racecar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    dead=1
    sprite_index=sprManDead
    sound_play("sndDeath")
    speed=other.speed
    direction=other.direction
    friction=0.5
}
#define Collision_StoppedPolice
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    dead=1
    sprite_index=sprManDead
    sound_play("sndDeath")
    speed=other.speed
    direction=other.direction
    friction=0.5
}
