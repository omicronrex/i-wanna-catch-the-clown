if (pop) {
    if (pop=1) {
        sound_play("sndTouhouAppear")
        hp=100
        instance_create(x,y,ClownPopIn)
    }

    if (pop<20) {
        l=random_range(300,500)
        d=random(360)
        instance_create(x+lengthdir_x(l,d),y+lengthdir_y(l,d),ClownPopParticlesIn)
    }

    if (pop=50) {
        vulnerable=1
        sound_play("sndTouhouPop")
        instance_create(x,y,ClownPopOut)
    }

    if (pop>50 && pop<60) {
        instance_create(x,y,ClownPopParticlesOut)
    }
    pop+=1 if (pop>60) pop=0
}

timer+=1
if (phase==0) {
    if (timer=50) unlock_controls()
    if (timer=100) {
        sound_play("sndTouhouAppear")
        play_bg_music("musPiss",1)
        with (instance_create(0,0,ClownpieceAppearTracer)) {
            path_start(pTouhouAppear1,2,0,1)
            color=$ff0000
        }
        with (instance_create(0,0,ClownpieceAppearTracer)) {
            path_start(pTouhouAppear2,2,0,1)
            color=$ff
        }
        with (instance_create(0,0,ClownpieceAppearTracer)) {
            path_start(pTouhouAppear3,2,0,1)
            color=$ff
        }
        with (instance_create(0,0,ClownpieceAppearTracer)) {
            path_start(pTouhouAppear4,2,0,1)
            color=$ff0000
        }
    }

    if (timer=200) {
        pop=1
        instance_create(x,y,Sigil)
    }

    if (timer>200 && timer<220) {
        sprite_index=sprClownPiece
        image_blend=merge_color($ff0000,$ffffff,f)
        f=min(1,f+0.1)
    }

    if (timer>200) {
        effect_create_below(ef_explosion,x+random_range(-10,10),y+random_range(-30,30),0,$ff00)
        effect_create_below(ef_smokeup,x+random_range(-20,20),y+random_range(-30,30),0,$ff8000)
        rad=min(150,rad+1)
    }

    //first attack
    if (timer>260) {
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
        if ((timer-260) mod 150==75) {
            //dance
            speed=4
            friction=0.075
            direction=random(360)
            if (abs(x-xstart)>200) hspeed=abs(hspeed)*sign(xstart-x)
            if (abs(y-ystart)>20) vspeed=abs(vspeed)*sign(ystart-y)
            vspeed/=2
        }

        if ((timer-260) mod 150<13 && !(timer mod 3)) {
            //laser barrage
            f=(40-(timer-260) mod 150)/40
            i=instance_create(x,y,ClownLaserball)
            i.hspeed=-5*f*f*f
            i.vspeed=-2*f
            i=instance_create(x,y,ClownLaserball)
            i.hspeed=5*f*f*f
            i.vspeed=-2*f
        }
    }
}

if (phase==1) {
    //move to center of screen
    x=(x*19+400)/20
    y=(y*19+260)/20

    if (timer=1) {
        //activate spellcard
        sound_play("sndTouhouSpell")
        instance_create(x,y,ClownPopIn)
        instance_create(0,0,Clownspellcard)
        instance_create(0,0,ClownTimeout)
        spellcardbg=1

        //erase bullets
        with (ClownpieceStar) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
        with (ClownLaserball) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
        with (ClownLaser) {repeat (75) {effect_create_above(ef_spark,x,y,0,$ff00ff) y+=8} instance_destroy()}
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
        sound_play("sndTouhouMoon")
        angle2=180
    }
    if (timer>150) {
        //big fast asterisk
        angle+=0.5
        angle2+=1
        len=(len*19+120)/20
        sx=x+lengthdir_x(len,angle2)
        sy=y+lengthdir_y(len,angle2)
        for (j=0;j<360;j+=360/8) {
            i=instance_create(sx,sy,ClownpieceStar2)
            i.speed=20
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
}
if (phase==2) {
    if (timer=1) {
        //deactivate spellcard
        spellcardbg=0

        //move to start
        vspeed=-4
        friction=0.075

        //erase bullets
        with (ClownpieceStar) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
        with (ClownpieceStar3) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
        with (ClownMoon) {repeat (75) {effect_create_above(ef_spark,x,y,0,$ff00ff) y+=8} instance_destroy()}
    }

    if (timer=100) {
        pop=1
    }

    if ((timer-260) mod 150==75) {
        //dance
        speed=4
        friction=0.075
        direction=random(360)
        if (abs(x-xstart)>200) hspeed=abs(hspeed)*sign(xstart-x)
        if (abs(y-ystart)>20) vspeed=abs(vspeed)*sign(ystart-y)
        vspeed/=2
    }
}

if (phase==7) {
    sound_play("sndLolisplosion")
    if (timer=50) {
        sound_play("sndLolisplosion")
        instance_create(x,y,Lolisplosion)
        instance_destroy()
    }
}

if (spellcardbg) spellcardbga=min(1,spellcardbga+0.02)
else spellcardbga=max(0,spellcardbga-0.02)
