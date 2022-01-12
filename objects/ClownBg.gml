#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex=background_get_texture(bgMoonSurface)
atex=background_get_texture(bgAlphaGradient)

fog=300
vslide=0

mode=0

s=-1
s3=-1
s4=-1

hfac=1/19
hoff=6
hamp=1.7

vfac=1/13
voff=2
vamp=0.9

time=0

bg=bgClownStars

alpha=1

w=800
h=608
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time+=2*dt

draw=true
if (instance_exists(Clownpiece)) if (Clownpiece.spellcardbga==1) draw=false

{//build d3d bg
    texture_set_interpolation(1)
    s3=dx8_surface_engage(s3,800,608)
    draw_clear(0)
    d3d_set_projection_ext(512,1024,384,512,512,90*mode,mode*-0.2,0,1,20,-4/3,8,1024)

    col=$ccaabb
    vslide-=0.001
    fog=min(650,fog+0.5)

    texture_set_interpolation(1)
    texture_set_repeat(1)
    if (mode) d3d_set_fog(1,0,fog,fog+150)
    else d3d_set_fog(1,$21000f,fog,fog+150)
    d3d_primitive_begin_texture(pr_trianglestrip,tex)

    d3d_vertex_texture_color(0,0,0,0,vslide,col,1)
    d3d_vertex_texture_color(1024,0,0,3,vslide,col,1)
    d3d_vertex_texture_color(0,1024,0,0,vslide+3,col,1)
    d3d_vertex_texture_color(1024,1024,0,3,vslide+3,col,1)

    d3d_primitive_end()

    d3d_set_fog(0,0,0,0)
    dx8_reset_projection()

    if (mode) {
        draw_set_blend_mode(bm_add)
        draw_background_stretched(bg,32,32,800-64,343)
        draw_set_blend_mode(0)
    }
}

if (draw && instance_exists(Clownpiece)) {
    {//distort V
        s=dx8_surface_engage(s,w,h)
        for (u=0;u<w;u+=2)
            draw_surface_part(s3,u,0,2,h,u,sin((time+u*vamp)*vfac)*voff)
    }

    s4=dx8_surface_engage(s4,800,608)

    {//distort H
        for (v=0;v<h;v+=1)
            draw_surface_part(s,0,v,w,1,sin((time+v*hamp)*hfac)*hoff,v)
    }

    {//erase alpha
        draw_set_blend_mode(bm_subtract)
        draw_rectangle_color(0,0,800,608,$bb00bb,$bb00bb,$bb00bb,$bb00bb,0)
    }

    {//create opaque circle near clownpiece
        if (instance_exists(Clownpiece)) {
            draw_set_blend_mode(bm_add)
            dx=(Clownpiece.x)
            dy=(Clownpiece.y)
            repeat (3) d3d_draw_cone(dx-300,dy-300,0,dx+300,dy+300,0,atex,1,1,0,8)
            draw_set_blend_mode(0)
        }
    }
}

dx8_surface_disengage()
texture_set_interpolation(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_surface(s3,0,0)

if (draw && instance_exists(Clownpiece)) {
    draw_surface(s4,0,0)
}

with (Clownpiece) if (spellcardbg) {
    texture_set_interpolation(1)
    draw_background_stretched_ext(bgClownSpellcard,32,32,800-32,608-32,$ffffff,spellcardbga)
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(sprClownVortex,0,400,304,3.7,3.7,-timer/5,merge_color(0,$ffffff,spellcardbga),0)
    draw_set_blend_mode(0)
    draw_set_blend_mode(bm_add)
    draw_set_alpha(0.2)
    d3d_transform_add_rotation_z(-spellrot)
    d3d_transform_add_translation(x,y,0)
    d3d_draw_cone(-spellradius1,-spellradius1,0,spellradius1,spellradius1,0,spelltex1,5,1,0,32)
    d3d_transform_set_rotation_z(spellrot)
    d3d_transform_add_translation(x,y,0)
    d3d_draw_cone(-spellradius2,-spellradius2,0,spellradius2,spellradius2,0,spelltex2,5,1,0,32)
    d3d_transform_set_identity()
    draw_set_blend_mode(0)
    draw_set_alpha(1)
    texture_set_interpolation(0)
}
