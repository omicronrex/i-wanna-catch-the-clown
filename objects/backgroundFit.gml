#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
background_xscale[0]=room_width/background_get_width(background_index[0])
background_yscale[0]=room_height/background_get_height(background_index[0])
background_visible[0]=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_background_stretched(background_index[0],background_x[0],background_y[0],800,608)
texture_set_interpolation(0)
