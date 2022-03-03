if (flash) flash-=1

if (y>ystart && vspeed>0) {
    friction=0.5
    gravity=0
    if (!started) {
        started=1
        invincible=0
        left=instance_create(x,y,GMShield)
        right=instance_create(x,y,GMShield)
    }
}

blend=min(1,blend+0.01)

if (fakeout) {
    timer=0
    fakeout+=1
    if (fakeout<50) flash=fakeout mod 2
    if (fakeout=50) {
        play_sound("sndRenGlass")
        repeat (50) instance_create(x+random_range(-32,32),y+random_range(-32,32),GMBossGlass)
        phase=2
        shotcount=150
    }
    if (fakeout=100) {
        clownbad=1
        effect_create_above(ef_ring,x,y,2,$ffffff)
        play_sound("sndLol")
    }
    if (fakeout=150) {
        fakeout=0
        invincible=0
        speedup=1
    }
}

if (speedup==1) {
    muspeed=min(1,muspeed+0.05)
    sound_kind_pitch(1,lerp(1,twelfthroot*twelfthroot,muspeed))
    if (muspeed=1) speedup=2
}

if (started && !dead) {
    if ((hp<=200 || (left.dead && right.dead)) && phase=1 && !fakeout) {
        fakeout=1
        invincible=1
    }

    bepis+=max(0,1-fakeout/50-dying/100)

    xp=x
    x=(x*9+xstart+200*sin(bepis*0.02))/10
    y=(y*9+ystart+40*sin(bepis*0.04))/10

    if (phase<3) {
        if (phase>1 && timer>60*7) {
            rad=250
            spinn+=5
            left.spinner=1
            right.spinner=1
            if (spinn>360*2) {
                left.spinner=2
                right.spinner=2
            }
            if (spinn>360*5.5) {
                timer=0
                left.spinner=0
                right.spinner=0
                spinn=0
                tmp=left
                left=right
                right=tmp
            }
            if ((spinn mod 360)<180) {
                left.depth=4
                right.depth=6
            } else {
                left.depth=6
                right.depth=4
            }
        } else {
            if (phase>1) rad=220
            else rad=150
            left.depth=6
            right.depth=6
        }

        left.x=(left.x*9+x+(x-xp)*5-rad*dcos(spinn))/10
        right.x=(right.x*9+x+rad*dcos(spinn))/10

        left.y=(left.y*4+y-40)/5
        right.y=(right.y*4+y-40)/5

        left.image_angle-=5+5*!!speedup-dying/20
        right.image_angle+=5+5*!!speedup-dying/20

        if (left.dead) left.y=9999
        if (right.dead) right.y=9999
    }
}

if (!dying && phase<2 && straightsalvo && instance_exists(Player)) {
    straightsalvo+=1

    if (straightsalvo==10) {
        effect_create_above(ef_ring,x,y,2,$ffffff)
        sound_play("tink")
    }

    if (straightsalvo==100 || straightsalvo==150 || straightsalvo==200 || straightsalvo==250) {
        p=instance_create(x,y,StraightLineSpawner)
        p.dir=direction_to_object(Player)
        sound_play("zap")
    }

    if (straightsalvo==251) straightsalvo=0
}

if (phase==2) if (hp<100 || (left.dead && right.dead)) {
    effect_create_above(ef_ring,x,y,2,$ffffff)
    sound_play("tink")
    phase=3
    left.dying=1
    right.dying=1
    shotcount=450
}

