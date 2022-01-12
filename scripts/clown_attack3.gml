if (timer=1) {
    //pan up to show earth
    ClownBg.mode=1
    //erase bullets
    sprite_index=sprClownPiece
    with (ClownpieceStar3) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaserDown) {repeat (250) {if (x>0 && x<800) effect_create_above(ef_spark,x,y,0,$ff00ff) x+=8} instance_destroy()}
}

if (timer=100) {
    pop=1
}

//third attack
if (timer>160) {
    //small torch slash
    if (timer mod 2) {
        sprayangle+=spraygo
        if (sprayangle>=360) {spraygo=-16 sprayangle=360-random(10)}
        if (sprayangle<=180) {spraygo=16 sprayangle=180+random(10)}
        i=instance_create(x,y,ClownpieceStar3)
        i.speed=6
        i.direction=sprayangle
        i.scale=0.5
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

    if ((timer-160) mod 150<50 && !(timer mod 8)) {
        //laser barrage 3!
        f=(120-(timer-160) mod 150)/120
        i=instance_create(x,y,ClownLaserball)
        i.hspeed=-5*f*f*f
        i.vspeed=-2*f
        i.mode=-1
        i.red=1
        i=instance_create(x,y,ClownLaserball)
        i.hspeed=5*f*f*f
        i.vspeed=-2*f
        i.mode=1
        i.red=1

        i=instance_create(x,y,ClownLaserball)
        i.hspeed=-5*f*f
        i.vspeed=-2+6*f*f*f
        i.mode=-2
        i.red=1
        i=instance_create(x,y,ClownLaserball)
        i.hspeed=5*f*f
        i.vspeed=-2+6*f*f*f
        i.mode=2
        i.red=1
    }
}
