//move to top center of screen
x=(x*19+400)/20
y=(y*19+160)/20

if (timer=1) {
    //erase bullets
    with (ClownpieceStar3) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaserball) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaser) {repeat (75) {effect_create_above(ef_spark,x,y,0,$ff00ff) x+=lengthdir_x(8,image_angle) y+=lengthdir_y(8,image_angle)} instance_destroy()}

    //activate spellcard 4: laser ladder 2
    sprite_index=sprClownPieceCasting
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
    vulnerable=1
}

k=(timer-200) mod 360

if (timer>200 && !(timer mod 15)) {
    if (k<=90) {
        //laser ladder attack
        sound_play_single("sndTouhouLazer")
        j=instance_create(32,680-k*7,ClownLaserDown)
        j.vspeed=0.5
        j=instance_create(800-32,k*7,ClownLaserLeft)
        j.vspeed=-0.5
    }
    if (k>=180 && k<270) {
        //laser ladder attack
        sound_play_single("sndTouhouLazer")
        j=instance_create(32,(k-180)*7,ClownLaserDown)
        j.vspeed=-0.5
        j=instance_create(800-32,680-(k-180)*7,ClownLaserLeft)
        j.vspeed=0.5
    }
}
