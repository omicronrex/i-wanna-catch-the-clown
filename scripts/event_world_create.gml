gameclosing=0
closingvol=1
closingk=0

fading=0
fadefrom=1

stepcount=0
pause_delay=0

fpsa=0
monitorspeed=0
monitorresult=""

message=0
messagetext=""

message2=0
message2text=""

minalpha=0
curalpha=0
minclick=0

global.xp_mode=(windows_version==5)

if (global.xp_mode) {
    mincolor1=$e55500
    mincolor2=$ffffff
} else {
    mincolor1=window_get_caption_color()
    if (color_get_luminance(mincolor1)>128) mincolor2=0
    else mincolor2=$ffffff
}

input_init()

global.single_shot_music=0

global.viewangle=0
global.pause=false
global.music=""
global.perform_autosave=false

global.room_started=false

global.keylist=ds_map_create()

globalvar bullet_table;

bullet_table[0]=0
global.bullet_map=ds_map_create()

global.storetime=get_timer()/1000-current_time

globalvar difficulty;
difficulty=0

globalvar cpu_usage;

//one screen frame, in microseconds, with a 5% margin for error
oneframe=(1000000/display_get_frequency())*0.95
oldtime=hrt_time_now()

orderTest=2

camera_l=0
camera_t=0
memcaml=-1
memcamt=-1

camera_shakelength=0
camera_shaketime=0
camera_shakex=0
camera_shakey=0

mousex=0
mousey=0

activation_timer=0

globalvar view_xcenter,view_ycenter;

global.tilemodel=d3d_model_create()
global.lastroom=0
