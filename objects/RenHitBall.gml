#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=5

tutorial=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=5

x+=lengthdir_x(12,dir)
y+=lengthdir_y(12,dir)

repeat (2) if (place_meeting(x,y,Block) || place_meeting(x,y,RenWallTransform)) {
    dir=(dir+180) mod 360
    x+=lengthdir_x(24,dir)
    y+=lengthdir_y(24,dir)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=1.5
image_yscale=1.5
if (place_meeting(x,y,Bullet)) {
    if (instance_number(RenHitBall)==1) play_sound("sndRenApplause")
    else play_sound("sndRenBall")
    instance_destroy()
}
image_xscale=1
image_yscale=1
