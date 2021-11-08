#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=round(x/32)*32
gravity=0.2
dest=0
bounce=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dest=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dest) image_alpha-=0.01

if (image_alpha<0) instance_destroy()
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("sndItem")
GameMaker.getcandy=1
GameMaker.hp-=5
instance_destroy()
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!bounce) {
    bounce=1
    play_sound("sndRenBoink")
    move_contact_solid(270,speed)
    speed=0
    gravity=0
    alarm[0]=100
}
