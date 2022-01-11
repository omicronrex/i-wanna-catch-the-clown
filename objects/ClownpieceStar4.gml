#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
image_xscale=5
image_yscale=5
image_alpha=0

scale=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=max(scale,image_xscale-0.25)
image_yscale=image_xscale
image_alpha=1-(image_xscale-1)/2

image_angle-=5

speed=max(2,speed-8)
#define Collision_ClownMoon2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_xscale=1) {
    effect_create_above(ef_flare,x,y,1,$ff0080)
    effect_create_above(ef_flare,x,y,0,$ffffff)

    instance_destroy()
    sound_play_single("se_etbreak")
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,1,x,y,image_xscale*1.5,image_yscale*1.5,image_angle,$ffffff,image_alpha*0.3)
draw_self()
