#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
w=100
hw=w/2
r=45
image_xscale=5
image_yscale=5

s=surface_create(w,w)

surface_set_target(s)

draw_clear_alpha(0,0)

for (u=0;u<w;u+=1) for (v=0;v<w;v+=1) {
    g=(3-min(3,abs(point_distance(hw,hw,u,v)-r)))/4
    if (g>0)
        draw_point_color(u,v,make_color_rgb(0,sqrt(g)*255,0))
}

bg=background_create_from_surface(s,0,0,w,w,0,0)

surface_free(s)

texshine=background_get_texture(bgTexBallSpec)

alpha=6

surf=-1
hurt=0

ys=current_year-1991-(current_month<11)-(current_day<18)*(current_month==11)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d=90-point_direction(0,0,point_distance(x,y,Player.x,Player.y),400)
a=direction_to_object(Player)

surf=surface_engage(surf,300,300)
d3d_set_projection_ortho(0,0,150,150,0)
draw_clear_alpha(0,0)

texture_set_interpolation(1)
draw_circle_color(75,75,70,0,0,0)

d3d_transform_add_rotation_y(-70)
d3d_transform_add_rotation_z(135)
d3d_transform_add_translation(75,75,0)

draw_set_blend_mode(bm_add)
d3d_set_culling(1)
draw_set_color($c0c0c0)
d3d_draw_ellipsoid(-70,-70,-70,70,70,70,texshine,1,127/128,32)
draw_set_color($ff0000)
d3d_draw_ellipsoid(-70,-70,-70,70,70,70,texshine,1,-127/128,32)
draw_set_color($ffffff)
d3d_set_culling(0)


d3d_transform_set_translation(0,0,r)
d3d_transform_add_rotation_y(-d)
d3d_transform_add_rotation_z(a)
d3d_transform_add_translation(75,75,0)

draw_background(bg,-hw,-hw)
draw_set_blend_mode(0)
d3d_transform_set_identity()
surface_disengage()
texture_reset_interpolation()
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.vspeed=0){
    sound_play("beep4")
    other.direction+=choose(135,-135)
    if (!hurt) {
        hurt=1
        with (instance_nearest(x,y,TextDraw)) text="nice try!##however, i can't be#hurt in my element."
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
background_delete(bg)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(surf)) {
    texture_set_interpolation(1)
    draw_surface_stretched(surf,x-75,y-75,150,150)
    texture_reset_interpolation()
}
