#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sel=0

xdraw=124
ydraw=132
xsep=550
ysep=32

option[0]="Music Volume"
option[1]="Sound Volume"
option[2]="Screen Mode"
option[3]="Fullscreen Filter"
option[4]="Bonk sound"
option[5]="Gravestone"
option[6]="Left+Right Mode"
option[7]="Keyboard Setup"
option[8]="Joystick Setup"
option_max=9

image_speed=0.2*dt
ycursor=ydraw+(ysep*sel)+18

dead=0

alarm[0]=30*dt

background_hspeed[1]=0.5
background_vspeed[1]=0.5

volumedelay=25  //delay to change volume precisely
volumefpi=5     //frames per volume change, this value is ignored after the volume delay
volumetimer=0

event_step()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=30/dt
if (sel==1) {
    i=instance_create(xdraw-18,ycursor-2,Bullet)
    i.hspeed=16*dt
    sound_play("sndShoot")
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.key_pressed[key_restart]) {
    dead=0
    instance_destroy_id(BloodEmitter)
    instance_destroy_id(Blood)
    instance_destroy_id(GibParticle)
    sound_stop("sndDeath")
}

if (global.key_pressed[key_shoot]) {
    sound_kind_stop(0)
    room_goto(rmMenu)
    exit
} else if (global.key_pressed[key_up] || global.key_pressed[key_down]) {
    sound_play("sndJump")
    sel=modwrap(sel+global.input_v,0,option_max)
    dead=0
    instance_destroy_id(BloodEmitter)
    instance_destroy_id(Blood)
    instance_destroy_id(GibParticle)
    sound_stop("sndDeath")
} else if (global.key_pressed[key_jump]) {
    if (sel==2) {
        sound_play("sndDJump")
        settings("fullscreen",!settings("fullscreen"))
        update_fullscreen()
    }
    if (sel==3) {
        sound_play("sndDJump")
        settings("filter",(settings("filter")+1) mod 3)
        vsync_a_bit()
        update_fullscreen()
    }
    if (sel==4) {
        sound_play("sndDJump")
        settings("bonk",!settings("bonk"))
    }
    if (sel==5) {
        settings("gore",(settings("gore")+1) mod 2)
        dead=1
        instance_destroy_id(Grave)
        play_sound("sndRenBonk")
        i=instance_create(xdraw-18,ycursor,RenGMExplosion)
        i.image_xscale=2 i.image_yscale=2
        i.depth=-11
        if (settings("gore")) instance_create(xdraw-18,ycursor,Grave)
    }
    if (sel==6) {
        sound_play("sndDJump")
        settings("l+r behavior",modwrap(settings("l+r behavior")+1,0,5))
    }
    if (sel==7) {
        sound_play("sndDJump")
        input_clear()
        instance_create(x,y,KeyboardMenu)
        instance_destroy()
    }
    if (sel==8 && joystick_count()) {
        sound_play("sndDJump")
        input_clear()
        instance_create(x,y,JoystickMenu)
        instance_destroy()
    }
} else if (global.input_h!=0) {
    if (sel==0) {
        if (volumetimer>volumedelay || !(volumetimer mod volumefpi)) {
            settings("musvol",median(0,settings("musvol")+global.input_h*0.01,1))
        }
        volumetimer+=1
        sound_kind_volume(1,settings("musvol"))
    }
    if (sel==1) {
        if (volumetimer>volumedelay || !(volumetimer mod volumefpi)) {
            settings("sfxvol",median(0,settings("sfxvol")+global.input_h*0.01,1))
        }
        volumetimer+=1
        sound_kind_volume(0,settings("sfxvol"))
        sound_kind_volume(3,settings("sfxvol"))
    }
} else {
    volumetimer=0
}

optext[0]=string(round(settings("musvol")*100))+"%"
optext[1]=string(round(settings("sfxvol")*100))+"%"
optext[2]=pick(settings("fullscreen"),"Window","Fullscreen")
optext[3]=pick(settings("filter"),"Off","Bilinear","Area x2")
optext[4]=pick(settings("bonk"),"Off","On")
optext[5]=pick(settings("gore"),"Off","On","","")
optext[6]=pick(global.leftright_moonwalk,pick(settings("l+r behavior"),"Flip","Stay","Stop","Left","Right"),"Moonwalk")
optext[7]=""
optext[8]=pick(!!joystick_count(),"no joys",string(joystick_count())+" joys")

if (sel=3 && settings("fullscreen")) background_visible[1]=1
else background_visible[1]=0

ycursor=inch(ycursor,ydraw+(ysep*sel)+18,16*dt)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///save settings
settings_write()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_halign(1)
draw_set_font(fntFileBig)
draw_set_color(0)
draw_text(400,64,"- Options -")

draw_set_halign(0) for (i=0;i<option_max;i+=1) draw_text(xdraw     ,ydraw+(ysep*i),option[i])
draw_set_halign(2) for (i=0;i<option_max;i+=1) draw_text(xdraw+xsep,ydraw+(ysep*i),optext[i])

if (!dead) draw_sprite(sprPlayerIdle,floor(image_index),xdraw-18,ycursor)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,556,"["+key_get_name(global.keycode[key_shoot])+"] Back")
draw_set_halign(1)
draw_text(400,556,re_version)
draw_set_halign(2)
draw_text(766,556,"["+key_get_name(global.keycode[key_jump])+"] Accept")
draw_set_halign(0)

draw_set_color($ffffff)
