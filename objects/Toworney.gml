#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=-1

alpha=0

blade=-1500

sound_play("sndIntro")
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blade+=15

if (blade>1000) alpha=max(0,alpha-0.02)
else alpha=min(1,alpha+0.01)

if (blade>1700) {
    instance_create(0,0,FadeIn)
    room_goto(rmTitle)
}

s=surface_engage(s,300,150)
draw_clear_alpha(0,0)

draw_set_blend_mode(bm_add)
    draw_sprite_ext(sprite_index,0,150,75,1,1,0,$ffffff,alpha)
draw_set_blend_mode_ext(10,1)
    rect(0,0,300,150,$ffffff,1)
draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(spr2x2,0,150,blade,300,40,15,$ffffff,0)
draw_set_blend_mode_ext(10,1)
    rect(0,0,300,150,$ffffff,1)
draw_set_blend_mode(0)

surface_disengage()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(s)) draw_surface(s,x-150,y-75)