if (!dying && !fakeout && started) {
    shotcount+=1

    if (phase=1) {
        if (shotcount==200 || shotcount==210 || shotcount==220 || shotcount==230 || shotcount==240) {
            effect_create_above(ef_ring,x-80,y+50,0,$ffffff)
            effect_create_above(ef_ring,x+80,y+50,0,$ffffff)
        }
        if (shotcount==250) {
            instance_create_moving(x-80,y+50,CaveBullet4,12,270)
            instance_create_moving(x+80,y+50,CaveBullet4,12,270)
            sound_play("zap")
        }
        if (shotcount==300) {
            instance_create_moving(x-80,y+50,CaveBullet4,12,270)
            instance_create_moving(x+80,y+50,CaveBullet4,12,270)
            sound_play("zap")
            shotcount=0
        }
    }
    if (phase=3) {
        if (!(shotcount mod 100) && shotcount>100 && shotcount<800) {
            instance_create_moving(x+80,y-50,Seekers,12,45)
            instance_create_moving(x-80,y-50,Seekers,12,135)
            instance_create_moving(x+60,y-60,Seekers,12,60)
            instance_create_moving(x-60,y-60,Seekers,12,120)
            sound_play("laser5")
        }

        if (shotcount=500 || shotcount=750) {
            effect_create_above(ef_ring,x,y,2,$ffffff)
            sound_play("tink")
        }
        if (shotcount=550) {
            (instance_create_moving(x,y,Hammer2,8,0)).alarm[0]=25
            (instance_create_moving(x,y,Hammer2,8,45)).alarm[0]=15
            (instance_create_moving(x,y,Hammer2,8,135)).alarm[0]=15
            (instance_create_moving(x,y,Hammer2,8,180)).alarm[0]=25
            instance_create_moving(x,y,Hammer2,8,270)
            sound_play("laser5")
        }
        if (shotcount=600) {
            (instance_create_moving(x,y,Hammer2,8,0)).alarm[0]=25
            (instance_create_moving(x,y,Hammer2,8,30)).alarm[0]=15
            (instance_create_moving(x,y,Hammer2,8,60)).alarm[0]=25
            (instance_create_moving(x,y,Hammer2,8,120)).alarm[0]=25
            (instance_create_moving(x,y,Hammer2,8,150)).alarm[0]=15
            (instance_create_moving(x,y,Hammer2,8,180)).alarm[0]=25
            sound_play("laser5")
        }
        if (shotcount=650) {
            (instance_create_moving(x,y,Hammer2,8,30)).alarm[0]=10
            (instance_create_moving(x,y,Hammer2,8,30)).alarm[0]=20
            (instance_create_moving(x,y,Hammer2,8,30)).alarm[0]=30
            (instance_create_moving(x,y,Hammer2,8,30)).alarm[0]=40
            (instance_create_moving(x,y,Hammer2,8,150)).alarm[0]=10
            (instance_create_moving(x,y,Hammer2,8,150)).alarm[0]=20
            (instance_create_moving(x,y,Hammer2,8,150)).alarm[0]=30
            (instance_create_moving(x,y,Hammer2,8,150)).alarm[0]=40
            instance_create_moving(x,y,Hammer2,8,270)
            sound_play("laser5")
        }

        if (shotcount>800 && !(shotcount mod 3)) {
            sound_play("laser5")
            instance_create_moving(x,y,CaveBullet1,10,shotcount*4)
            instance_create_moving(x,y,CaveBullet1,10,shotcount*4+120)
            instance_create_moving(x,y,CaveBullet1,10,shotcount*4+240)
        }
        if (shotcount>850) shotcount=150
    } else if (shotcount>300) shotcount=0
}

if (hp<=0 && !dead) {
    dying+=1

    if (dying==50) sound_play("explod")

    if (dying<10) clownbad=0

    flash=(dying mod 8)<3

    spinn=0

    if (!irandom(15-dying/20)) {
        p=instance_create(x+random_range(-200,200),y+random_range(-100,100),GMBossExplosion)
        p.image_xscale=3
        p.image_yscale=2
        play_sound("sndRenExplode2")
    }

    if (dying mod 2) {
        x+=irandom(dying/20)*choose(-1,1)
        y+=irandom(dying/20)*choose(-1,1)
    }

    if (dying>50) with (left) hp=0
    if (dying>100) with (right) hp=0

    if (dying==100) {
        play_sound("sndRenGlass")
        clownbad=-1                                                                                                      //clown color :o)
        repeat (50) (instance_create(x+random_range(-32,32),y+random_range(-32,32),GMBossGlass)).color=color_reverse(choose($1f7fcf,$efcf8f,$cf1f1f,$ffffff))
    }

    if (dying>=200) {
        dead=1
        for (i=0;i<10;i+=1) {
            p=instance_create(x,y,GMBossExplosion)
            p.image_xscale=4
            p.image_yscale=3
            p.speed=10
            p.direction=i*36
        }

        p=instance_create(x,y,GMBossExplosion)
        p.image_xscale=8
        p.image_yscale=6
        p.image_speed=0.5
        global.game_speed=25
        room_speed=25
        repeat (2) sound_play("sndRenExplode")
        visible=0
        alarm[0]=30
        y=999
        with (CaveBullet1) {instance_create(x,y,RenGMExplosion) instance_destroy()}
        with (CaveBullet2) {instance_create(x,y,RenGMExplosion) instance_destroy()}
        with (CaveBullet3) {instance_create(x,y,RenGMExplosion) instance_destroy()}
    }
    exit
}

