#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex0=sprite_get_texture(sprite_index,0)

time=0

instance_create(x,y,decoKumoLayer2)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_repeat(1)

time+=1

xx=x-0.5
yy=y-0.5
ww=room_width+32
uu=ww/32

draw_primitive_begin_texture(pr_trianglestrip,tex0)
    u=floor(time+16)/32
    draw_vertex_texture(xx,yy+17,u,0)
    draw_vertex_texture(xx+ww,yy+17,u+uu,0)
    draw_vertex_texture(xx,yy+81,u,1)
    draw_vertex_texture(xx+ww,yy+81,u+uu,1)

    u=floor(time)/32
    draw_vertex_texture(xx,yy,u,0)
    draw_vertex_texture(xx+ww,yy,u+uu,0)
    draw_vertex_texture(xx,yy+64,u,1)
    draw_vertex_texture(xx+ww,yy+64,u+uu,1)
draw_primitive_end()
