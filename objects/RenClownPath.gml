#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
go=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!go && instance_exists(Player)) {
    if (Player.x>96 && Player.y<320) instance_change(RenClown,1)
    if (Player.y<104 && Player.y>0 && Player.x<96) {
        go=1
        play_sound("sndRenClown")
        path_start(pRen1,4,0,1)
        image_index=1
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go && !instance_exists(Player)) {
    path_end() hspeed=x-xprevious vspeed=y-yprevious
}
#define Collision_RenApple
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x+16,y+16,RenGMExplosion)
i.image_xscale=20
i.image_yscale=20
i.image_speed=0.2
i.depth=-1
i.hurt=1
play_sound("sndRenExplode")
instance_destroy()
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
