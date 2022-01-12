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

    with (TouhouDead) exit
    with (TouhouHitbox) if (visible) exit
    with (ClownpieceDialogCtrl) if (visible) exit

    with (Clownpiece) {
        if (plrc) {
            plrc-=1
            instance_create(Player.x,Player.y,TouhouDead)
            sound_play("se_pldead00")
            TouhouGun.vspeed=-16
            TouhouGun.gravity=0.3
            lock_controls()
            Player.visible=0
            Player.x=Player.xstart
            Player.y=Player.ystart-1
            Player.speed=0
            exit
        }
        if (phase==10) exit
    }

    drop_items()

    if (room!=rRenClown) {
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
    }

    instance_create(view_xcenter,view_ycenter,GameOver)
    if (room=rRenClown) {
        GameOver.alarm[0]=80
        instance_create(Player.x,Player.y,TouhouDead)
        instance_create(Player.x,Player.y,Lolisplosion)
        sound_play("se_pldead00")
    } else {
        play_sound("sndRenBonk")
        i=instance_create(x,y,RenGMExplosion)
        i.image_xscale=2 i.image_yscale=2
        i.depth=-11
    }

    if (settings("gore")) instance_create(Player.x,Player.y,Grave)

    instance_destroy_id(Player)
    with (Trap) if (path_index!=-1) {path_end() hspeed=x-xprevious vspeed=y-yprevious}

    with (JokerKaboom) if (visible) {event_game_end()}
}
