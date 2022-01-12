#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
area="secretarea_"+string(x)+"_"+string(y)+"_"+string(room_get_name(room))

if (!savedata(area)) {
    savedata(area,1)
    sound_play("Bonus")
    World.message=250
    World.messagetext="You found a secret area!#(Secret areas are not required#for tourney 100% completion)"
    instance_destroy()
}
