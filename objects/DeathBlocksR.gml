#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t=sprite_get_texture(sprite_index,0)
gravity_direction=180
lock=0
#define Collision_DeathBlocksL
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!lock) {
    lock=1
    x=GMShipMaker.x
    gravity=0
    hspeed=0
    sound_play("metal2short")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_repeat(1)
draw_primitive_begin_texture(pr_trianglestrip,t)
draw_vertex_texture(x-0.5,y-0.5,0,0)
draw_vertex_texture(room_width-0.5,y-0.5,(room_width-x)/32,0)
draw_vertex_texture(x-0.5,y+32-0.5,0,1)
draw_vertex_texture(room_width-0.5,y+32-0.5,(room_width-x)/32,1)
draw_primitive_end()
