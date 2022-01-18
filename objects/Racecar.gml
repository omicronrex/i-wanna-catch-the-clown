#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0
vspeed=-4
alarm[0]=40
x=430
y=650
shoot=0

image_speed=0

angle=90
mapspeed=0
maxmapspeed=6
mapspeedspeed=0.25
timer=0
dist=11100

canwin=0
fade=0
fadehud=0
saved=0
vol3=1
t=0
crated=0

diff=1
if (difficulty==0) diff=1.25
if (difficulty==2) diff=0.8

hsp=0
vsp=0
dead=0
win=0

petrol=1000
tnt=2
save=0

snd=sound_loop_paused("tire screech")
sound_volume(snd,0)
sound_pitch(snd,0.75)
sound_resume(snd)
vol=0

snd2=sound_loop_paused("car_horn")
sound_volume(snd2,0)
sound_resume(snd2)
vol2=0

background_y[1]-=500
CJ.y-=500
Semaphore.y-=500

damage=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
canwin=1
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_speed=50
global.game_speed=50
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) {
    frozen=1
    Player.visible=0
    if (Player.key[key_jump]) vol2=min(1,vol2+0.5)
    else vol2=max(0,vol2-0.3)
    sound_volume(snd2,vol2)
} else sound_volume(snd2,0)

vol3=min(1,vol3+0.05)

RenSave.vspeed=mapspeed

mapspeed=median(0,mapspeed+mapspeedspeed,maxmapspeed)

background_y[0]+=mapspeed

if (damage>=6 && active) {
    active=0
    carticles()
    image_index=1
    hspeed=0
    gravity=0.05
}

