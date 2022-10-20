#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.1
go=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!go && instance_exists(Player)) {
    if (Player.bbox_top<120 && Player.bbox_left<96) {
        go=1
        image_speed=0.5
        with (PacDot) visible=1
        path_start(pRen1,4-(difficulty==0),0,1)
        sprite_index=sprPacman
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go && !instance_exists(Player)) {
    path_end()
    speed=0
    sprite_index=sprPacmanStand
    image_speed=0.1
    image_angle=0
    go=0
}

if (go) {
    image_angle=direction
    if (image_angle>90 && image_angle<270) image_yscale=-1
    else image_yscale=1
}
#define Collision_RenApple
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x+16,y-32,RenGMExplosion)
i.image_xscale=16+3*difficulty
i.image_yscale=16+3*difficulty
i.image_speed=0.2
i.depth=-1
i.hurt=1
play_sound("sndRenExplode")
instance_destroy()
#define Collision_PacDot
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("sndPac")
instance_destroy_id(other)
