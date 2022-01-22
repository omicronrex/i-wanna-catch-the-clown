#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
roomStart=room
s=-1

fresh=1

model1=d3d_model_create()
model2=d3d_model_create()
model3=d3d_model_create()
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(s)) surface_free(s)

d3d_model_destroy(model1)
d3d_model_destroy(model2)
d3d_model_destroy(model3)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room!=roomStart) instance_destroy()
else {
    with (SpikeU) visible=0
    with (SpikeD) visible=0
    with (SpikeL) visible=0
    with (SpikeR) visible=0
    if (fresh) event_user(0)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var m1,m2,m3,u,v,f,d,l,vx,vy;

fresh=0

m1=model1
m2=model2
m3=model3

if (!surface_exists(s)) s=surface_create(800,608)

u=texture_get_width(surface_get_texture(s))/800
v=texture_get_height(surface_get_texture(s))/608

vx=-view_xview[0]*u
vy=-view_yview[0]*v

//reflectiveness
f=1.0

//darkness
d=1.0

//lightness
l=0.1

d3d_model_clear(m1)
d3d_model_clear(m2)
d3d_model_clear(m3)

d3d_model_primitive_begin(m1,pr_trianglelist)

with (Block) if (object_index=Block) {
    d3d_model_vertex_color(m1,x,y,0,0,d)
    d3d_model_vertex_color(m1,x+32,y,0,0,d)
    d3d_model_vertex_color(m1,x,y+32,0,0,d)
    d3d_model_vertex_color(m1,x,y+32,0,0,d)
    d3d_model_vertex_color(m1,x+32,y,0,0,d)
    d3d_model_vertex_color(m1,x+32,y+32,0,0,d)
}

with (SlopeBL) {
    d3d_model_vertex_color(m1,x,ystart+32,0,0,d)
    d3d_model_vertex_color(m1,x,ystart,0,0,d)
    d3d_model_vertex_color(m1,x+32,ystart+32,0,0,d)
}
with (SlopeBR) {
    d3d_model_vertex_color(m1,x,ystart+32,0,0,d)
    d3d_model_vertex_color(m1,x+32,ystart,0,0,d)
    d3d_model_vertex_color(m1,x+32,ystart+32,0,0,d)
}

with (SpikeU) {
    d3d_model_vertex_color(m1,x,y+32,0,0,d)
    d3d_model_vertex_color(m1,x+16,y,0,0,d)
    d3d_model_vertex_color(m1,x+32,y+32,0,0,d)
}
with (SpikeR) {
    d3d_model_vertex_color(m1,x,y,0,0,d)
    d3d_model_vertex_color(m1,x+32,y+16,0,0,d)
    d3d_model_vertex_color(m1,x,y+32,0,0,d)
}
with (SpikeD) {
    d3d_model_vertex_color(m1,x,y,0,0,d)
    d3d_model_vertex_color(m1,x+32,y,0,0,d)
    d3d_model_vertex_color(m1,x+16,y+32,0,0,d)
}
with (SpikeL) {
    d3d_model_vertex_color(m1,x,y+16,0,0,d)
    d3d_model_vertex_color(m1,x+32,y,0,0,d)
    d3d_model_vertex_color(m1,x+32,y+32,0,0,d)
}

d3d_model_primitive_end(m1)

d3d_model_primitive_begin(m2,pr_trianglelist)

with (Block) if (object_index=Block) {
    d3d_model_vertex_texture_color(m2,x+2,y+2,0,x*u+vx,y*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+2,y+30,0,x*u+vx,(y+32)*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+30,y+2,0,(x+32)*u+vx,y*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+30,y+2,0,(x+32)*u+vx,y*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+2,y+30,0,x*u+vx,(y+32)*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+30,y+30,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,1)

    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y-32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y-32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y-32)*v+vy,$ffffff,0)

    d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)

    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y,0,(x-32)*u+vx,y*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y,0,(x-32)*u+vx,y*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x-32)*u+vx,(y+32)*v+vy,$ffffff,0)

    d3d_model_vertex_texture_color(m2,x+16,y,0,(x+64)*u+vx,y*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+64)*u+vx,(y+32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+64)*u+vx,(y+32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)
}

