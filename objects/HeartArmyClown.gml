#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=2
go=0
hsp=random_range(0.5,1)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    hspeed=random_range(1,2)*hsp
    visible=1
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) other.x=bbox_right+5
#define Collision_NiseBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=other.x-32
speed=0
go=0
sound_play("sndRenBoink")
effect_create_above(ef_firework,x+16,y+16,1,$808080)
effect_create_below(ef_smoke,x+16,y+16,1,$808080)
