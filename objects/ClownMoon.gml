#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=0
angle=70
rad=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rad=min(160,rad+5)
angle-=1

scale=rad/250

image_xscale=scale
image_yscale=scale

image_angle+=8

x=Clownpiece.x+lengthdir_x(rad,angle)
y=Clownpiece.y+lengthdir_y(rad,angle)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_circle_color(floor(x),floor(y),110*image_xscale+5,0,0,0)
draw_sprite_ext(sprite_index,image_index,floor(x)+lengthdir_x(0.5,image_angle)+lengthdir_x(0.5,image_angle-90),floor(y)+lengthdir_y(0.5,image_angle)+lengthdir_y(0.5,image_angle-90),image_xscale,image_yscale,image_angle,$ffffff,1)
