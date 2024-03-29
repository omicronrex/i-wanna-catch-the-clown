var yes;

//game closing animation
if (gameclosing) {
    closingvol=max(0,closingvol*0.9)
    sound_global_volume(closingvol*global.gain)
    if (closingvol<=0.025) game_end()

    closingk=!closingk
    if (closingk) {
        window_set_region_scale(1,1)
        window_set_region_size(global.width,ceil(global.height*sqr(closingvol)),1)
        window_center()
    }

    draw_clear(merge_color(0,$ffffff,1-closingvol))
    window_set_color(merge_color(0,$ffffff,1-closingvol))
    screen_refresh()

    exit
}

global.infocus=window_has_focus()

//vsync test
if (monitorspeed) {
    message=200
    messagetext="vSync testing"+string_repeat(".",floor(((300-monitorspeed)/12) mod 4))
    monitorspeed-=1
    if (monitorspeed<200) {
        fpssum+=fps_real
        if (monitorspeed<=0) {
            if (fpssum/200<global.game_speed*0.95) {
                settings("vsync",-1)
                set_synchronization(0)
                messagetext="vSync test failed!"
            } else messagetext="vSync OK!"
        }
    }
}

if (message) message-=1
if (message2) message2-=1

//music fade
if (fading) {
    fadefrom-=0.01
    sound_kind_volume(1,settings("musvol")*fadefrom)
    if (fadefrom<=0) {
        fading=0
        //pause when it's done fading if pause is on
        if (global.gameover_music_pause) {
            sound_kind_pause(1)
        }
    }
}

if (fps_real) cpu_usage=ceil(min(1,room_speed/fps_real)*100)

if (keyboard_check_pressed(vk_f1) && (room==rmTitle || room==rmMenu || room==rmOptions || room==rAfterlife)) show_info()

if (is_ingame()) {
    //advance game time
    if (instance_exists(Player) && !instance_exists(TimerFreeze)) {
        time=savedata("time")+50/room_speed
        savedata("time",time)
    }

    update_caption_deathtime()

    if (!instance_exists(ClownPortal) && !instance_exists(AreaNamer)) {
        //pause
        if (pause_delay<=0) {
            if (global.key_pressed[key_menu]) {
                if (!global.pause) {
                    instance_create(0,0,PauseMenu)
                } else {
                    instance_destroy_id(PauseMenu)
                }
            }
        } else {
            pause_delay-=1
        }
    }
}   

//toggle mute
if (keyboard_check_pressed(ord("M"))) {
    var storevol;storevol=settings("stored mus vol")
    settings("stored mus vol",settings("musvol"))
    settings("musvol",storevol)
    sound_kind_volume(1,settings("musvol"))
    if (storevol>0) message2text="Unmuted music"
    else message2text="Muted music"
    message2=300
}      

//exit checks
if (keyboard_check_pressed(vk_escape)) {
    if (global.esc_always_quits) {
        event_game_end()
    } else if (is_ingame()) {
        if (global.pause) {
            instance_destroy_id(PauseMenu)
        } else if (room!=rAfterlife) {
            if (is_ingame() && !instance_exists(TimerFreeze)) {
                savedata("deaths",savedata("deaths")+1)
            }
            savedata_write()
            instance_destroy_id(Player)
            room_goto(rmTitle)
        }
    } else {
        if (room=rmMenu) room_goto(rmTitle)
        else event_game_end()
    }
}

//go to title
if (keyboard_check_pressed(vk_f2)) {
    yes=1
    with (JokerKaboom) if (visible) yes=0
    with (Herman) if (speak) yes=0
    if (yes && is_ingame() && room!=rmSecretEnd) {
        instance_destroy_id(PauseMenu)
        if (is_ingame() && !instance_exists(TimerFreeze)) {
            savedata("deaths",savedata("deaths")+1)
        }
        savedata_write()
        instance_destroy_id(Player)
        room_goto(rmTitle)
    } else room_goto(rmTitle)
}

//close game
if (keyboard_check_pressed(vk_f4) && keyboard_check(vk_alt)) {
    event_game_end()
}

//fullscreen toggle
if ((keyboard_check(vk_alt) && keyboard_check_pressed(vk_return)) || keyboard_check_pressed(vk_f11) || (keyboard_check_pressed(vk_f4) && !keyboard_check(vk_alt))) {
    settings("fullscreen",!settings("fullscreen"))
    update_fullscreen()
    input_clear()
}

//die key
if (global.key_pressed[key_die] && !cutscene) {
    yes=1
    with (JokerKaboom) if (visible) yes=0
    with (Herman) if (speak) yes=0
    if (yes && room!=rmIntro) kill_player()
}

//restart
if (global.key_pressed[key_restart]) {
    yes=1
    with (GM3DLives) if (instance_exists(Player)) yes=0
    with (JokerKaboom) if (visible) yes=0
    with (Herman) if (speak) yes=0
    if (yes && is_ingame() && !global.pause && room!=rmIntro && room!=rmSecretEnd) {
        sound_kind_stop(0)
        if (!instance_exists(TimerFreeze)) savedata("deaths",savedata("deaths")+1)
        savedata_load()
    }
}

//take a screenshot
if (keyboard_check_pressed(vk_f9)) {
    directory_create(global.shotfolder)
    var fn,i;
    fn=global.shotfolder+current_date_filename()+".png"
    i=1
    while (file_exists(fn)) {
        i+=1
        fn=global.shotfolder+current_date_filename()+" ("+string(i)+").png"
    }
    if (global.rw!=global.width || global.rh!=global.height) {
        if (surface_exists(application_surface)) {
            surface_save(application_surface,fn)
        } else {
            screen_save(fn)
        }
    } else {
        screen_save(fn)
    }
    message=300
    messagetext="Screenshot saved"
}

//debug keys
debug_code("world step")

//speedhack detection
var t;t=get_timer()/1000
if (t-current_time>global.storetime+200) game_end()
global.storetime=min(global.storetime,t-current_time)
