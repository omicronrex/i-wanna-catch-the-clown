#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xx=random(32)
yy=random(32)
zz=0
s=1
x2=random(32768)
x3=random(32768)

tex1=background_get_texture(bgMist)
tex2=background_get_texture(bgCar)

second=0

surf=-1
post=0

bars=0

instance_create(0,0,RaceEndPostBloom)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bars=min(60,(bars*19+70)/20)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_projection_ortho(0,0,800,608,0)

if (post) if (surface_exists(surf)) {
    texture_set_interpolation(1)
    draw_set_blend_mode(bm_add)
    for (i=0;i<50;i+=1) {
        f=sqr(1+i/50)
        draw_surface_stretched_ext(surf,400*(1-f),(608-(mean(RaceControl.sunx,1050)-view_xview))*(1-f),800*f,608*f,$ffffff,0.04/f)
    }
    draw_set_blend_mode(0)
    texture_set_interpolation(0)

}

draw_rectangle_color(0,0,800,bars,0,0,0,0,0)
draw_rectangle_color(0,608-bars,800,608,0,0,0,0,0)

dx8_reset_projection()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xx+=0.01
yy-=0.004
zz-=0.1

if (xx<0) xx+=1/s
if (yy<0) yy+=1/s

x2=(x2+0.07) mod 1
x3=(x3+1) mod 256

k=(700-view_xview)/40

if (post) {
    surf=dx8_surface_engage(surf,800,604)
        dx8_reset_projection()
        draw_clear(0)

        draw_set_circle_precision(64)
        draw_set_blend_mode(bm_add)
        repeat (3) draw_circle_color(RaceControl.sunx,view_yview+304,200,$808080,0,0)
        draw_set_blend_mode(0)
        draw_set_circle_precision(16)

        d3d_set_fog(1,0,0,0)
        draw_rectangle(0,0,1100,1216,0)
        with (CarMountain) event_perform(ev_draw,0)
        d3d_set_fog(0,0,0,0)
    surface_set_target(application_surface)
}

texture_set_repeat(1)
d3d_set_projection_ext(0,0,0,0,-10,k+2,0,0,-1,105,400/224,1,1000)
draw_set_blend_mode(bm_add)
d3d_primitive_begin_texture(pr_trianglestrip,tex1)
    d3d_vertex_texture_color(-70,-40,-5,xx*s,-yy*s,$644000,0)
    d3d_vertex_texture_color(70,-40,-5,(xx+lengthdir_x(2.5,30))*s,-(yy+lengthdir_y(2.5,30))*s,$644000,0)
    d3d_vertex_texture_color(-70,5,-5,(xx+lengthdir_x(2.5,300))*s,-(yy+lengthdir_y(2.5,300))*s,$644000,1)
    d3d_vertex_texture_color(70,5,-5,(xx+lengthdir_x(2.5,30)+lengthdir_x(2.5,300))*s,-(yy+lengthdir_y(2.5,30)+lengthdir_y(2.5,300))*s,$644000,1)
d3d_primitive_end()
draw_set_blend_mode(0)

if (second) {
    d3d_primitive_begin_texture(pr_trianglestrip,tex2)
        d3d_vertex_texture_color(-70,-25,20-k*4,1,x2,$ffffff,1)
        d3d_vertex_texture_color(-70,-5,40-k*4,0,x2,$ffffff,1)
        d3d_vertex_texture_color(70,-25,20-k*4,1,x2+6,$ffffff,1)
        d3d_vertex_texture_color(70,-5,40-k*4,0,x2+6,$ffffff,1)
    d3d_primitive_end()
    texture_set_interpolation(0)
}

dx8_reset_projection()

if (second) draw_sprite_ext(sprNiceCar,0,Racecar.x-430+840+300*k/10,Racecar.y,-1,1,270,$c0c0c0,1)