if (phase=1 && !dead) {
    if (timer=50) {
        i=instance_create(600,-100,GMEnemy1)
        i.hspeed=-3
        i.vspeed=8
    }

    if (timer=75) {
        i=instance_create(200,-100,GMEnemy1)
        i.hspeed=3
        i.vspeed=8
    }

    if (timer=100) {
        i=instance_create(400,-100,GMEnemy1)
        i.vspeed=10

        y=1000
        vspeed=-20
        gravity=0.2
    }

    if (timer>=250 && !fakeout) {
        p=(timer-250) mod 150

        if (p=0) with (left) {
            shoot_bullet(x,y,2,aim,8)
            shoot_bullet(x,y,2,aim,10)
            shoot_bullet(x,y,2,aim,12)
            sound_play("laser5")
        }
        if (p=25) with (right) {
            shoot_bullet(x,y,2,aim,8)
            shoot_bullet(x,y,2,aim,10)
            shoot_bullet(x,y,2,aim,12)
            sound_play("laser5")
        }
        if (p=50) with (left) {
            shoot_bullet(x,y,2,aim-25,8)
            shoot_bullet(x,y,2,aim-25,10)
            shoot_bullet(x,y,2,aim-25,12)
            shoot_bullet(x,y,2,aim+25,8)
            shoot_bullet(x,y,2,aim+25,10)
            shoot_bullet(x,y,2,aim+25,12)
            sound_play("laser5")
        }
        if (p=75) with (right) {
            shoot_bullet(x,y,2,aim-25,8)
            shoot_bullet(x,y,2,aim-25,10)
            shoot_bullet(x,y,2,aim-25,12)
            shoot_bullet(x,y,2,aim+25,8)
            shoot_bullet(x,y,2,aim+25,10)
            shoot_bullet(x,y,2,aim+25,12)
            sound_play("laser5")
        }
        if (p=100) with (left) {
            shoot_bullet(x,y,2,aim-25,8)
            shoot_bullet(x,y,2,aim-25,10)
            shoot_bullet(x,y,2,aim-25,12)
            shoot_bullet(x,y,2,aim,8)
            shoot_bullet(x,y,2,aim,10)
            shoot_bullet(x,y,2,aim,12)
            shoot_bullet(x,y,2,aim+25,8)
            shoot_bullet(x,y,2,aim+25,10)
            shoot_bullet(x,y,2,aim+25,12)
            sound_play("laser5")
        }
        if (p=125) with (right) {
            shoot_bullet(x,y,2,aim-25,8)
            shoot_bullet(x,y,2,aim-25,10)
            shoot_bullet(x,y,2,aim-25,12)
            shoot_bullet(x,y,2,aim,8)
            shoot_bullet(x,y,2,aim,10)
            shoot_bullet(x,y,2,aim,12)
            shoot_bullet(x,y,2,aim+25,8)
            shoot_bullet(x,y,2,aim+25,10)
            shoot_bullet(x,y,2,aim+25,12)
            sound_play("laser5")
        }
    }
}

if (phase=2) if (!dead && !(left.dead && right.dead)) {
    p=timer
    if (p<60*7) {
        if (p mod 60=40) {
            k=random(45)
            sound_play("laser5")
            for (i=0;i<360;i+=45) {
                shoot_bullet(x,y,0,i+k,8)
                shoot_bullet(x,y,0,i+k-1,9)
                shoot_bullet(x,y,0,i+k-2,10)
            }
            with (left) salvo=1
            with (right) salvo=1
        }

        if (p mod 60=50) {
            sound_play("laser5")
            for (i=0;i<360;i+=45) {
                shoot_bullet(x,y,0,i+k+20,10)
                shoot_bullet(x,y,0,i+k+21,11)
            }
        }
    }
}

timer+=1
