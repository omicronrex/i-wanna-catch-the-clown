//move to center of screen
x=(x*19+400)/20
y=(y*19+304)/20

if (timer=1) {
    //activate spellcard 5: 3 moons
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
    instance_create(x,y,ClownMoon2)
    (instance_create(x,y,ClownMoon2)).angle+=120
    (instance_create(x,y,ClownMoon2)).angle+=240
    sound_play("sndTouhouMoon")
    velocity=0
    delay=50
}

if (timer>200) {
    velocity+=1
    if (velocity>delay) {
        velocity=0
        delay=max(20,delay-1)
        i=sound_play_paused("se_tan00")
        sound_volume(i,0.5)
        sound_resume(i)
        with (ClownMoon2) {
            k=random(360)
            for (i=0;i<360;i+=360/20) {
                instance_create_moving(x,y,ClownpieceStar4,30,i+k)
            }
        }
    }
}
