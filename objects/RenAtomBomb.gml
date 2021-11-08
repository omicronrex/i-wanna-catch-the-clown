#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) if (!collision_line(x,y,Player.x,Player.y,Block,1,0)) {
    if (x<Player.x) x+=1 else x-=1
    if (place_meeting(x,y,Block)) x=xprevious
    if (y<Player.y-8) y+=1 else y-=1
    if (place_meeting(x,y,Block)) y=yprevious
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x,y,RenGMExplosion)
i.image_xscale=6
i.image_yscale=6
i.image_speed=0.25
play_sound("sndRenExplode")
killPlayer()
instance_destroy()
