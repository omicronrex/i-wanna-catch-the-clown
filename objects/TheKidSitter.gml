#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=5
active=0

//liftblock prop
phase=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(Player)) exit

if (!active) if (place_meeting(x,y-2,Player)) if (Player.vspeed>=0) {
    active=1
    lock_controls()
    Player.x=median(Player.x,x-2,x+32+2)
    sound_play("block")
    vspeed=1
    TheGunEater.vspeed=-1
}

if (y>ystart+32) {
    unlock_controls()
    y=ystart+32
    vspeed=0
    TheGunEater.vspeed=0
    TheGunEater.y=ystart
    TheGunEater.active=-1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(image_index),x,y)
draw_sprite_ext(sprite_index,ceil(image_index),x,y,1,1,0,$ffffff,frac(image_index))
