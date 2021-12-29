#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
area="secretarea_"+string(x)+"_"+string(y)

if (!savedata(area)) {
    savedata(area,1)
    sound_play("Bonus")
    World.message=100
    World.messagetext="You found a secret area"
}
