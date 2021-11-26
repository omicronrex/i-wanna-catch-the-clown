#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprRenDiamant3) {
    sound_play("mjau")
    sprite_index=sprGlobalItemCat
    settings("cat",1)
}
