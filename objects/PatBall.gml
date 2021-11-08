#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=0.2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var len, dir, ball;
if place_meeting(x, y, Player)
{
    len = point_distance(Player.x, Player.y, x, y)
    dir = point_direction(Player.x, Player.y, x, y)
    hspeed += (lengthdir_x(len, dir) / 5)
    vspeed += (lengthdir_y(len, dir) / 5)
}
ball = instance_position(x, y, PatBall)
if (ball != noone)
{
    len = point_distance(ball.x, ball.y, x, y)
    dir = point_direction(ball.x, ball.y, x, y)
    hspeed += (lengthdir_x(len, dir) / 3)
    vspeed += (lengthdir_y(len, dir) / 3)
}
if place_meeting(x, y, Bullet)
    hspeed += (Bullet.hspeed / 4)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed *= 0.995
if (place_meeting(x, y, Block) || place_meeting(x, y, NiseBlock))
{
    x -= hspeed
    y -= vspeed
    if (place_meeting(x, (y + abs(vspeed)), Block) || place_meeting(x, (y + abs(vspeed)), NiseBlock))
    {
        move_contact_solid(270, abs(vspeed))
        vspeed = ((-vspeed) * 0.8)
        y += vspeed
    }
    else if (place_meeting(x, (y - abs(vspeed)), Block) || place_meeting(x, (y - abs(speed)), NiseBlock))
    {
        move_contact_solid(90, abs(vspeed))
        vspeed = ((-vspeed) * 0.8)
        y += vspeed
    }
    if (place_meeting((x + hspeed), y, Block) || place_meeting((x + hspeed), y, NiseBlock))
    {
        if (hspeed > 0)
            move_contact_solid(0, hspeed)
        else
            move_contact_solid(180, abs(hspeed))
        hspeed = ((-hspeed) * 0.9)
        x += hspeed
    }
}
#define Collision_Water1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed-=2*gravity
#define Collision_Water2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed-=2*gravity
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
