#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=deletes a tile at 1000 on contact
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile=tile_layer_find(1000,x,y)
if (!tile) {
    sprite_index=sprEngineBlock
    visible=1
}

alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_place(x,y,Block)) instance_destroy()
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
if (tile) tile_delete(tile)
sound_play_slomo("sndBlockChange")
