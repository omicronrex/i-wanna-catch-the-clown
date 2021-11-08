#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (speed=0) {
    if (instance_exists(Player)) {
        image_index=0
        if (Player.bbox_right>x && Player.bbox_left<x+32)
            if (!collision_line(x+16,y+16,x+16,Player.y,Block,0,0) && !collision_line(x+16,y+16,x+16,Player.y,RenWallTransform,0,0)) {
                hspeed=0
                vspeed=8*sign(Player.y-y)
                play_sound("sndRenClown")
            }
        if (Player.bbox_bottom>y && Player.bbox_top<y+32)
            if (!collision_line(x+16,y+16,Player.x,y+16,Block,0,0) && !collision_line(x+16,y+16,Player.x,y+16,RenWallTransform,0,0)) {
                vspeed=0
                hspeed=8*sign(Player.x-x)
                play_sound("sndRenClown")
            }
    }
} else image_index=1
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=0
image_index=0
move_snap(32,32)
#define Collision_RenWallTransform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=0
move_snap(32,32)
