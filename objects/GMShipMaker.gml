#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.5
hspeed=(400-x)/64
vspeed=-6
gravity=0.2
active=0
cam_y=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprShip) {
    x=(x*29+GameMaker.x)/30
    cam_y=max(-608,min(0,y-200))
} else {
    if (x<48) hspeed=abs(hspeed)
    if (x>800-48) hspeed=-abs(hspeed)
    if (y>608-48) {y=608-48 vspeed=-abs(vspeed)*0.8 hspeed*=0.9}
}

camera_set_raw(0,cam_y,1,0)
background_y[0]=cam_y
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (DeathBlocksL) if (y>other.y-200 && !lock) gravity=0.1
with (DeathBlocksR) if (y>other.y-200 && !lock) gravity=0.1
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    active=1
    x=Player.x
    y=Player.y
    vspeed=-4
    friction=0.1
    frozen=1
    Player.visible=0
    play_sound("sndItem")
    sprite_index=sprShipmake
    image_index=0
    image_speed=0.5
    play_bg_music("musRenBoss2",1)
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y<-3000) room_goto(rBoss2)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && sprite_index=sprShipmake) {
    sprite_index=sprShip
    image_index=0
    image_speed=0.5
    gravity=-0.1
    vspeed=3
    friction=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_halign(1)
if (!active) draw_text(x,y-32,"Get!")
draw_set_halign(0)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=500
invert=0
*/
