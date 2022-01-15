#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
resw=800
resh=608

shadow_intensity=0.3

blur_factor=3
blur_width=floor(resw/blur_factor)
blur_height=floor(resh/blur_factor)

procsurf=-1
procsurf2=-1
blur_surface1=-1
blur_surface2=-1

fogcol=merge_color(0,$ffffff,shadow_intensity)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//we need to supersample the appsurf by 4x so that the blur effect isn't jittery.

procsurf=sureface(procsurf,resw,resh)
procsurf2=sureface(procsurf2,resw,resh)

//first we need to actually do the anti alias effect to the app surf by halving it.
//this makes it 100% scale to the screen. we store this on diffuse.
texture_set_interpolation(1)
surface_set_target(procsurf2)
draw_clear_alpha(0,1)
d3d_set_projection_ortho(0,0,resw,resh,0)
d3d_set_fog(1,fogcol,0,0)
with (Block) if (object_index!=AppearBlock || visible) draw_sprite(sprEngineBlock,0,x,y)
with (FakeBlock) draw_sprite(sprEngineBlock,0,x,y)
with (Player) event_perform(ev_draw,0)
with (DodgeBall) event_perform(ev_draw,0)
with (PlayerKiller) draw_self()
with (Bullet) draw_self()
with (RenWin) draw_self()
with (AutoSign) draw_self()
with (RenAtomBomb) draw_self()
with (RenSave) draw_self()
with (Grave) draw_self()
with (Tree) draw_self()
with (RenWallTransform) draw_sprite(sprEngineBlock,0,x,y)
d3d_set_fog(0,0,0,0)

//supersample to 50%
surface_set_target(procsurf)
d3d_set_projection_ortho(0,0,resw,resh,0)
draw_surface_stretched(procsurf2,0,0,resw/2,resh/2)

//create blur map
blur_surface1=sureface(blur_surface1,blur_width,blur_height)
blur_surface2=sureface(blur_surface2,blur_width,blur_height)
surface_set_target(blur_surface2)
draw_clear_alpha(0,0)
d3d_set_projection_ortho(0,0,resw/4,resh/4,0)
//(final supersample to 25.5%)
draw_surface_stretched(procsurf,0,0,resw/2,resh/2)

//le blur
//@todo: detail level option?
repeat (blur_factor) {
    surface_set_target(blur_surface1)
    d3d_set_projection_ortho(0,0,blur_width,blur_height,0)
    draw_surface_part_ext(blur_surface2,0,0,blur_width+10,blur_height+10,0,0,0.5,0.5,$ffffff,1)
    surface_set_target(blur_surface2)
    d3d_set_projection_ortho(0,0,blur_width,blur_height,0)
    draw_surface_part_ext(blur_surface1,0,0,blur_width+10,blur_height+10,0,0,2,2,$ffffff,1)
}
texture_set_interpolation(0)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_perform(ev_step,ev_step_end)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dx8_surface_discard(procsurf)
dx8_surface_discard(procsurf2)
dx8_surface_discard(blur_surface1)
dx8_surface_discard(blur_surface2)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(blur_surface2)) {
    texture_set_interpolation(1)
    dx8_set_color_mask(1,1,1,0)
    draw_set_blend_mode(bm_subtract)
        draw_surface_stretched(blur_surface2,6,6,resw,resh)
    draw_set_blend_mode(0)
    dx8_set_color_mask(1,1,1,1)
    texture_set_interpolation(0)
}
