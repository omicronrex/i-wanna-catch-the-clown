//move to center of screen
x=(x*19+400)/20
y=(y*19+260)/20

if (timer=1) {
    //erase old bullets
    with (ClownpieceStar) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaserball) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaser) {repeat (75) {effect_create_above(ef_spark,x,y,0,$ff00ff) x+=lengthdir_x(8,image_angle) y+=lengthdir_y(8,image_angle)} instance_destroy()}

    //activate spellcard 1: moon star
    sound_play("sndTouhouSpell")
    instance_create(x,y,ClownPopIn)
    instance_create(0,0,Clownspellcard)
    spellcardbg=1
}

if (timer<10) repeat (3) {
    f=min(1,f+0.1)
    l=random_range(300,500)
    d=random(360)
    instance_create(x+lengthdir_x(l,d),y+lengthdir_y(l,d),ClownPopParticlesIn)
}

if (timer=100) {
    //moon blocker
    instance_create(x,y,ClownMoon)
    instance_create(x,y,ClownpieceStarMarker)
    sound_play("sndTouhouMoon")
    angle2=180
}
if (timer>150) {
    //big fast asterisk
    angle+=0.4
    angle2+=0.9
    len=(len*19+120)/20
    sx=x+lengthdir_x(len,angle2)
    sy=y+lengthdir_y(len,angle2)
    ClownpieceStarMarker.x=sx
    ClownpieceStarMarker.y=sy
    for (j=0;j<360;j+=360/8) {
        i=instance_create(sx,sy,ClownpieceStar2)
        i.speed=16
        i.direction=j+angle
    }
    if (timer mod 2) sound_play_single("se_kira00")
}
if (timer>=550) if ((timer mod 100) == 50) {
    //circular bursts
    for (j=0;j<360;j+=360/16) {
        i=instance_create(x,y,ClownpieceStar3)
        i.speed=2
        i.direction=j
    }
}