if (!win) {
    if (petrol<=0 && gravity=0) {
        gravity=0.05
        sound_play("RVStop01")
    }

    if (save) {
        speed=0
        save+=1
        if (save=200) {
            i=instance_create(x+dcos(angle+90)*20,y-dsin(angle+90)*20,Bullet)
            i.direction=point_direction(i.x,i.y,RenSave.x,RenSave.y)
            i.owner=id
            i.speed=16
            sound_play("sndRenShot")
        }
        if (save=300) {
            save=0
            saved=0
        }
    }

    if (active && !save) {
        sound_kind_volume(1,min(1,0.5+mapspeed/12)*settings("musvol")*vol3)
        if (!canwin) petrol-=(0.5*min(6,mapspeed/6))*(0.5+difficulty*0.25)
        timer+=!Semaphore.polis
        if (instance_exists(BigPolice)) timer=min(timer,10050)
        dist=max(0,dist-mapspeed/6)

        oa=angle
        ov=vspeed

        if (instance_exists(Player)) {
            input_h=Player.input_h
            input_v=Player.input_v
        } else {
            input_h=0
            input_v=0
        }

        if (!(vspeed==0 && mapspeed=0)) angle=median(50,inch(angle,90-(30+10*(input_v>0))*input_h*sign(mapspeed-vspeed),max(2,abs(mapspeed/2-vspeed/4))),130)

        f=max(0,4-point_distance(0,0,hsp,vsp))/4
        hspeed=(dcos(angle)*(mapspeed-input_v*4))*f
        if (gravity=0) vspeed=(inch(vspeed,dsin(angle)*(input_v*4),0.5))*f

        x+=hsp
        y+=vsp

        hsp=inch(hsp,0,0.1)
        vsp=inch(vsp,0,0.1)

        if (angle!=oa || f<1 || (abs(400-x)>180 && mapspeed/6)) vol=min(0.7,vol+0.1)
        else vol=max(0,vol-0.1)
        sound_volume(snd,vol)

        if (vol>0 && y<608-64) {
            instance_create(x+lengthdir_x(12,angle+90),y+lengthdir_y(12,angle+90),TireMark)
            instance_create(x+lengthdir_x(12,angle-90),y+lengthdir_y(12,angle-90),TireMark)
        }

        if (abs(400-x)>180) {x+=choose(-1,1)*mapspeed/6 y+=choose(-1,1)*mapspeed/6 if (mapspeed/6) vspeed=mapspeed/6}

        if (instance_exists(Player)) if (Player.key_pressed[key_shoot] && instance_number(Bullet)<4) {
            if (Player.key[key_jump]) {
                if (tnt) {
                    tnt-=1
                    instance_create(x,y,TNT)
                    sound_play("DROPBOMB")
                } else sound_play("BEEP02")
            } else {
                i=instance_create(x+dcos(angle+90)*20,y-dsin(angle+90)*20,Bullet)
                i.direction=angle-3
                i.owner=id
                i.speed=16
                sound_play("sndRenShot")
                if (instance_exists(BigPolice)) i.direction=angle+183
                shoot=0
            }
        }

        if (!(timer>=3000 && timer<=4100) && !canwin) {
            if (!(timer mod 300) && timer!=7800) {
                instance_create(400+irandom_range(-180,180),-32,Gas)
            }
            if (!(timer mod 2500)) {
                (instance_create(400+irandom_range(-180,180),-32,Crate)).get=!crated
                crated=1
            }

            if (timer<5000 && !(timer>2500 && timer<3000)) {
                if (!(timer mod 1000) && timer!=2000) {
                    instance_create(0,0,Police)
                }

                if (!irandom(70*diff)) instance_create(0,0,CarGoDown)
                if (!irandom(200*diff)) instance_create(0,0,CarGoUp)
            }
        }

        if (timer==2000) {
            instance_create(592,0,CarSigns)
        }

        if (timer==2100) {
            instance_create(x,-32,Deer)
            instance_create(150,-50,RedLight)
        }

        if (timer==2900) {
            (instance_create(592,0,CarSigns)).image_index=1
        }

        if (timer=3000) {
            mapspeedspeed=-0.03
            Semaphore.go=1
        }
        if (timer=3200) {
            CJ.sprite_index=sprManLeft
            CJ.image_speed=0.5
            CJ.hspeed=-2
            CJ.walking=1
        }
        //if (timer=3900) clipboard_set_text("dist: "+string(dist)+" pos: "+string_better(sound_get_pos(global.musinst)))
        if (timer=3970) {
            Semaphore.frame=1
        }
        if (timer=4000) {
            mapspeedspeed=0.03
            s=sound_play_paused("RVStart01")
            sound_set_pos(s,0.95/sound_get_length("RVStart01"))
            sound_resume(s)
        }
        if (timer=4600) {
            sound_play("police radio")
        }
        if (timer=5250) {
            instance_create(400,650,PoliceHeli)
        }
        if (timer=5500 || timer=5750 || timer=6000) {
            (instance_create(0,0,Police)).y=-50
        }

        if (timer=6800 || timer=7300) {
            (instance_create(0,0,Police)).y=650
        }

        // roadblocks
        if (timer=6600) {
            instance_create(430,-50,Cone)
            instance_create(490,-50,Cone)
            instance_create(550,-50,Cone)
            if (difficulty>0) instance_create(370,-50,Cone)
            //instance_create(310,-50,Cone)
            if (difficulty==2) instance_create(250,-50,Cone)
        }
        if (timer=6700) {
            instance_create(430,-50,Roadblock)
            instance_create(490,-50,Roadblock)
            instance_create(550,-50,Roadblock)
            if (difficulty>0) instance_create(370,-50,Roadblock)
            //instance_create(310,-50,Roadblock)
            if (difficulty==2) instance_create(250,-50,Roadblock)
        }
        if (timer=7100) {
            if (difficulty==2) instance_create(430,-50,Cone)
            //instance_create(490,-50,Cone)
            if (difficulty>0) instance_create(550,-50,Cone)
            instance_create(370,-50,Cone)
            instance_create(310,-50,Cone)
            instance_create(250,-50,Cone)
        }
        if (timer=7200) {
            if (difficulty==2) instance_create(430,-50,Roadblock)
            //instance_create(490,-50,Roadblock)
            if (difficulty>0) instance_create(550,-50,Roadblock)
            instance_create(370,-50,Roadblock)
            instance_create(310,-50,Roadblock)
            instance_create(250,-50,Roadblock)
        }

        if (timer=7600 || timer=7700) {
            instance_create(430,-50,Cone)
            instance_create(490,-50,Cone)
            instance_create(550,-50,Cone)
            instance_create(370,-50,Cone)
            instance_create(310,-50,Cone)
            instance_create(250,-50,Cone)
        }
        if (timer=7800) {
            instance_create(430,-50,Roadblock)
            instance_create(490,-50,Roadblock)
            instance_create(550,-50,Roadblock)
            instance_create(370,-50,Roadblock)
            instance_create(310,-50,Roadblock)
            instance_create(250,-50,Roadblock)
            with (Roadblock) special=1
        }


        if (timer=8200) {
            sound_play("police radio 2")
        }
        if (timer=8700) {
            instance_create(400,900,BigPolice)
        }

        if (canwin && timer>10050-450) {
            win=1
            storepos=sound_get_pos(global.musinst)
            timer=min(timer,10050-450)
            active=0
            sound_stop(snd)
            sound_stop(snd2)
            speed=0
            gravity=0
            angle=90
        }
    } else {
        sound_volume(snd,0)
    }

    if (y>700) {
        event_user(1)
    }
}

