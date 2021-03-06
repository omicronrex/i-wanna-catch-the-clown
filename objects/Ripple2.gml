#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*GAMECAVE EFFECTS ENGINE 3.X
Read the GCE3X documentation before using this code!

Object Name - objRipple_2
Engine - Ripples Engine
Purpose - One "drop" of the second ripple type.
*/

offset = 10; //0 "Offset" (intensity)
minradius = 50;
maxradius = 100;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///called from compose
d3d_set_projection_ortho(0,0,800,608,0)

var tex, xtex, ytex, _offset, d, i, xx, yy, xo, yo, xt, yt;

x=xstart-view_xview
y=ystart-view_yview

draw_set_color(c_white);
tex = surface_get_texture(application_surface);
xtex=texture_get_width(tex)/800
ytex=texture_get_height(tex)/608


_offset = minradius-offset;

d = 360/30;

draw_primitive_begin_texture(pr_trianglefan,tex);
draw_vertex_texture(x,y,xtex*x,ytex*y);
a=random(1)

for (i=0;i<=30;i+=1) {
    xx[i] = x+lengthdir_x(minradius,i*d+a);
    yy[i] = y+lengthdir_y(minradius,i*d+a);
    xo[i] = x+lengthdir_x(_offset,i*d+a);
    yo[i] = y+lengthdir_y(_offset,i*d+a);
    draw_vertex_texture(xx[i],yy[i],xtex*xo[i],ytex*yo[i]);
    }

draw_primitive_end();

draw_primitive_begin_texture(pr_trianglestrip,tex);
for (i=0;i<=30;i+=1) {
    draw_vertex_texture(xx[i],yy[i],xtex*xo[i],ytex*yo[i]);
    xt = x+lengthdir_x(maxradius,i*d+a);
    yt = y+lengthdir_y(maxradius,i*d+a);
    draw_vertex_texture(xt,yt,xtex*xt,ytex*yt);
    }

draw_primitive_end();
