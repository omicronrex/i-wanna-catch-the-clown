#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndRenShot")

direction=direction_to_object(Racecar)
speed=10
#define Collision_Racecar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) {
    damage+=1
    if (damage>=6) {
        CJ.alarm[0]=-1
        CJ.sprite_index=sprManLeft
        CJ.image_speed=0.5
        CJ.hspeed=-2
    }
}
instance_destroy()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
