#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t=sprite_get_texture(sprite_index,0)
gravity_direction=0
lock=0
#define Collision_DeathBlocksR
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!lock) {
    lock=1
    x=GMShipMaker.x-32
    gravity=0
    hspeed=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_repeat(1)
draw_primitive_begin_texture(pr_trianglestrip,t)
draw_vertex_texture(0-0.5,y-0.5,-x/32,0)
draw_vertex_texture(x+32-0.5,y-0.5,1,0)
draw_vertex_texture(0-0.5,y+32-0.5,-x/32,1)
draw_vertex_texture(x+32-0.5,y+32-0.5,1,1)
draw_primitive_end()
