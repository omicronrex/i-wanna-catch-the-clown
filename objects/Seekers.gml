#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lock=0
alarm[0]=5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!lock && instance_exists(Player)) {
    d=direction_to_object(Player)
    direction=inch_angle(direction,d,7)
    if (abs(angle_difference(direction,d))<7) {
        lock=1
        direction=d
        dx=Player.x
        dy=Player.y
    }
}

if (lock==1) if (point_distance(x,y,dx,dy)<20) lock=2

image_angle=direction
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>608) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (lock==1) draw_sprite(sprTarget,0,dx,dy)
