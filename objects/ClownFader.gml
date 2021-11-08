#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
Player.visible=0
cutscene=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha+=0.01
sound_effect_options(ef,0,val*(1-alpha))
music_volume(1-alpha)

rect(0,0,room_width,room_height,0,alpha)

if (alpha>=1.5) {
    instance_destroy_id(Player)
    instance_create(0,0,FadeIn)
    room_goto(rmClear)
}
