#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sunx=1080
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_fog(1,$404040,0,0)
with (CarDebris) draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,0,0.5)
with (PoliceBomb) draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,0,0.5)
with (PoliceHeli) draw_sprite_ext(sprite_index,0,x,y+z,2,2,image_angle,0,0.5)
d3d_set_fog(0,0,0,0)

col1=color_reverse($735a42)
col3=$80ccff
col2=merge_color(col1,col3,0.5)

draw_rectangle_color(1100,0,1600,1216,col3,0,0,col3,0)

draw_set_circle_precision(64)
draw_circle_color(sunx,view_yview+304,200,$ccff,$80ff,0)
draw_set_circle_precision(16)

draw_rectangle_color(800,0,1100,1216,col1,col2,col2,col1,0)
