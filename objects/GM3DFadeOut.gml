#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha+=0.02

music_volume(1-alpha)

rect(0,0,room_width,room_height,$808080,alpha)
if (alpha>1) {
    //instance_destroy_id(Player)
    room_goto_next()
}
