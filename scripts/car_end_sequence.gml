fadehud+=0.05
timer+=1

if (!(timer mod 50)) instance_create(0,0,CarMountain)

if (win=1) {
    p=(sound_get_pos(global.musinst)-storepos)/(1-storepos)

    m=t
    t=(10050+950*p)

    if (t>10051 && m<=10051) instance_create(0,0,RaceEndPost)

    if (t>=10100 && t<=10150) {
        f=(t-10100)/50
        camera_set(400,304+cosine(0,200,f),1,0)
        background_y[0]+=(view_yview+304)-Racecar.y
        Racecar.y=mean(Racecar.y,view_yview+304)
    }
    if (t>=10150 && t<=10250) {
        f=(t-10150)/100
        camera_set(400,304+200,1,cosine(0,90,f))
    }

    if (t>=10250 && t<=10350) {
        f=(t-10250)/100
        camera_set(400+cosine(0,800,f),304+200,1,90)
    }

    if (t>=10350 && t<=10450) {
        RaceEndPost.second=1
        f=(t-10350)/100
        camera_set(400+cosine(800,600,f),304+200,1,90)
    }

    //end: 11100

    if (t<10450) {
        speed=0
        gravity=0
        x=inch(x,430,1)
        y=inch(y,304+200*(t>10100),2)
    }

    if (t>10450) {
        x+=sin(t/19) y+=sin(t/32)
    }

    if (t>10650 && m<=10650) {
        s=sound_play_paused("RVStart01")
        sound_set_pos(s,0.95/sound_get_length("RVStart01"))
        sound_resume(s)
    }
    if (t>=10650) {
        win=2
    }
}
if (win=2) {
    gravity=-0.05
    if (y<0) {
        depth=-1000
        fade+=0.01
        if (fade>=1.75) room_goto(room_diff(rDiamond3))
    }
}

if (t>10150) {
    RaceControl.sunx-=0.2
    RaceEndPost.post=1
}
