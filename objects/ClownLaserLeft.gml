#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
vspeed=-1.5
hspeed=-16
image_xscale=2000
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y,TouhouHitbox)) kill_player()
if (bbox_right<0) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
texture_set_interpolation(1)
draw_self()
if (bbox_right>800-32) {
    draw_sprite_ext(sprGlowBall,0,800-32,y,random_range(1.5,2),random_range(1.5,2),random(360),$ff,1)
    draw_sprite_ext(sprGlowBall,0,800-32,y,random_range(1,1.2),random_range(1,1.2),random(360),$ffffff,1)
}
texture_set_interpolation(0)
draw_set_blend_mode(0)
