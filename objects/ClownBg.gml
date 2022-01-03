#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex=background_get_texture(bgMoonSurface)

fog=300
v=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_projection_ext(512,1024,384,512,512,0,0,0,1,20,-4/3,8,1024)

col=$ccaabb
v-=0.001
fog=min(650,fog+0.5)

texture_set_interpolation(1)
texture_set_repeat(1)
d3d_set_fog(1,$21000f,fog,fog+150)
d3d_primitive_begin_texture(pr_trianglestrip,tex)

d3d_vertex_texture_color(0,0,0,0,v,col,1)
d3d_vertex_texture_color(1024,0,0,3,v,col,1)
d3d_vertex_texture_color(0,1024,0,0,v+3,col,1)
d3d_vertex_texture_color(1024,1024,0,3,v+3,col,1)

d3d_primitive_end()

d3d_set_fog(0,0,0,0)
texture_set_interpolation(0)
dx8_reset_projection()

with (Clownpiece) event_user(1)
