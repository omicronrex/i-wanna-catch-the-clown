#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
roomStart=room
s=-1

fresh=1

model2=d3d_model_create()
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(s)) surface_free(s)

d3d_model_destroy(model2)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room!=roomStart) instance_destroy()
else {
    if (fresh) event_user(0)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var m1,m2,m3,u,v,f,d,l,vx,vy,c,list;

fresh=0

m2=model2

u=1/800
v=1/608

vx=-view_xview[0]*u
vy=-view_yview[0]*v

if (room=rmClear) vx=-800*u

//reflectiveness
f=0.8

d3d_model_clear(m2)

d3d_model_primitive_begin(m2,pr_trianglelist)

with (Block) if (object_index!=Block && object_index!=DisappearBlock) y=-999

with (Block) {
    t=!position_meeting(x+16,y-16,Block)
    b=!position_meeting(x+16,y+48,Block)
    l=!position_meeting(x-16,y+16,Block)
    r=!position_meeting(x+48,y+16,Block)
    tr=!position_meeting(x+48,y-16,Block)
    tl=!position_meeting(x-16,y-16,Block)
    br=!position_meeting(x+48,y+48,Block)
    bl=!position_meeting(x-16,y+48,Block)

    if (t) {
        d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y-32)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y-32)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y-32)*v+vy,$ffffff,0)
    }
    if (b) {
        d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y+64)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y+64)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y+64)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)
    }
    if (l) {
        d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+16,y,0,(x-32)*u+vx,y*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+16,y,0,(x-32)*u+vx,y*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x-32)*u+vx,(y+32)*v+vy,$ffffff,0)
    }
    if (r) {
        d3d_model_vertex_texture_color(m2,x+16,y,0,(x+64)*u+vx,y*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+64)*u+vx,(y+32)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+64)*u+vx,(y+32)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)
    }
    if (!t && !r && tr) {
        d3d_model_vertex_texture_color(m2,x+16,y,0,(x+32)*u+vx,(y-32)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+64)*u+vx,y*v+vy,$ffffff,0)
    }
    if (!t && !l && tl) {
        d3d_model_vertex_texture_color(m2,x,y+16,0,(x-32)*u+vx,y*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+16,y,0,x*u+vx,(y-32)*v+vy,$ffffff,0)
    }
    if (!b && !r && br) {
        d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+64)*u+vx,(y+48)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+32)*u+vx,(y+64)*v+vy,$ffffff,0)
    }
    if (!b && !l && bl) {
        d3d_model_vertex_texture_color(m2,x+16,y+32,0,x*u+vx,(y+64)*v+vy,$ffffff,0)
        d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
        d3d_model_vertex_texture_color(m2,x,y+16,0,(x-32)*u+vx,(y+32)*v+vy,$ffffff,0)
    }
}

d3d_model_primitive_end(m2)

with (Block) y=ystart
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(application_surface)) {
    if (!surface_exists(s)) s=surface_create(800,608)
    surface_copy(s,0,0,application_surface)

    texture_set_interpolation(1)
    draw_set_blend_mode(bm_add)
    d3d_model_draw(model2,0,0,0,surface_get_texture(s))
    draw_set_blend_mode(0)
    texture_set_interpolation(0)
}
