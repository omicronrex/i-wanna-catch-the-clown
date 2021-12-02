draw_clear_alpha(0,0)
d3d_start()
d3d_set_lighting(1)
d3d_light_define_point(1,320,240,1000,50000,$ffffff)
d3d_light_enable(1,1)

d3d_set_projection(x,y,-500,300,300,0,0,1,0)

draw_set_color(c_blue)
d3d_draw_ellipsoid(180,180,100,420,420,50,-1,0,0,24)

draw_set_color(make_color(240,150,40))
d3d_draw_ellipsoid(100,230,75,150,280,25,-1,0,0,24)

draw_set_color(make_color(240,80,20))
d3d_draw_ellipsoid(450,230,75,500,280,25,-1,0,0,24)

d3d_transform_set_rotation_y(90)

ttt=background_get_texture(bgGMGradient)
draw_set_color(c_white)
d3d_draw_cylinder(75,230,-125,25,280,-475,ttt,1,1,false,24)

d3d_transform_set_identity()

if (GameMaker3D.phase<2) {
    if (GameMaker3D.flash) draw_set_color(c_white)
    else {
        draw_set_color(c_red)
        if (GameMaker3D.straightsalvo mod 4>1) draw_set_color(c_orange)
    }
    d3d_draw_ellipsoid(230,230,90,370,370,-40,-1,0,0,24)
}

draw_set_color(c_white)
for (i=0;i<7;i+=1) {
    if (i!=3) {
        d3d_draw_ellipsoid(
            300+lengthdir_x(90,240+i*60/6)-5,300-lengthdir_y(90,240+i*60/6)-5,50,
            300+lengthdir_x(90,240+i*60/6)+5,300-lengthdir_y(90,240+i*60/6)+5,42,
            -1,0,0,12
        )
    }
}


d3d_primitive_begin(pr_trianglestrip)
x_center=300
y_center=210
z_center=60
d3d_vertex_normal(
    x_center+lengthdir_x(10,225),y_center+lengthdir_y(10,225),z_center,
    lengthdir_x(1,225),lengthdir_y(1,225),1
)

for (i=225;i<360+162.5;i+=22.5) {
    d3d_vertex_normal(
        x_center+lengthdir_x(10,i),y_center+lengthdir_y(10,i),z_center,
        lengthdir_x(1,i),lengthdir_y(1,i),1
    )
    d3d_vertex_normal(x_center,y_center,z_center-10,0,0,1)
}
d3d_primitive_end()

d3d_set_lighting(0)

text='EASY GAME DEVELOPEMENT';
if (GameMaker3D.phase>1) text='EVIL GAME DEVELOPEMENT';

draw_set_font(fArial13)
draw_set_color(c_white)
draw_set_halign(1)

d3d_set_depth(50)

for (i=180;i>-10;i-=190/22) {
    draw_text_transformed(
        300+lengthdir_x(105,i),
        300-lengthdir_y(105,i),
        string_char_at(text,ceil(190-i)/190*22),
        -1,1,270-i
    )
}
d3d_set_depth(25)

draw_set_font(fArial24)
draw_set_halign(2)
draw_set_valign(1)
draw_text_transformed(230,260,'Game',1,-1,0)
draw_set_halign(0)
draw_text_transformed(370,260,'Maker',1,-1,0)
draw_set_valign(0)

if (GameMaker3D.phase<2) {
    d3d_set_depth(-40)
    draw_sprite_ext(sprGMHammer,0,290,300,1,-1,0,c_white,1);
} else if (GameMaker3D.clownbad!=-1) {
    d3d_set_depth(0)
    if (GameMaker3D.flash) d3d_set_fog(1,$ffffff,0,0)
    draw_sprite_ext(sprRenClown,pick(GameMaker3D.invincible==2,GameMaker3D.clownbad,3),290-48,300+48,3,-3,0,c_white,1);
    if (GameMaker3D.flash) d3d_set_fog(0,0,0,0)
}
if (GameMaker3D.invincible==2) {
    d3d_set_hidden(0)
    d3d_set_depth(-10)
    sn=sin(path_position*pi*4)
    draw_sprite_ext(sprBossGM8,0,290,300,0.75+0.125*sn,-(0.75+0.125*sn),path_position*360,$ffffff,0.5+0.25*sn)
}

d3d_set_lighting(0)

d3d_transform_set_identity()

d3d_end()
d3d_set_lighting(0)
