#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
phase=0

sprayangle=180
spraygo=11
angle=0
len=0

hp=100
ystart-=30
rad=0
inst=0
laserinst=0

sprite_index=-1
f=0

sound_kind_stop(1)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1

if (phase==0) {
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
        sound_play("sndTouhouAppear")
        instance_create(x,y,ClownPopIn)
    }

    if (timer>200 && timer<220) {
        sprite_index=sprClownPiece
        vulnerable=1
        image_blend=merge_color($ff0000,$ffffff,f)
        f=min(1,f+0.1)
        l=random_range(300,500)
        d=random(360)
        instance_create(x+lengthdir_x(l,d),y+lengthdir_y(l,d),ClownPopParticlesIn)
    }

    if (timer>200) {
        effect_create_below(ef_explosion,x+random_range(-10,10),y+random_range(-30,30),0,$ff00)
        effect_create_below(ef_smokeup,x+random_range(-20,20),y+random_range(-30,30),0,$ff8000)
        rad=min(150,rad+1)
    }

    if (timer=250) {
        sound_play("sndTouhouPop")
        instance_create(x,y,ClownPopOut)
    }

    if (timer>250 && timer<260) {
        instance_create(x,y,ClownPopParticlesOut)
    }

    if (timer>260) {
        //torch slash
        sprayangle+=spraygo
        if (sprayangle>=360) {spraygo=-11 sprayangle=360-random(10)}
        if (sprayangle<=180) {spraygo=11 sprayangle=180+random(10)}
        i=instance_create(x,y,ClownpieceStar)
        i.speed=7
        i.direction=sprayangle
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
        rune=instance_create(0,0,Runes)
        rune.alpha=0

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
    rune.alpha=min(1,rune.alpha+0.01)

    if (timer=100) {
        instance_create(x,y,ClownMoon)
        sound_play("sndTouhouMoon")
        angle2=180
    }
    if (timer>150) {
        angle+=0.5
        angle2+=1
        len=(len*19+120)/20
        sx=x+lengthdir_x(len,angle2)
        sy=y+lengthdir_y(len,angle2)
        for (j=0;j<360;j+=360/10) {
            i=instance_create(sx,sy,ClownpieceStar2)
            i.speed=20
            i.direction=j+angle
        }
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
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///take damage

if (vulnerable) {
    if (hp>10) play_sound("sndTouhouSlap")
    else play_sound("sndTouhouSlap2")

    hp=max(0,hp-1)

    if (hp=0) {
        phase+=1
        hp=100
        timer=0
        vulnerable=0
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///green glow
draw_set_blend_mode(bm_subtract)
draw_circle_color(x,y,rad,$ffffff,0,0)
draw_circle_color(x,y,rad,$ffffff,0,0)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,rad*0.8,$3000,0,0)
draw_set_blend_mode(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase==7) {
    draw_self()
    rad=max(0,rad-10)
    exit
} else {
    //draw boss indicator
    alpha=min(1,rad/50)
    draw_set_alpha(alpha)
    draw_set_blend_mode(bm_subtract)
    draw_ellipse_color(x-32,608-40,x+32,608,merge_color(0,$ffffff,alpha),0,0)
    draw_set_blend_mode(bm_add)
    draw_ellipse_color(x-32,608-40,x+32,608,merge_color(0,$ff,alpha),0,0)
    draw_set_blend_mode(0)
    draw_set_font(fntSignpost)
    draw_set_halign(1)
    draw_set_valign(1)
    draw_set_color(0)
    draw_set_alpha(alpha/2)
    draw_text(x,608-20,"boss")
    draw_set_color($ffffff)
    draw_set_halign(0)
    draw_set_valign(0)
    draw_set_alpha(1)
}

//fade in
if (timer<100 && phase=0) {
    rect(0,0,800,608,0,1-(timer-50)/50)
}

//sprite
if (timer>200 || phase) draw_self()
