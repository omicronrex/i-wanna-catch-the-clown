#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=choose(
    $0000ff,
    $0080ff,
    $00ffff,
    $00ff80,
    $00ff00,
    $80ff00,
    $ffff00,
    $ff8000,
    $ff0000,
    $ff0080,
    $ff00ff,
    $8000ff
)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,1,xd-0.5*dcos(rot)-0.5*dcos(rot-90),yd-0.5*dsin(rot)-0.5*dsin(rot-90),1,1,rot,image_blend,1)
draw_sprite_ext(sprite_index,2,xd-0.5*dcos(rot)-0.5*dcos(rot-90),yd-0.5*dsin(rot)-0.5*dsin(rot-90),1,1,rot,$ffffff,1)
