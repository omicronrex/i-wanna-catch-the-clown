if (timer=50) unlock_controls()
if (timer=100) {
    sound_play("sndTouhouAppear")
    play_bg_music("musPiss",1)
    with (instance_create(0,0,ClownpieceAppearTracer)) {
        path_start(pTouhouAppear1,2,0,1)
        color=$ff0000
    }
    with (instance_create(0,0,ClownpieceAppearTracer)) {
        path_start(pTouhouAppear2,2,0,1)
        color=$ff
    }
    with (instance_create(0,0,ClownpieceAppearTracer)) {
        path_start(pTouhouAppear3,2,0,1)
        color=$ff
    }
    with (instance_create(0,0,ClownpieceAppearTracer)) {
        path_start(pTouhouAppear4,2,0,1)
        color=$ff0000
    }
}

if (timer=200) {
    pop=1
    instance_create(x,y,Sigil)
    (instance_create(0,0,ClownTimeout)).time=time
}

if (timer>200 && timer<220) {
    sprite_index=sprClownPiece
    image_blend=merge_color($ff0000,$ffffff,f)
    f=min(1,f+0.1)
}

if (timer>200) {
    effect_create_below(ef_explosion,x+random_range(-10,10),y+random_range(-30,30),0,$ff00)
    effect_create_below(ef_smokeup,x+random_range(-20,20),y+random_range(-30,30),0,$ff8000)
    rad=min(150,rad+1)
}

//first attack
if (timer>260) {
    //torch slash
    if (timer mod 2) {
        sprayangle+=spraygo
        if (sprayangle>=360) {spraygo=-16 sprayangle=360-random(10)}
        if (sprayangle<=180) {spraygo=16 sprayangle=180+random(10)}
        i=instance_create(x,y,ClownpieceStar)
        i.speed=6
        i.direction=sprayangle
    }
    if (inst) sound_stop(inst)
    inst=sound_play("sndTouhouSlash")
    if ((timer-260) mod 150==75) {
        //dance
        speed=4
        friction=0.075
        direction=random(360)
        if (abs(x-xstart)>200) hspeed=abs(hspeed)*sign(xstart-x)
        if (abs(y-ystart)>20) vspeed=abs(vspeed)*sign(ystart-y)
        vspeed/=2
    }

    if ((timer-260) mod 150<16 && !(timer mod 3)) {
        //laser barrage
        f=(40-(timer-260) mod 150)/40
        i=instance_create(x,y,ClownLaserball)
        i.hspeed=-5*f*f*f
        i.vspeed=-2*f
        i=instance_create(x,y,ClownLaserball)
        i.hspeed=5*f*f*f
        i.vspeed=-2*f
    }
}
