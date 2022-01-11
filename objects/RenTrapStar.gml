#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) if (Player.bbox_right>x && Player.bbox_left<x+32 && Player.y>y+32 && !go && !collision_line(x+16,y+16,x+16,Player.y,Block,0,0)) {
    go=1
    vspeed=16-4*(difficulty==0)
    play_sound("sndDelfruit")
}
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("sndRenGlass")
instance_create(x+16,y+16,RenGMExplosion)
instance_destroy()
