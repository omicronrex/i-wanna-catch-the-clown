#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
phase=0
pop=0
vulnerable=0

plrc=2
plra=0

sprayangle=180
spraygo=11
angle=0
len=0

hp=100
hpdraw=0
ystart-=30
rad=0
inst=0
laserinst=0
spellcardbg=0
spellcardbga=0

sprite_index=-1
image_speed=0.25
f=0

lock_controls()

sound_kind_stop(1)
global.music=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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

name=""
clownpiece_fight()

if (timer=1 && phase>0 && time) {
    (instance_create(0,0,ClownTimeout)).time=time
}

if (instance_exists(Player) && sprite_index!=-1) {
    if (point_distance(0,608,Player.x,Player.y)<100) plra=max(0.2,plra-0.05)
    else plra=min(1,plra+0.05)
} else plra=max(0,plra-0.05)

if (mode="rest" && timer>100) vulnerable=1
if (mode="timeout") vulnerable=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (spellcardbg) spellcardbga=min(1,spellcardbga+0.01)
else spellcardbga=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///take damage

if (mode="rest") {
    hp=max(0,hp-0.05)
    if (hp>3) play_sound("sndTouhouSlap")
    else play_sound("sndTouhouSlap2")
} else if (mode="limited") {
    hp=max(0,hp-0.2)
    if (hp>40) play_sound("sndTouhouSlap")
    else play_sound("sndTouhouSlap2")
} else {
    hp=max(0,hp-0.25)
    if (hp>12) play_sound("sndTouhouSlap")
    else play_sound("sndTouhouSlap2")
}

if (hp==0 || (mode="limited" && hp<=25)) {
    with (ClownTimeout) instance_destroy()
    phase+=1
    timer=0
    vulnerable=0
    if (spellcardbg) {
        i=sound_play_paused("se_tan00")
        sound_volume(i,0.5)
        sound_resume(i)
    }
    spellcardbg=0
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw background

if (spellcardbg) {
    texture_set_interpolation(1)
    draw_background_stretched_ext(bgClownSpellcard,32,32,800-32,608-32,$ffffff,spellcardbga)
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(sprClownVortex,0,400,304,3.7,3.7,-timer/5,merge_color(0,$ffffff,spellcardbga),0)
    draw_set_blend_mode(0)
    texture_set_interpolation(0)
}

draw_set_blend_mode(bm_subtract)
draw_circle_color(x,y,rad*1.5,$ffffff,0,0)
draw_circle_color(x,y,rad*1.5,$ffffff,0,0)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,rad*1.2,$3000,0,0)
draw_set_blend_mode(0)
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw hud and overlays
if (phase==10) {
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
    draw_text(x,608-20,"Boss")
    draw_set_color($ffffff)
    draw_set_halign(0)
    draw_set_valign(0)
    draw_set_alpha(1)

    if (sprite_index!=-1) {
        hpdraw=inch(hpdraw,hp,2)
        if (mode!="timeout") {
            draw_healthbar(40,40,800-40,60,hpdraw,0,$d0,$d0,0,1,1)
        }
        hpx=40+(800-80)*hpdraw/100
        if (phase<9) draw_sprite(sprCherryAzure,1,50,50)
        if (phase<7) draw_sprite(sprCherryAzure,1,70,50)
        if (phase<5) draw_sprite(sprCherryAzure,1,max(90,min(hpx,pick(phase==4,90,40+(800-80)*0.25))),50)
        if (phase<3) draw_sprite(sprCherryAzure,1,max(110,min(hpx,pick(phase==2,110,40+(800-80)*0.25))),50)
        if (phase<1) draw_sprite(sprCherryAzure,1,130,50)
        if (mode!="timeout" && hp>0) {
            draw_sprite(sprCherryColor,1,hpx,50)
        }

        draw_set_alpha(plra)
        draw_text_outline(40,608-80,"Player",$ffff)
        draw_set_alpha(1)
        for (i=0;i<plrc;i+=1) draw_sprite_ext(sprTouhouLives,difficulty==2,40+16*i,608-52,1,1,0,$ffffff,plra)
    }
    if (name!="") {
        draw_set_halign(2)
        draw_text_outline(800-40,40,name,$ffff)
        draw_set_halign(0)
    }
}

//fade in
if (timer<100 && phase=0) {
    rect(0,0,800,608,0,1-(timer-50)/50)
}

//sprite
if (timer>200 || phase) draw_self()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase==10) {
    draw_self()
    rad=max(0,rad-10)
    exit
}
