#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=0.3
image_yscale=0.3
xp=GameMaker.x
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (GameMaker.state!="dead") image_angle-=(GameMaker.x-xp+GameMaker.go*20)*2
else if (!irandom(8)) {
    instance_create(x,y,GMBossExplosion)
    play_sound("sndRenExplode2")
}
xp=GameMaker.x
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (GameMaker.state!="dead") killPlayer()
#define Collision_GMBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) event_user(0)
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