if (win) {
    car_end_sequence()
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && petrol>0 && !win) {
    if (y>608-64) vsp*=0.5
    x=median(200,x,800-200)
    y=median(64,y,608-64)
}
#define Collision_Gas
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (gravity==0) {
    petrol=min(1000,petrol+400)
    sound_play("sndItem")
    instance_destroy_id(other)
}
#define Collision_CarGoUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.y>600) other.y+=vspeed
else event_user(0)
#define Collision_CarGoDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.y>600) other.y+=vspeed
else event_user(0)
#define Collision_Police
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    if (!other.dead) {
        active=0
        sound_play("sndRenBonk")
        hspeed=0
        vspeed=mapspeed
        other.vspeed=mapspeed
        other.dead=1
    } else if (other.dead) event_user(0)
}
#define Collision_Crate
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tnt+=1
damage=max(0,damage-1)
sound_play("sndItem")
instance_destroy_id(other)
#define Collision_Deer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    sound_play("sndDeath")
    active=0
    damage=6
    carticles()
    image_index=1
    hspeed=0
    vspeed=other.vspeed
    gravity=0.05
    other.image_yscale=-1
    other.dead=1
    other.speed=speed
    other.direction=direction
    other.friction=0.5
}
#define Collision_BigPolice
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed>=0 && !dead && active && vsp=0) {
    y+=32
    carticles()
    y-=32
    vsp=-4
    damage+=1
}
#define Collision_Roadblock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.special) {
    if (!other.dead) {
        with (other) {
            dead=1
            sprite_index=sprPolDed
            carticles()
        }
        with (Roadblock) {
            speed=6
            direction=point_direction(400,800,x,y)
            spin=choose(3,-3,6,-6)
        }
        o=instance_create(x,y-48,RenGMExplosion)
        o.image_xscale=8
        o.image_yscale=6
        o.image_speed/=2
        camera_shake(32)
        sound_play("sndRenExplode")
        room_speed=25
        global.game_speed=25
        alarm[2]=40

        repeat (irandom(100)) {
            o=instance_create(random_range(200,600),random_range(bbox_top,bbox_bottom)-48,CarDebris)
            o.image_index=4
            o.vspeed+=vspeed
        }
    }
} else {
    d=point_direction(other.x,other.y,x,y)
    l=point_distance(other.x,other.y,x,y)

    if (l<32) {
        x=other.x+lengthdir_x(32,d)
        y=other.y+lengthdir_y(32,d)
    }

    if (active) {
        speed=0

        if (hsp=0 && vsp=0) sound_play("sndBlockBreakYuuutu")

        vsp=2 if (!other.dead) damage+=2

        vsp+=other.vspeed/2
        if (!other.dead) {
            other.dead=1
            with (other) carticles()
            other.sprite_index=sprPolDed
            other.vspeed=-2
            other.hspeed=choose(1,-1)
            other.spin=choose(3,-3,6,-6)
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (savedata("room")=room) {
    background_y[1]+=600

    CJ.x=-100
    Semaphore.y+=600
    Semaphore.go=1

    y-=150
    speed=0

    mapspeedspeed=0
    active=1
    saved=1

    timer=3900
    dist=8000.50

    sound_kind_volume(1,0)
    play_bg_music("popcorn",0)
    sound_set_pos(global.musinst,0.393)
    vol3=0
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frozen=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d=point_direction(other.x,other.y,x,y)
l=point_distance(other.x,other.y,x,y)

if (l<32) {
    x=other.x+lengthdir_x(32,d)
    y=other.y+lengthdir_y(32,d)
}

if (active) {
    speed=0

    if (!other.dead) damage+=0.2+(abs(hsp)+abs(vsp))/8

    if (hsp=0 && vsp=0) sound_play("sndBlockBreakYuuutu")

    if (d<45 || d>=315) hsp=2
    if (d>=45 && d<135) vsp=-2
    if (d>=135 && d<225) hsp=-2
    if (d>=225 && d<315) {vsp=2 if (other.vspeed-vspeed>4 && !other.dead) damage+=1}

    vsp+=other.vspeed/2
    if (!other.dead) {
        other.dead=1
        with (other) carticles()
        other.image_index+=4
        other.gravity=0.05
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    dead=1
    Player.y=999
    kill_player()
    with (CarGoDown) {vspeed-=other.mapspeed if (dead) vspeed=0 gravity=0}
    with (CarGoUp) {vspeed-=other.mapspeed if (dead) vspeed=0 gravity=0}
    mapspeedspeed=-0.2

    speed=0

    image_index=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_text(10,10,timer)

image_angle=angle-90
draw_self()
if (save>150 && save<250) draw_sprite_ext(sprPlayerHead,difficulty==2,x,y,1,1,image_angle,$ffffff,1)
image_angle=0

dx=xstart
dy=ystart

if (shoot) {
    draw_set_halign(1)
    draw_text(x,y-48,"Shoot!")
    draw_set_halign(0)
}

if (fadehud<1) {
    draw_set_font(fArial12)
    draw_text(dx,dy,"Health:##Petrol:##Left: "+string(floor(dist/2))+"m##Bombs: (honk + shoot)")

    col=$ff
    if (damage<4) col=$ffff
    if (damage<2) col=$ff00
    draw_healthbar(dx+60,dy-1,dx+160,dy+19,100-damage/0.06,0,col,col,0,1,1)

    col=$ff
    if (petrol>300) col=$ffff
    if (petrol>700) col=$ff00
    draw_healthbar(dx+60,dy+37,dx+160,dy+57,petrol/10,0,col,col,0,1,1)

    for (i=0;i<tnt;i+=1) draw_sprite(sprTnt,0,dx+12+24*i,dy+152)

    i=0
    if (instance_exists(Player)) i=Player.key[key_jump]
    draw_sprite(sprWeapon,i,dx,dy-70)

    if (fadehud>0) {
        rect(dx,dy-80,180,250,rgb_to_bgr($735a42),fadehud)
    }
}

if (fade>0) {
    rect(0,0,room_width,room_height,0,fade)
}
