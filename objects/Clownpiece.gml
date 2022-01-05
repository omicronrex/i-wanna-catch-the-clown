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
clownpiece_step()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///take damage

if (hp>10) play_sound("sndTouhouSlap")
else play_sound("sndTouhouSlap2")

hp=max(0,hp-0.75)

if (hp=0) {
    phase+=1
    timer=0
    vulnerable=0
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
    draw_sprite_ext(sprClownVortex,0,x,y,3.7,3.7,-timer/5,merge_color(0,$ffffff,spellcardbga),0)
    draw_set_blend_mode(0)
    texture_set_interpolation(0)
}

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

    if (sprite_index!=-1) {
        hpdraw=inch(hpdraw,hp,2)
        if (!spellcardbg) {
            draw_healthbar(40,40,800-40,60,hpdraw,0,$d0,$d0,0,1,1)
            if (vulnerable) {
                draw_sprite(sprCherryColor,1,40+(800-80)*hpdraw/100,50)
            }
        }
        if (phase<6) draw_sprite(sprCherryAzure,1,50,50)
        if (phase<4) draw_sprite(sprCherryAzure,1,70,50)
        if (phase<2) draw_sprite(sprCherryAzure,1,90,50)
    }
}

//fade in
if (timer<100 && phase=0) {
    rect(0,0,800,608,0,1-(timer-50)/50)
}

//sprite
if (timer>200 || phase) draw_self()
