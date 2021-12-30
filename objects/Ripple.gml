#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*GAMECAVE EFFECTS ENGINE 3.X
Read the GCE3X documentation before using this code!

Object Name - objRipple_1
Engine - Ripples Engine
Purpose - One "drop" of the first ripple type.
*/

radius = 0; //0 Radius (size)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (radius<800) radius += 12;
else instance_destroy()
//Grow radius until it's too big
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///called from compose
d3d_set_projection_ortho(0,0,800,608,0)

x=(xstart-view_xview)*(view_wport/view_wview)
y=(ystart-view_yview)*(view_hport/view_hview)

var width, offset, d, tex, tex_x, tex_y, i, xx, yy;
width = min(radius,80);
offset = (200-radius)/3
d = 360/64;

tex_x=1/800
tex_y=1/608
tex = surface_get_texture(application_surface);
texture_set_repeat(true);

draw_primitive_begin_texture(pr_trianglestrip,tex);

draw_set_color(c_white);

for (i=0;i<=64;i+=1) {
    xx = x+lengthdir_x(radius,i*d);
    yy = y+lengthdir_y(radius,i*d);
    draw_vertex_texture(xx,yy,tex_x*(xx+lengthdir_x(offset,i*d)),tex_y*(yy+lengthdir_y(offset,i*d)));

    xx = x+lengthdir_x(radius-width,i*d);
    yy = y+lengthdir_y(radius-width,i*d);
    draw_vertex_texture(xx,yy,tex_x*(xx),tex_y*(yy));
}

for (i=0;i<=64;i+=1) {
    xx = x+lengthdir_x(radius+width,i*d);
    yy = y+lengthdir_y(radius+width,i*d);
    draw_vertex_texture(xx,yy,tex_x*(xx),tex_y*(yy));

    xx = x+lengthdir_x(radius,i*d);
    yy = y+lengthdir_y(radius,i*d);
    draw_vertex_texture(xx,yy,tex_x*(xx+lengthdir_x(offset,i*d)),tex_y*(yy+lengthdir_y(offset,i*d)));
}

draw_primitive_end();
