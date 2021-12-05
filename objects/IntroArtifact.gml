#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=0.5
image_yscale=0.5
x-=0.5
y-=0.5

tile_layer_shift(1001,0,224)
tile_layer_shift(-10,0,224)
y+=224
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_self()
texture_reset_interpolation()
