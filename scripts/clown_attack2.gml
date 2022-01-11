if (timer=1) {
    //move to start
    vspeed=-4
    friction=0.075

    //erase bullets
    with (ClownpieceStar2) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownpieceStar3) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownMoon) {instance_destroy()}
    instance_destroy_id(ClownpieceStarMarker)
}

if (timer=100) {
    pop=1
}

//second attack
if (timer>160) {
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
    if ((timer-160) mod 150==75) {
        //dance
        speed=4
        friction=0.075
        direction=random(360)
        if (abs(x-xstart)>200) hspeed=abs(hspeed)*sign(xstart-x)
        if (abs(y-ystart)>20) vspeed=abs(vspeed)*sign(ystart-y)
        vspeed/=2
    }

    if ((timer-160) mod 150<16 && !(timer mod 3)) {
        //laser barrage 2
        f=(40-(timer-160) mod 150)/40
        i=instance_create(x,y,ClownLaserball)
        i.hspeed=-5*f*f*f
        i.vspeed=-2*f
        i.mode=-1
        i=instance_create(x,y,ClownLaserball)
        i.hspeed=5*f*f*f
        i.vspeed=-2*f
        i.mode=1

        i=instance_create(x,y,ClownLaserball)
        i.hspeed=-5*f*f
        i.vspeed=-2+6*f*f*f
        i.mode=-2
        i=instance_create(x,y,ClownLaserball)
        i.hspeed=5*f*f
        i.vspeed=-2+6*f*f*f
        i.mode=2
    }
}
