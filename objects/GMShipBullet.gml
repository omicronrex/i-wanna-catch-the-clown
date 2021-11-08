#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-16

image_speed=0

damage=0.30
#define Collision_GameMaker3D
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.started && !other.dying) {
    if (!other.invincible) {
        other.hp-=damage
        other.solid=1
        move_contact_solid(direction,speed)
        other.solid=0

        other.flash=1

        instance_create(x,y,GMBulletExplosion)
        instance_destroy()
    } else {
        sound_play("beep4")
        direction=choose(225,315)
    }
}
#define Collision_GMEnemy1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.hp-=damage
other.solid=1
move_contact_solid(direction,speed)
other.solid=0
other.flash=1
instance_create(x,y,GMBulletExplosion)
instance_destroy()
#define Collision_GMShield
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (GameMaker3D.invincible!=1 && !other.dead) {
    other.hp-=damage
    other.solid=1
    move_contact_solid(direction,speed)
    other.solid=0
    other.flash=1
    instance_create(x,y,GMBulletExplosion)
    instance_destroy()
} else {
    sound_play("beep4")
    direction=choose(225,315)
}
#define Collision_GMHappyTurret
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.hp-=damage
other.solid=1
move_contact_solid(direction,speed)
other.solid=0
other.flash=1
instance_create(x,y,GMBulletExplosion)
instance_destroy()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
