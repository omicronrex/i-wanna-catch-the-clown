#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=round(x/32)*32
vspeed=8
image_speed=0
active=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed<0 && y<160) {
    vspeed=0
    hspeed=8*sign(GameMaker.x-x)
    play_sound("sndRenClown")
}

if (speed=0 && !active && instance_exists(Player) && !ShovelBoss.go) if (Player.bbox_bottom>y && Player.bbox_top<y+32)
    if (!collision_line(x+16,y+16,Player.x,y+16,Block,0,0) && !collision_line(x+16,y+16,Player.x,y+16,RenWallTransform,0,0)) {
        vspeed=0
        hspeed=8*sign(Player.x-x)
        play_sound("sndRenClown")
    }

if (!active && speed=0 && instance_exists(Player)) {
    if (place_meeting(x,Player.y,Player)) {
        active=1
        play_sound("sndRenClown")
        hspeed=0
        vspeed=-8
    }
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    with (other) instance_destroy()
    active=1
    GameMaker.shootclown=1
    play_sound("sndRenClown")
    hspeed=0
    y-=vspeed
    vspeed=-8
}
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed>0) {
    move_contact_solid(270,vspeed)
    vspeed=0
} else {
    instance_create(x+16,y+16,RenGMExplosion)
    instance_destroy()
}
#define Collision_GameMaker
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    play_sound("sndRenExplode")
    other.hp-=5
    instance_create(x,y,GMBossExplosion)
    instance_destroy()
}
