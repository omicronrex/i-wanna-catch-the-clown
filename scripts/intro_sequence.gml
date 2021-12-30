if (active) {
    timer+=1

    if (timer<100) {
        cutscene=1
        Player.sprite_index=sprPlayerDeadLmaoNo
    }
    if (timer==100) {
        with (Player) {player_jump() vspeed=-4}
    }
    if (timer<250) {
        Player.image_speed=0.1
    }
    if (timer==150) {
        Player.facing=-1
    }
    if (timer==200) {
        Player.facing=1
    }
    if (timer>100 && timer<250) {
        f=(timer-100)/150
        camera_set(Player.x,Player.y,cosine(4,2,f),0)
    }

    if (timer=250) {
        unlock_controls()
        camera_follow(Player)
        active=0
    }

    if (timer==251) {
        (instance_create(768,0,Block)).image_yscale=18
        lock_controls()
        play_bg_music("intro",0)
        camx=view_xcenter
        camy=view_ycenter
    }
    if (timer>300 && timer<450) {
        f=(timer-300)/150
        camera_set(cosine(camx,800+400,f),cosine(camy,304,f),cosine(2,1,f),0)
    }
    if (timer==499) {
        unlock_controls()
        active=0
    }
    if (timer=500) {
        active=0
        maxd=point_distance(Player.x,Player.y,IntroArtifact.x,IntroArtifact.y)-170
    }

    if (timer==501) {
        sound_play("blackhole")
    }

    if (timer>500 && timer<600) {
        f=(timer-500)/100
        IntroArtifact.x=lerp(IntroArtifact.xstart,Player.x+8,f)+choose(-1,1)
        IntroArtifact.y=lerp(IntroArtifact.ystart,Player.y-2,f)+choose(-1,1)
        IntroArtifact.image_xscale=0.5-f*0.45
        IntroArtifact.image_yscale=0.5-f*0.45
    }
    if (timer=600) {
        instance_destroy_id(IntroArtifact)
        if (difficulty==2) global.player_skin=skin_hard
        else global.player_skin=skin_normal
        global.player_weapon=weapon_default
        instance_create(Player.x+8,Player.y-2,Ripple)
        sound_play("bom")
    }
    if (timer=700) {
        bg=background_create_from_surface(application_surface,0,0,800,608,0,0)
        play_bg_music("Dreamscape",1)
        xc=(Player.x+8-view_xview)*(800/view_wview)
        yc=(Player.y-2-view_yview)*(608/view_hview)
    }
    if (timer==900) {
        instance_destroy_id(Player)
        room_goto(rTutorial)
    }
}

if (timer=500) {
    f=clamp(1-((point_distance(Player.x,Player.y,IntroArtifact.x,IntroArtifact.y)-150)/maxd),0,1)
    camera_set(800+400,cosine(304,424,f),cosine(1,2,f),0)
}
