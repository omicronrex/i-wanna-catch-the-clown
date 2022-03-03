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

    with (GMHappyTurret) {dead=1 flash=other.fakeout mod 4}

    if (fakeout<50) flash=fakeout mod 2
    if (fakeout=50) {
        with (GMHappyTurret) {
            p=instance_create(x,y,GMBossExplosion)
            p.image_xscale=3
            p.image_yscale=4
            instance_destroy()
        }
        play_sound("sndRenExplode")
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
    if (hp<=200 && phase=1 && !fakeout) {
        fakeout=1
        invincible=1
    }

    bepis+=max(0,1-fakeout/50-dying/100)

    xp=x
    x=(x*9+xstart+200*sin(bepis*0.02))/10
    y=(y*9+ystart+40*sin(bepis*0.04))/10

    if (phase=2 && timer>60*7) {
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
        rad=220
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

if (phase==2) if (hp<100 && (!left.dead || !right.dead)) {
    if (invincible!=2) sound_play("beep7")
    invincible=2
    hp=100
}

if (invincible=2) if (left.dead && right.dead) {
    invincible=0
    shotcount=150
    play_sound("sndRenGlass")
    repeat (50) (instance_create(x+random_range(-32,32),y+random_range(-32,32),GMBossGlass)).color=$a000
}

if (!dying && phase!=2 && straightsalvo) if ((!left.dead || !right.dead) && instance_exists(Player)) {
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

if (!dying && !fakeout && started) {
    shotcount+=1

    if (phase=1) {
        if (shotcount==200 || shotcount==210 || shotcount==220 || shotcount==230 || shotcount==240) {
            effect_create_above(ef_ring,x-80,y+50,0,$ffffff)
            effect_create_above(ef_ring,x+80,y+50,0,$ffffff)
        }
        if (shotcount==250 && !straightsalvo) {
            instance_create_moving(x-80,y+50,CaveBullet4,12,270)
            instance_create_moving(x+80,y+50,CaveBullet4,12,270)
            sound_play("zap")
        }
        if (shotcount==300 && !straightsalvo) {
            instance_create_moving(x-80,y+50,CaveBullet4,12,270)
            instance_create_moving(x+80,y+50,CaveBullet4,12,270)
            sound_play("zap")
        }

        if (shotcount=400) {
            effect_create_above(ef_ring,x,y,2,$ffffff)
            sound_play("tink")
        }
        if (shotcount=425) {
            with (GMShield) circular=1
            if (turretleft[0]) turretleft[0].shoot=1
            if (turretright[0]) turretright[0].shoot=1
        }
        if (shotcount=430) {
            if (turretleft[1]) turretleft[1].shoot=1
            if (turretright[1]) turretright[1].shoot=1
        }
        if (shotcount=435) {
            if (turretleft[2]) turretleft[2].shoot=1
            if (turretright[2]) turretright[2].shoot=1
        }

        if (shotcount>550 && shotcount<600) if (choose(0,1)) {
            instance_create_moving(x+choose(-80,80),y+50,CaveBullet1,random_range(6,8),random_range(225,315))
            sound_play("laser5")
        }

        if (shotcount>=600) shotcount=0

        if (!left.dead || !right.dead) invincible=2
        else {invincible=0 straightsalvo=0}

        if (left.dead) {
            //turrets on left pie
            if (!turretleft[0]) {
                i=instance_create(x,y,GMHappyTurret)
                turretleft[0]=i
            }
            if (!turretleft[1]) {
                turretleft[1]=turretleft[0]
                turretleft[0]=0
            }
            if (!turretleft[2]) {
                turretleft[2]=turretleft[1]
                turretleft[1]=0
            }

            for (i=0;i<3;i+=1) if (turretleft[i]) {
                turretleft[i].x=inch(turretleft[i].x,x-150-60*i,10)
                turretleft[i].y=(turretleft[i].y*19+y-30)/20
            }

            if (shotcount=35) {
                if (turretleft[0]) with (turretleft[0]) {
                    instance_create(x,y,Hammer)
                    sound_play("laser5")
                }
            }
            if (shotcount=110) {
                if (turretleft[1]) with (turretleft[1]) {
                    instance_create(x,y,Hammer)
                    sound_play("laser5")
                }
            }
            if (shotcount=185) {
                if (turretleft[2]) with (turretleft[2]) {
                    instance_create(x,y,Hammer)
                    sound_play("laser5")
                }
            }
        }
        if (right.dead) {
            //turrets on right pie
            if (!turretright[0]) {
                i=instance_create(x,y,GMHappyTurret)
                turretright[0]=i
            }
            if (!turretright[1]) {
                turretright[1]=turretright[0]
                turretright[0]=0
            }
            if (!turretright[2]) {
                turretright[2]=turretright[1]
                turretright[1]=0
            }

            for (i=0;i<3;i+=1) if (turretright[i]) {
                turretright[i].x=inch(turretright[i].x,x+150+60*i,10)
                turretright[i].y=(turretright[i].y*19+y-30)/20
            }

            if (shotcount=50) {
                if (turretright[0]) with (turretright[0]) {
                    instance_create(x,y,Hammer)
                    sound_play("laser5")
                }
            }
            if (shotcount=125) {
                if (turretright[1]) with (turretright[1]) {
                    instance_create(x,y,Hammer)
                    sound_play("laser5")
                }
            }
            if (shotcount=200) {
                if (turretright[2]) with (turretright[2]) {
                    instance_create(x,y,Hammer)
                    sound_play("laser5")
                }
            }
        }
    }
    if (phase=2) {
        if (!(shotcount mod 100) && shotcount>100 && shotcount<700) {
            sound_play("laser5")
            instance_create_moving(x+80,y-50,Seekers,12,45)
            instance_create_moving(x-80,y-50,Seekers,12,135)
            instance_create_moving(x+60,y-60,Seekers,12,60)
            instance_create_moving(x-60,y-60,Seekers,12,120)
        }

        if (shotcount<500) {
            if (shotcount mod 50=30) {
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

            if (shotcount mod 50=40) {
                sound_play("laser5")
                for (i=0;i<360;i+=45) {
                    shoot_bullet(x,y,0,i+k+20,10)
                    shoot_bullet(x,y,0,i+k+21,11)
                }
            }
        }

        if (shotcount=500 || shotcount=700 || shotcount=950) {
            effect_create_above(ef_ring,x,y,2,$ffffff)
            repeat (2) sound_play("tink")
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

        if (shotcount>750 && shotcount<790 && !(shotcount mod 3)) {
            sound_play("zap")
            instance_create_moving(x+50,y,CaveBullet1,10,shotcount*4)
            instance_create_moving(x+50,y,CaveBullet1,10,shotcount*4+120)
            instance_create_moving(x+50,y,CaveBullet1,10,shotcount*4+240)
        }

        if (shotcount>800 && shotcount<840 && !(shotcount mod 3)) {
            sound_play("zap")
            instance_create_moving(x-50,y,CaveBullet1,10,-shotcount*4)
            instance_create_moving(x-50,y,CaveBullet1,10,-shotcount*4+120)
            instance_create_moving(x-50,y,CaveBullet1,10,-shotcount*4+240)
        }

        if (shotcount>850 && shotcount<890 && !(shotcount mod 3)) {
            sound_play("zap")
            instance_create_moving(x+50,y,CaveBullet1,10,-shotcount*4)
            instance_create_moving(x+50,y,CaveBullet1,10,-shotcount*4+120)
            instance_create_moving(x+50,y,CaveBullet1,10,-shotcount*4+240)
        }

        if (shotcount>900 && shotcount<940 && !(shotcount mod 3)) {
            sound_play("zap")
            instance_create_moving(x-50,y,CaveBullet1,10,shotcount*4)
            instance_create_moving(x-50,y,CaveBullet1,10,shotcount*4+120)
            instance_create_moving(x-50,y,CaveBullet1,10,shotcount*4+240)
        }

        if (shotcount>980 && shotcount<1030 && !(shotcount mod 3)) {
            sound_play("zap")
            instance_create_moving(x+50,y,CaveBullet1,9,shotcount*4)
            instance_create_moving(x+50,y,CaveBullet1,9,shotcount*4+120)
            instance_create_moving(x+50,y,CaveBullet1,9,shotcount*4+240)
            instance_create_moving(x-50,y,CaveBullet1,9,-shotcount*4)
            instance_create_moving(x-50,y,CaveBullet1,9,-shotcount*4+120)
            instance_create_moving(x-50,y,CaveBullet1,9,-shotcount*4+240)
        }

        if (shotcount>1080) shotcount=200
    }
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

if (phase=1 && !dead && shotcount<400) {
    if (timer=50) {
        i=instance_create(600,-100,GMEnemy1)
        i.hspeed=-2
        i.vspeed=8
    }

    if (timer=75) {
        i=instance_create(200,-100,GMEnemy1)
        i.hspeed=2
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
            sound_play("laser5")
            shoot_bullet(x,y,2,aim,8)
            shoot_bullet(x,y,2,aim,10)
            shoot_bullet(x,y,2,aim,12)
        }
        if (p=25) with (right) {
            sound_play("laser5")
            shoot_bullet(x,y,2,aim,8)
            shoot_bullet(x,y,2,aim,10)
            shoot_bullet(x,y,2,aim,12)
        }
        if (p=50) with (left) {
            sound_play("laser5")
            shoot_bullet(x,y,2,aim-25,8)
            shoot_bullet(x,y,2,aim-25,10)
            shoot_bullet(x,y,2,aim-25,12)
            shoot_bullet(x,y,2,aim+25,8)
            shoot_bullet(x,y,2,aim+25,10)
            shoot_bullet(x,y,2,aim+25,12)
        }
        if (p=75) with (right) {
            sound_play("laser5")
            shoot_bullet(x,y,2,aim-25,8)
            shoot_bullet(x,y,2,aim-25,10)
            shoot_bullet(x,y,2,aim-25,12)
            shoot_bullet(x,y,2,aim+25,8)
            shoot_bullet(x,y,2,aim+25,10)
            shoot_bullet(x,y,2,aim+25,12)
        }
        if (p=100) with (left) {
            sound_play("laser5")
            shoot_bullet(x,y,2,aim-25,8)
            shoot_bullet(x,y,2,aim-25,10)
            shoot_bullet(x,y,2,aim-25,12)
            shoot_bullet(x,y,2,aim,8)
            shoot_bullet(x,y,2,aim,10)
            shoot_bullet(x,y,2,aim,12)
            shoot_bullet(x,y,2,aim+25,8)
            shoot_bullet(x,y,2,aim+25,10)
            shoot_bullet(x,y,2,aim+25,12)
        }
        if (p=125) with (right) {
            sound_play("laser5")
            shoot_bullet(x,y,2,aim-25,8)
            shoot_bullet(x,y,2,aim-25,10)
            shoot_bullet(x,y,2,aim-25,12)
            shoot_bullet(x,y,2,aim,8)
            shoot_bullet(x,y,2,aim,10)
            shoot_bullet(x,y,2,aim,12)
            shoot_bullet(x,y,2,aim+25,8)
            shoot_bullet(x,y,2,aim+25,10)
            shoot_bullet(x,y,2,aim+25,12)
        }
    }
}

timer+=1
