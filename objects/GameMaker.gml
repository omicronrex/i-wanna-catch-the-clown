#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0
flash=0

state="wait"

shootclown=0
shootskull=0
getcandy=0

hp=100
timer=0
legged=0
smoken=0

ls=0
go=0
broken=0

memvx=0
memvy=0

getshot=0
perch=0
canhit=0

bag=ds_list_create()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (GMCeiling) if (!broken) {
    if (side=-1) {
        for (i=1;i<25;i+=1) instance_create(x,y-32*i,DeathBlocksL)
    }
    if (side=1) {
        for (i=1;i<25;i+=1) instance_create(x,y-32*i,DeathBlocksR)
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1
ground=608-32

if (smoken) if (!irandom(8)) effect_create_above(ef_smokeup,x+random_range(-96,96),y+random_range(-64,64),1,$c0c0c0)

if (state="dead") {
    if (x<32+95) {
        hspeed=4
    }
    if (x>800-32-95) {
        hspeed=-4
    }

    if (timer=0) {
        play_sound("sndRenExplode")
        camera_shake(16)
    }
    if (timer<150) {
        vspeed+=0.2
        if (y>ground-60) {
            hspeed=0
            vspeed=vspeed*-0.6
            y=ground-60
            if (vspeed<-2) {
                play_sound("sndRenExplode")
                camera_shake(8)
            }
        }
        if (!irandom(8)) {
            instance_create(x+random_range(-96,96),y+random_range(-64,64),GMBossExplosion)
            play_sound("sndRenExplode2")
        }

        image_angle+=angle_difference(image_angle,20)*0.1
    } else if (timer<250) {
        speed=0
        image_angle+=angle_difference(image_angle,0)*0.1
        y-=1
    } else if (timer=250) {
        instance_create(x,y,GMShipMaker)
    } else vspeed-=0.4
    exit
}

if (hp<=0) {
    with (gm_leg) {hspeed=random_range(-3,3) vspeed=-random(5) gravity=0.2}
    with (gm_wheel) {hspeed=random_range(-3,3) vspeed=-random(5) gravity=0.2}
    state="dead"
    gravity=0
    timer=0
}

h=ground-y

if (state="wait") {
    timer=0
}

if (state="begin") {
    state="phase1"
    play_bg_music("musRenBoss",1)
    path_start(pGameMaker,8,1,1)
}

if (state="phase1") {
    path_speed=4+(8+4*(difficulty==2))*(100-hp)/100
    if (!(timer mod 50)) {
        if (ds_list_empty(bag)) {
            ds_list_add(bag,GMSkull1)
            ds_list_add(bag,GMSkull1)
            ds_list_add(bag,GMSkull2)
            ds_list_add(bag,GMBall)
            ds_list_add(bag,GMBall)
            ds_list_add(bag,GMClown)
            ds_list_add(bag,GMClown)
            ds_list_add(bag,GMClown)
            ds_list_add(bag,GMBonus)
            ds_list_shuffle(bag)
        }
        instance_create(x,y,ds_list_find_value(bag,0))
        ds_list_delete(bag,0)
    }
    if (hp<=75 && !perch) {
        perch=1
        path_end()
        state="perch"
        with (ShovelBoss) event_user(0)
    }
    if (hp<=25) {
        hp=25
        with (GMSkull1) {instance_create(x+16,y+16,RenGMExplosion) instance_destroy()}
        with (GMSkull2) {instance_create(x+16,y+16,RenGMExplosion) instance_destroy()}
        with (GMClown) {instance_create(x+16,y+16,RenGMExplosion) instance_destroy()}
        with (GMBall) {instance_create(x+16,y+16,RenGMExplosion) instance_destroy()}
        with (GMBonus) {instance_create(x+16,y+16,RenGMExplosion) instance_destroy()}
        path_end()
        speed=0
        state="ouchie"
        timer=0
    }
}

if (state="perch") {
    move_towards_point(400,352,4)
    if (point_distance(x,y,400,352)<4) {
        getshot=1
        x=400
        y=352
        state="perched"
        canhit=1
        timer=0
        speed=0
    }
}

if (state="perched") {
    image_angle=sin(timer/10)*10
    if (!(timer mod (12-2*difficulty))) {
        instance_create_moving(x,y,GMRegdemo,4+timer/50,45+random(90))
    }
    if (timer>300) {
        state="returns"
        canhit=0
        getshot=0
    }
    if (hp<55) {
        state="ouchie"
        timer=101
        canhit=0
        hp-=10
        getshot=0
    }
}

if (state="ouchie") {
    image_angle=sin(timer/5)*15
    if (!irandom(4)) {
        instance_create(x+random_range(-96,96),y+random_range(-64,64),GMBossExplosion)
        play_sound("sndRenExplode2")
    }
    if (timer=100) {
        smoken=1
        state="open up"
    }
    if (timer=200) {
         state="returns"
    }
}

if (state="returns") {
    image_angle+=angle_difference(image_angle,0)*0.1
    move_towards_point(xstart,ystart,4)
    if (point_distance(x,y,xstart,ystart)<4) {
        state="phase1"
        path_start(pGameMaker,8,1,1)
    }
}

if (state="open up") {
    if (!legged) {
        legged=1
        leg1=instance_create(x,y,gm_leg)
        leg2=instance_create(x,y,gm_leg)
        leg3=instance_create(x,y,gm_leg)

        leg4=instance_create(x,y,gm_leg)
        leg5=instance_create(x,y,gm_leg)
        leg6=instance_create(x,y,gm_leg)

        wheel1=instance_create(x,y,gm_wheel)
        wheel2=instance_create(x,y,gm_wheel)
    }

    image_angle+=angle_difference(image_angle,0)*0.1
    ls=min(1,ls+0.03)
    if (ls=1) state="fall"
}

if (state="fall") {
    vspeed+=0.2
    if (h<150) {
        state="menacing"
        timer=0
        speed=0
        camera_shake(16)
        play_sound("metal2short")
    }
}

if (state="menacing") {
    if (timer=50)
        state="getup"
}

if (state="getup")  {
    y-=1
    if (h>180) {
        state="roll"
        if (instance_exists(Player)) go=0.5*sign(x-Player.x)
    }
}

if (state="roll") {
    hspeed+=go
    image_angle=sin(timer/15)*5
    if (gravity=0 && h<170) y-=1
    if (x>800-32-95) {
        go=0
        x=800-32-95
        camera_shake(16)
        play_sound("sndRenBossWall")
        hp-=5
        effect_create_above(ef_firework,x+64,y,1,$ffff)
        flash=20
        vspeed=-4
        hspeed=-3
        gravity=0.2
    }
    if (x<32+95) {
        go=0
        x=32+95
        camera_shake(16)
        play_sound("sndRenBossWall")
        hp-=5
        flash=20
        effect_create_above(ef_firework,x-64,y,1,$ffff)
        vspeed=-4
        hspeed=3
        gravity=0.2
    }
    if (h<170) {
        gravity=0
        speed=0
        if (instance_exists(Player)) {
            if (x>400) go=-0.5 else go=0.5
        }
    }
}

h=min(160,ground-y-30)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state!="dead" && legged) {
    slide_towards(wheel1,x-80*ls,y+h*ls)
    slide_towards(wheel2,x+80*ls,y+h*ls)

    wheel1.y=min(wheel1.y,ground-30)
    wheel2.y=min(wheel2.y,ground-30)

    leg1.x=(x*3+wheel1.x)/4-16 leg1.y=(y*3+wheel1.y)/4
    leg2.x=(x+wheel1.x)/2-32 leg2.y=(y+wheel1.y)/2-8
    leg3.x=(x+wheel1.x*3)/4-16 leg3.y=(y+wheel1.y*3)/4

    leg4.x=(x*3+wheel2.x)/4+16 leg4.y=(y*3+wheel2.y)/4
    leg5.x=(x+wheel2.x)/2+32 leg5.y=(y+wheel2.y)/2-8
    leg6.x=(x+wheel2.x*3)/4+16 leg6.y=(y+wheel2.y*3)/4
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) killPlayer()
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (canhit) {
    play_sound("sndBlockBreakYuuutu")
    if (difficulty=0) hp-=2
    else hp-=1
    with (other) instance_destroy()
} else if (other.vspeed=0){
    sound_play("beep4")
    other.direction+=choose(135,-135)
}

getshot=0
#define Collision_GMBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) event_user(0)
#define Collision_GMCeiling
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.nond) {
    if (!broken) {
        broken=1
        play_sound("metal2short")
        camera_shake(16)
        alarm[0]=10
    }

    with (other) event_user(0)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ds_list_destroy(bag)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hp>0 && active) draw_healthbar(8,8,800-8,24,hp,0,$ff,$ff,0,1,1)

if (state="dead" && timer>150) {
    draw_sprite_ext(sprGMFlame,timer,x-40,y+40,2,2,155,$ffffff,1)
    draw_sprite_ext(sprGMFlame,timer,x+40,y+40,2,2,205,$ffffff,1)
}

draw_set_font(fArial13)
draw_set_halign(1)
if (!shootclown) with (GMClown) draw_text(x+16,y-32,"Shoot!")
if (!shootskull) with (GMSkull2) draw_text(x,y-48,"Shoot!")
if (!getcandy) with (GMBonus) draw_text(x+16,y-32,"Get!")

if (getshot) draw_text(x,y-92,"Shoot!")
draw_set_halign(0)

if (flash) {
    if (flash mod 5<3)
        d3d_set_fog(1,$ffffff,0,0)
}
draw_self()
if (flash) {
    d3d_set_fog(0,0,0,0)
    flash-=1
}
