#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//nah actually thats mean let them have fun
//if (savedata("herman")) instance_change(Block,1)
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
if (tile) tile_delete(tile)
if (tile2) tile_delete(tile2)
if (tile3) tile_delete(tile3)
if (tile4) tile_delete(tile4)
if (tile5) tile_delete(tile5)
sound_play_slomo("sndBlockChange")
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile=tile_layer_find(1000,x,y)

tile2=tile_layer_find(999,x,y)
tile3=tile_layer_find(999,x+16,y)
tile4=tile_layer_find(999,x,y+16)
tile5=tile_layer_find(999,x+16,y+16)
