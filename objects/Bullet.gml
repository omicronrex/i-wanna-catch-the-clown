#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ren=0
if (room!=rmIntro) {
    ren=1
    sprite_index=sprRenBullet
    image_speed=0.1
    if (room=rmCar) image_speed=0
}

silent=0

if (instance_exists(Player)) alarm[0]=40/(Player.slomo*dt)
else alarm[0]=40/dt
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ren && !silent) {
    play_sound("sndRenBoink")
    if (room=rmCar) instance_create(x,y,GMBulletExplosion)
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
silent=1
instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a=instance_place(x,y,Block)
if (a) {
    if (a.solid) instance_destroy()
    if (a.object_index=ShootBlock || a.object_index=ShootBlockBig) instance_destroy_id(a)
}
#define Collision_NiseBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
silent=1
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ren) {
    if (room=rHerman) draw_sprite(sprite_index,2,floor(x),floor(y))
    else {
        draw_sprite(sprite_index,0,floor(x),floor(y))
        draw_sprite_ext(sprite_index,1,floor(x),floor(y),1,1,0,$ffffff,abs(1-image_index))
    }
} else draw_self()
