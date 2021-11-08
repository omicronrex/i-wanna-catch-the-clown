//tile_bake(left,top,width,height,x,y,depth)

if (object_index=HermanBlock) {
    tile_add(RenTiler.bg,argument0,argument1,argument2,argument3,argument4,argument5,argument6)
} else {
    var m,u,v,xx,yy,w,h,l,t,d;

    m=global.tilemodel
    u=RenTiler.u
    v=RenTiler.v
    l=argument0*u
    t=argument1*v
    w=argument2
    h=argument3
    xx=argument4
    yy=argument5
    d=argument6

    d3d_model_vertex_texture(m,xx,yy,d,l,t)
    d3d_model_vertex_texture(m,xx+w,yy,d,l+w*u,t)
    d3d_model_vertex_texture(m,xx,yy+h,d,l,t+h*v)
    d3d_model_vertex_texture(m,xx,yy+h,d,l,t+h*v)
    d3d_model_vertex_texture(m,xx+w,yy,d,l+w*u,t)
    d3d_model_vertex_texture(m,xx+w,yy+h,d,l+w*u,t+h*v)
}
