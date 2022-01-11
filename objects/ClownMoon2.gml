#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=0
angle=70
rad=0

moonrad=0
moonangle=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rad=min(180,rad+5)
angle-=2

scale=min(160,rad)/250

image_xscale=scale
image_yscale=scale

image_angle+=8

moonrad=min(150,moonrad+1)
moonangle+=(360/8)/50

x=Clownpiece.x+lengthdir_x(rad,angle)+lengthdir_x(moonrad,moonangle)
y=Clownpiece.y+lengthdir_y(rad,angle)+lengthdir_y(moonrad,moonangle)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_circle_precision(64)
draw_circle_color(floor(x),floor(y),110*image_xscale+5,$ff,$80,0)
draw_set_circle_precision(16)
texture_set_interpolation(1)
draw_sprite_ext(sprite_index,image_index,floor(x)+lengthdir_x(0.5,image_angle)+lengthdir_x(0.5,image_angle-90),floor(y)+lengthdir_y(0.5,image_angle)+lengthdir_y(0.5,image_angle-90),image_xscale,image_yscale,image_angle,$ffffff,1)
texture_set_interpolation(0)