with (SlopeBL) {
    d3d_model_vertex_texture_color(m2,x+2,ystart+30,0,x*u+vx,(ystart+32)*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+2,ystart+5,0,(x)*u+vx,ystart*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+27,ystart+30,0,(x+32)*u+vx,(ystart+32)*v+vy,$ffffff,1)


    d3d_model_vertex_texture_color(m2,x,ystart,0,x*u+vx,(ystart)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,ystart+16,0,(x-32)*u+vx,(ystart+16)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,ystart+32,0,x*u+vx,(ystart+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,ystart+32,0,x*u+vx,(ystart+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,ystart+16,0,(x-32)*u+vx,(ystart+16)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,ystart+32,0,(x-32)*u+vx,(ystart+32)*v+vy,$ffffff,0)

    d3d_model_vertex_texture_color(m2,x,ystart+16,0,(x+28)*u+vx,(ystart-12)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,ystart,0,x*u+vx,ystart*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,ystart+32,0,(x+44)*u+vx,(ystart+4)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,ystart+32,0,(x+44)*u+vx,(ystart+4)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,ystart,0,x*u+vx,ystart*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,ystart+32,0,(x+32)*u+vx,(ystart+32)*v+vy,$ffffff,f)


    d3d_model_vertex_texture_color(m2,x,ystart+16,0,(x)*u+vx,(ystart+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,ystart+16,0,(x+16)*u+vx,(ystart+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,ystart+32,0,x*u+vx,(ystart+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,ystart+32,0,x*u+vx,(ystart+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,ystart+16,0,(x+16)*u+vx,(ystart+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,ystart+32,0,(x+32)*u+vx,(ystart+32)*v+vy,$ffffff,f)
}

with (SlopeBR) {
    d3d_model_vertex_texture_color(m2,x+2+2,ystart+30,0,x*u+vx,(ystart+32)*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+2+28,ystart+5,0,(x+32)*u+vx,ystart*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+27+2,ystart+30,0,(x+32)*u+vx,(ystart+32)*v+vy,$ffffff,1)


    d3d_model_vertex_texture_color(m2,x+32,ystart,0,(x+32)*u+vx,ystart*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,ystart+16,0,(x+4)*u+vx,(ystart-12)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,ystart+32,0,x*u+vx,(ystart+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,ystart+32,0,x*u+vx,(ystart+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,ystart+16,0,(x+4)*u+vx,(ystart-12)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,ystart+32,0,(x-12)*u+vx,(ystart+4)*v+vy,$ffffff,0)

    d3d_model_vertex_texture_color(m2,x+16,ystart+16,0,(x+64)*u+vx,(ystart+16)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,ystart,0,(x+32)*u+vx,ystart*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,ystart+32,0,(x+64)*u+vx,(ystart+32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,ystart+32,0,(x+64)*u+vx,(ystart+32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,ystart,0,(x+32)*u+vx,ystart*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,ystart+32,0,(x+32)*u+vx,(ystart+32)*v+vy,$ffffff,f)


    d3d_model_vertex_texture_color(m2,x+16,ystart+16,0,(x+16)*u+vx,(ystart+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16+16,ystart+16,0,(x+16+16)*u+vx,(ystart+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,ystart+32,0,x*u+vx,(ystart+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,ystart+32,0,x*u+vx,(ystart+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16+16,ystart+16,0,(x+16+16)*u+vx,(ystart+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,ystart+32,0,(x+32)*u+vx,(ystart+32)*v+vy,$ffffff,f)
}



with (SpikeU) {
    d3d_model_vertex_texture_color(m2,x+3,y+30,0,x*u+vx,(y+32)*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+16,y+4,0,(x+16)*u+vx,y*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+29,y+30,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,1)

    d3d_model_vertex_texture_color(m2,x+16,y,0,(x+16)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+24,y+16,0,(x-12)*u+vx,(y-8)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+24,y+16,0,(x-12)*u+vx,(y-8)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x-20)*u+vx,(y+8)*v+vy,$ffffff,0)

    d3d_model_vertex_texture_color(m2,x+8,y+16,0,(x+44)*u+vx,(y-8)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y,0,(x+16)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+52)*u+vx,(y+8)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+52)*u+vx,(y+8)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y,0,(x+16)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)

    d3d_model_vertex_texture_color(m2,x+8,y+16,0,(x+8)*u+vx,(y+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+24,y+16,0,(x+24)*u+vx,(y+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+24,y+16,0,(x+24)*u+vx,(y+64)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)
}

with (SpikeD) {
    d3d_model_vertex_texture_color(m2,x+3,y+2,0,x*u+vx,y*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+29,y+2,0,(x+32)*u+vx,y*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+16,y+28,0,(x+16)*u+vx,(y+32)*v+vy,$ffffff,1)

    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+16)*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+24,y+16,0,(x-12)*u+vx,(y+40)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+24,y+16,0,(x-12)*u+vx,(y+40)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y,0,(x-20)*u+vx,(y+24)*v+vy,$ffffff,0)

    d3d_model_vertex_texture_color(m2,x+8,y+16,0,(x+44)*u+vx,(y+40)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+16)*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y,0,(x+52)*u+vx,(y+24)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y,0,(x+52)*u+vx,(y+24)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y+32,0,(x+16)*u+vx,(y+32)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)

    d3d_model_vertex_texture_color(m2,x+8,y+16,0,(x+8)*u+vx,(y-32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+24,y+16,0,(x+24)*u+vx,(y-32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+24,y+16,0,(x+24)*u+vx,(y-32)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
}

with (SpikeL) {
    d3d_model_vertex_texture_color(m2,x+30,y+3,0,(x+32)*u+vx,y*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+4,y+16,0,x*u+vx,(y+16)*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+30,y+29,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,1)

    d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y+16)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y+24,0,(x-8)*u+vx,(y-12)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y+24,0,(x-8)*u+vx,(y-12)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+8)*u+vx,(y-20)*v+vy,$ffffff,0)

    d3d_model_vertex_texture_color(m2,x+16,y+8,0,(x-8)*u+vx,(y+44)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y+16)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+8)*u+vx,(y+56)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+8)*u+vx,(y+56)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+16,0,x*u+vx,(y+16)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)

    d3d_model_vertex_texture_color(m2,x+16,y+8,0,(x+64)*u+vx,(y+8)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y+24,0,(x+64)*u+vx,(y+24)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+32,y,0,(x+32)*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y+24,0,(x+64)*u+vx,(y+24)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+32,0,(x+32)*u+vx,(y+32)*v+vy,$ffffff,f)
}

with (SpikeR) {
    d3d_model_vertex_texture_color(m2,x+2,y+3,0,x*u+vx,y*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+28,y+16,0,(x+32)*u+vx,(y+16)*v+vy,$ffffff,1)
    d3d_model_vertex_texture_color(m2,x+2,y+29,0,x*u+vx,(y+32)*v+vy,$ffffff,1)

    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y+16)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y+24,0,(x+40)*u+vx,(y-12)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y+24,0,(x+40)*u+vx,(y-12)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+16,0,(x+24)*u+vx,(y-20)*v+vy,$ffffff,0)

    d3d_model_vertex_texture_color(m2,x+16,y+8,0,(x+40)*u+vx,(y+44)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y+16)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y+16,0,(x+24)*u+vx,(y+56)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+16,0,(x+24)*u+vx,(y+56)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+32,y+16,0,(x+32)*u+vx,(y+16)*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)

    d3d_model_vertex_texture_color(m2,x+16,y+8,0,(x-32)*u+vx,(y+8)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x+16,y+24,0,(x-32)*u+vx,(y+24)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x,y,0,x*u+vx,y*v+vy,$ffffff,f)
    d3d_model_vertex_texture_color(m2,x+16,y+24,0,(x-32)*u+vx,(y+24)*v+vy,$ffffff,0)
    d3d_model_vertex_texture_color(m2,x,y+32,0,x*u+vx,(y+32)*v+vy,$ffffff,f)
}

d3d_model_primitive_end(m2)

d3d_model_primitive_begin(m3,pr_trianglelist)

with (Block) if (object_index=Block) {
    d3d_model_vertex_color(m3,x,y,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+32,y,0,$ffffff,l)
    d3d_model_vertex_color(m3,x,y+32,0,$ffffff,l)
    d3d_model_vertex_color(m3,x,y+32,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+32,y,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+32,y+32,0,$ffffff,l)
}

with (SpikeU) {
    d3d_model_vertex_color(m3,x,y+32,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+16,y,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+32,y+32,0,$ffffff,l)
}
with (SpikeR) {
    d3d_model_vertex_color(m3,x,y,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+32,y+16,0,$ffffff,l)
    d3d_model_vertex_color(m3,x,y+32,0,$ffffff,l)
}
with (SpikeD) {
    d3d_model_vertex_color(m3,x,y,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+32,y,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+16,y+32,0,$ffffff,l)
}
with (SpikeL) {
    d3d_model_vertex_color(m3,x,y+16,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+32,y,0,$ffffff,l)
    d3d_model_vertex_color(m3,x+32,y+32,0,$ffffff,l)
}

d3d_model_primitive_end(m3)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(application_surface)) {
    if (!surface_exists(s)) s=surface_create(800,608)
    surface_copy(s,0,0,application_surface)

    d3d_model_draw(model1,0,0,0,-1)
    texture_set_interpolation(1)
    draw_set_blend_mode(bm_add)
    d3d_model_draw(model2,0,0,0,surface_get_texture(s))
    draw_set_blend_mode(0)
    texture_set_interpolation(0)
    d3d_model_draw(model3,0,0,0,-1)
}
