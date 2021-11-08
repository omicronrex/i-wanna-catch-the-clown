///play_bg_music(track,loop)

if (argument0="") {
    sound_kind_stop(1)
} else if (global.music!=argument0 || global.restarting_music) {
    if (argument1) global.musinst=sound_loop(argument0)
    else global.musinst=sound_play(argument0)
    if (room!=rmIntro) {
        with (instance_create(x,y,SongNamer)) {
            text=song_names(argument0)
            event_user(0)
        }
    }
}
global.music=argument0

sound_kind_volume(1,settings("musvol"))
sound_kind_resume(1)
