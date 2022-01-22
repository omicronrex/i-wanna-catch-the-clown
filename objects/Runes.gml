#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)

time=0

tex=sprite_get_texture(sprite_index,0)
s=-1
s2=-1

alpha=1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(s)) surface_free(s)
if (surface_exists(s2)) surface_free(s2)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time+=1

s=sureface(s,512,512)
if (!surface_set_target_safe(s)) exit

draw_primitive_begin_texture(pr_trianglelist,tex)

for (i=0;i<8;i+=1) {
    x1=lengthdir_x(a[i]+g[i]*time,c[i])
    y1=lengthdir_y(b[i]+h[i]*time,c[i])

    x2=x1+lengthdir_x(d[i],c[i])
    y2=y1+lengthdir_y(e[i],c[i])

    x3=x2+lengthdir_x(d[i],c[i]-90)
    y3=y2+lengthdir_y(e[i],c[i]-90)

    x4=x1+lengthdir_x(d[i],c[i]-90)
    y4=y1+lengthdir_y(e[i],c[i]-90)

    draw_vertex_texture_color(0,0,x1,y1,f[i],1)
    draw_vertex_texture_color(512,0,x2,y2,f[i],1)
    draw_vertex_texture_color(0,512,x4,y4,f[i],1)
    draw_vertex_texture_color(0,512,x4,y4,f[i],1)
    draw_vertex_texture_color(512,0,x2,y2,f[i],1)
    draw_vertex_texture_color(512,512,x3,y3,f[i],1)
}

draw_clear_alpha(0,1)
texture_set_repeat(1)
draw_set_blend_mode(bm_add)
texture_set_interpolation(1)
draw_primitive_end()
texture_set_interpolation(0)
draw_set_blend_mode(0)
surface_reset_target()

s2=sureface(s2,512,512)
if (!surface_set_target_safe(s2)) exit
draw_surface_ext(s,0,0,1,1,0,$101010,1)
surface_reset_target()
if (!surface_set_target_safe(s)) exit
draw_clear_alpha(0,1)
draw_set_blend_mode(bm_add)
repeat (4) {
    draw_surface(s2,0,0)
    draw_surface(s2,1,0)
    draw_surface(s2,0,1)
    draw_surface(s2,-1,0)
    draw_surface(s2,0,-1)
}
draw_set_blend_mode(0)
surface_reset_target()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<8;i+=1) {
    a[i]=random(1)+1
    b[i]=random(1)+1
    c[i]=random(360)
    d[i]=12/(random(20)+5)
    e[i]=7/(random(20)+5)
    f[i]=make_color_hsv(irandom(255),255,32)
    g[i]=(random(2)-1)*0.002
    h[i]=(random(2)-1)*0.002
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(s)) {
    texture_set_interpolation(1)
    if (room=rRenClown) {
        draw_surface_stretched_ext(s,view_xview[0],view_yview[0],800,608,$808080,alpha)
    } else {
        if (room=rTutorial) dx8_projection_simple(0,0,800,600,90.1,1,-200,0,1000)
        else dx8_projection_simple(0,0,800,600,0.1,1,-200,0,1000)
        d3d_start()
        d3d_set_hidden(0)
        d3d_set_fog(1,0,0,800)
        tex2=surface_get_texture(s)
        if (room=rTutorial) d3d_draw_cylinder(0,-100,-200,800,700,800,tex2,texture_get_width(tex2),texture_get_height(tex2),0,32)
        else d3d_draw_cylinder(0,-150,-200,800,650,800,tex2,texture_get_width(tex2),texture_get_height(tex2),0,32)
        d3d_set_hidden(1)
    }
}
