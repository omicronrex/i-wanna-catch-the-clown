#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
image_xscale=3
image_yscale=3
image_alpha=0

image_angle=direction

scale=1
fac=0.98
ms=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=max(scale,image_xscale-0.25)
image_yscale=image_xscale
image_alpha=1-(image_xscale-1)/2

image_angle=direction

if (instance_exists(Player)) {
    if (point_distance(x,y,Player.x,Player.y)<70) {
        speed=max(ms,speed*fac)
    }
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
