//engine initialization

if (orderTest==2) {
    show_error(
        "Creation code order needs to be reversed for this engine to work."+lf+
        "Please enable the option in GGS->Code Options in GM 8.2."+lf+lf+
        "If you're using GM 8.1, move the included winspool.drv file into your Game Maker folder and reopen it.",
        true
    )
    exit
}

global.num_difficulties=0

engine_settings()

global.optimize_solids=median(0,global.optimize_solids,8)
global.break_sfx=pick(global.break_sound_effect,"sndBlockBreak","sndBlockBreakYuuutu","sndBlockBreakYosniper")

set_application_title(global.game_title)
draw_set_color($ffffff)

global.infocus=true

//you can multiply things by dt to get the correct 50hz animation speed
globalvar dt;
dt=50/global.game_speed

//global variables for player state
globalvar cutscene,frozen;
cutscene=false
frozen=false

//funny bass boosted mode
if (global.iwbtg_sound_mode) {
    global.gain=1
    sound_effect_options(sound_kind_effect(0,se_gargle),0,0.5)
    sound_effect_options(sound_kind_effect(1,se_gargle),0,0.5)
}

//load external sound assets
//sfx (uncompressed, multi instance)
sound_add_directory("Data\sounds\",".wav",0,1)

//streamed sfx (compressed, multi instance)
sound_add_directory("Data\sounds\",".ogg",0,1)

//music (compressed,streamed)
sound_add_directory("Data\music\",".ogg",1,1)
sound_add_directory("Data\music\",".mp3",1,1)
sound_add_directory("Data\music\",".mod",1,1)
sound_add_directory("Data\music\",".s3m",1,1)

list_loop_points()
sound_global_volume(global.gain)

//init and load settings and savedata

savefolder=working_directory+"\Save\"
directory_create(savefolder)

var exe_name;exe_name=filename_change_ext(filename_name(parameter_string(0)),"")

global.setfile=savefolder+exe_name+".cfg"
global.savefile=savefolder+exe_name+".sav"
global.backfile=savefolder+exe_name+".sav.bak"
global.statfile=savefolder+exe_name+"_stats_"
global.shotfolder=savefolder+"screenshots\"

global.setmap=ds_map_create()
global.savemap=ds_map_create()
global.statgridh=1
global.statgrid=ds_grid_create(3,1)
ds_grid_set(global.statgrid,0,0,"Save:")
ds_grid_set(global.statgrid,1,0,"Resets:")
ds_grid_set(global.statgrid,2,0,"Time:")
settings_read()
savedata_read()

debug_code("game start")

//graphics setup
envelope_init()
doVsync=!(global.dz mod 60 == 0)
//set_synchronization(settings("vsync"))
update_fullscreen()
instance_create(0,0,Ortho)
for (i=room_first;i!=-1;i=room_next(i)) {
    room_set_view_enabled(i,1)
    room_set_view(i,0,1,0,0,global.width,global.height,0,0,global.width,global.height,0,0,0,0,noone)
}

//uhhhh break cherry sprites i guess
if (!global.use_original_cherries) {
    sprite_assign(sprCherry,sprCherryOld)
    sprite_assign(sprCherryRainbow,sprCherryRainbowOld)
    sprite_assign(sprCherryPink,sprCherryPinkOld)
    sprite_assign(sprCherryOrange,sprCherryOrangeOld)
    sprite_assign(sprCherryMagenta,sprCherryMagentaOld)
    sprite_assign(sprCherryViolet,sprCherryVioletOld)
    sprite_assign(sprCherryBlue,sprCherryBlueOld)
    sprite_assign(sprCherryAzure,sprCherryAzureOld)
    sprite_assign(sprCherryCyan,sprCherryCyanOld)
    sprite_assign(sprCherryEmerald,sprCherryEmeraldOld)
    sprite_assign(sprCherryGreen,sprCherryGreenOld)
    sprite_assign(sprCherryChartreuse,sprCherryChartreuseOld)
    sprite_assign(sprCherryYellow,sprCherryYellowOld)
    sprite_assign(sprCherryGray,sprCherryGrayOld)
    sprite_assign(sprCherryWhite,sprCherryWhiteOld)
    sprite_assign(sprCherryBlack,sprCherryBlackOld)
}

list_avoidance_bullets()

dir=working_directory+"\data\backgrounds\"
background_replace(bgRenSpace,dir+"bgRenSpace.jpg",0,0)
background_replace(bgRenDay,dir+"bgRenDay.jpg",0,0)
background_replace(bgRenEvening,dir+"bgRenEvening.jpg",0,0)
background_replace(bgRenStars,dir+"bgRenStars.jpg",0,0)
background_replace(bgRenNight,dir+"bgRenNight.jpg",0,0)
background_replace(bgRenWater,dir+"bgRenWater.jpg",0,0)

global.song=""

global.cubemod=d3d_model_create()
d3d_model_block(global.cubemod,-16,-16,-16,16,16,16,1,1)

//let's go away
if (settings("volcheck")) {
    room_goto_next()
} else {
    instance_create(0,0,VolCheck)
}
