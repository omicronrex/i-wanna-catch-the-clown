#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_xscale=-1
col=$ffffff
snd=-1
open=0

if (instance_exists(Player)) if (!Player.visible) {
    Player.x=PlayerStart.x
    Player.y=PlayerStart.y
    lock_controls()
    alarm[5]=100
    alarm[0]=180
    alarm[1]=250
    alarm[2]=280
    alarm[3]=330
    alarm[4]=2
    play_bg_music("",0)

    se=sound_kind_effect(1,se_lowpass)
    sound_effect_options(se,0,440)
    snd=sound_play_paused("caramell")
    sound_volume(snd,0)
    sound_pan(snd,1)
    sound_resume(snd)
    vol=0

    instance_create(0,0,CarFade)

    exit
}

x-=80
play_bg_music(room_songs(room_base(room)),1)

se=-1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Player.visible=1
Player.x=x-32
Player.y=y+16
Player.vspeed=-3
Player.facing=-1
sound_play("car_door")
open=1
sound_effect_destroy(se) se=-1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
se=sound_kind_effect(1,se_lowpass)
sound_effect_options(se,0,440)
sound_play("car_door")
open=0
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_kind_stop(1)
sound_effect_destroy(se) se=-1
sound_play("396448__hz37__car-lock")
alarm[4]=-1
col=$ffffff
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_bg_music(room_songs(room_base(room)),1)
unlock_controls()
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[4]=18
col=make_color_hsv((current_time) mod 255,255,255)
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=-4
friction=0.1
sound_play("RVStop01")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (snd!=-1) {
    vol=min(1,vol+1/100)
    sound_volume(snd,vol)
    sound_pan(snd,1-0.5*vol)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (se!=-1) sound_effect_destroy(se)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_sprite_ext(sprite_index,1,x,y,-1,1,0,col,1)
if (open) draw_sprite_ext(sprite_index,2,x,y,-1,1,0,$ffffff,1)
