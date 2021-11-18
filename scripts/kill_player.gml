if (!debug_code("godmode")) with (Player) {
    if (room=rmHub || room=rmHistory || room=rmIntro || room=rmSecretEnd) exit

    if (instance_exists(GMShip)) {
        if (!GMShip.active || GMShip.flash) exit
        if (GM3DLives.count>0) {
            GM3DLives.count-=1
            with (GMShip) event_user(0)
            exit
        }
    }

    with (Herman) if (speak) exit

    drop_items()

    if (global.gameover_music_play) {
        sound_kind_stop(1)
        sound_play("m-r-tight")
    }
    if (global.gameover_music_stop) {
        sound_kind_stop(1)
    } else if (global.gameover_music_fade) {
        World.fading=1
    } else if (global.gameover_music_pause) {
        sound_kind_pause(1)
    }

    instance_create(view_xcenter,view_ycenter,GameOver)
    play_sound("sndRenBonk")
    i=instance_create(x,y,RenGMExplosion)
    i.image_xscale=2 i.image_yscale=2
    i.depth=-11

    if (settings("gore")) instance_create(Player.x,Player.y,Grave)

    instance_destroy_id(Player)
    with (Trap) if (path_index!=-1) {path_end() hspeed=x-xprevious vspeed=y-yprevious}

    savedata("deaths",savedata("deaths")+1)

    with (JokerKaboom) if (visible) {settings("joker",1) event_game_end()}
}
