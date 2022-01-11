//move to top center of screen
x=(x*19+400)/20
y=(y*19+160)/20

if (timer=1) {
    //erase bullets
    with (ClownpieceStar3) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaserball) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaser) {repeat (75) {effect_create_above(ef_spark,x,y,0,$ff00ff) x+=lengthdir_x(8,image_angle) y+=lengthdir_y(8,image_angle)} instance_destroy()}

    //activate spellcard 3: graze waves
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

if ((timer mod 100)==50) {
    k=random(360)
    for (i=0;i<360;i+=4) {
        j=instance_create_moving(x,y,ClownpieceGrazeBullet,2,i+k)
        j.fac=0.95
        j.ms=0.5
    }
}

if ((timer mod 100)==70) {
    k=random(360)
    for (i=0;i<360;i+=360/32) {
        instance_create_moving(x,y,ClownpieceGrazeBullet,2,i+k)
    }
}
