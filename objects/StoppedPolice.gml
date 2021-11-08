#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.2

direction=roundto(point_direction(x,y,400,304),90)
speed=9

hit=0
k=random(pi)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!hit) direction=inch_angle(direction,point_direction(x,y,Racecar.x,Racecar.y),1)+sin(current_time/100+k)*4

image_angle=direction-90
#define Collision_Racecar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!hit) {
    sound_play("sndRenBossWall")
    hit=1
    sprite_index=sprPolDed
    speed=0
    carticles()

    with (other) {
        active=0
        sound_play("sndRenBonk")
        vspeed=0
        event_user(1)
    }
}
#define Collision_StoppedPolice
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!hit && other.hit) {
    sound_play("sndRenBossWall")
    hit=1
    sprite_index=sprPolDed
    speed=0
    carticles()
}
