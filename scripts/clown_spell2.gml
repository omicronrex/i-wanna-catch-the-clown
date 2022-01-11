//move to top center of screen
x=(x*19+400)/20
y=(y*19+160)/20

if (timer=1) {
    //erase bullets
    with (ClownpieceStar) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaserball) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaser) {repeat (75) {effect_create_above(ef_spark,x,y,0,$ff00ff) x+=lengthdir_x(8,image_angle) y+=lengthdir_y(8,image_angle)} instance_destroy()}

    //activate spellcard 2: laser staircase
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

if (timer>150 && !(timer mod 10)) {
    //falling stars
    i=sound_play_paused("se_tan00")
    sound_volume(i,0.2)
    sound_resume(i)
    repeat (2) {
        i=instance_create(random_range(30,800-32),random_range(32,128),ClownpieceStar3)
        i.vspeed=2+random(0.5)
    }
}
if (timer>200 && (timer-200) mod 250<130 && !(timer mod 15)) {
    //laser ladder attack
    sound_play_single("sndTouhouLazer")
    instance_create(32,608-((timer-200) mod 250)*6,ClownLaserDown)
}
