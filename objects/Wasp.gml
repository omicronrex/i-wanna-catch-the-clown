#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=4
direction=irandom(7)*45

if (instance_exists(Player)) {
    d=point_distance(x,y,Player.x,Player.y)
    if (d<96) {
        x+=Player.hspeed/2
        y+=(Player.vspeed+Player.gravity)/2
        if (d<48) if (!irandom(2)) direction=roundto(direction_to_object(Player)+180,45)
        speed=2
    } else if (!irandom(8)) direction=roundto(direction_to_object(Player),45)
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=other.hspeed
instance_destroy_id(other)
#define Collision_Water2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y-=4
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=115
applies_to=self
invert=0
arg0=0
arg1=0
*/
#define Collision_WaspBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=109
relative=0
applies_to=self
invert=0
arg0=xprevious
arg1=yprevious
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=115
applies_to=self
invert=0
arg0=0
arg1=1
*/
