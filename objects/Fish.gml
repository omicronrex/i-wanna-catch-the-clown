#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) {
    if (Player.bbox_bottom>y-16 && Player.bbox_top<y+16) {
        if (!collision_line(x+16,y,Player.x,y,Block,0,0)) {
            hspeed=sign(hspeed)*8
        } else hspeed=sign(hspeed)*1
    } else hspeed=sign(hspeed)*1
} else hspeed=sign(hspeed)*1

image_xscale=-sign(hspeed)
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=113
applies_to=self
invert=0
*/
