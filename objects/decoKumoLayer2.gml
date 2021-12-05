#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex1=sprite_get_texture(sprite_index,1)

tex2=sprite_get_texture(sprite_index,2)
tex3=sprite_get_texture(sprite_index,3)

time=0
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

/*draw_primitive_begin_texture(pr_trianglestrip,tex3)
    u=floor((time/3) mod 32)/32
    draw_vertex_texture(xx,yy+102,u,0)
    draw_vertex_texture(xx+room_width,yy+102,u+uu,0)
    draw_vertex_texture(xx,yy+166,u,1)
    draw_vertex_texture(xx+room_width,yy+166,u+uu,1)
draw_primitive_end()  */

draw_primitive_begin_texture(pr_trianglestrip,tex2)
    u=floor(time/2)/32
    draw_vertex_texture(xx,yy+67,u,0)
    draw_vertex_texture(xx+ww,yy+67,u+uu,0)
    draw_vertex_texture(xx,yy+131,u,1)
    draw_vertex_texture(xx+ww,yy+131,u+uu,1)
draw_primitive_end()

draw_primitive_begin_texture(pr_trianglestrip,tex1)
    u=floor(time*2/3)/32
    draw_vertex_texture(xx,yy+50,u,0)
    draw_vertex_texture(xx+ww,yy+50,u+uu,0)
    draw_vertex_texture(xx,yy+114,u,1)
    draw_vertex_texture(xx+ww,yy+114,u+uu,1)
draw_primitive_end()
