#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

alarm[0]=200

snd=sound_loop_paused("helicopter_loop")
sound_volume(snd,0)
sound_resume(snd)

vol=0
blade=0

count=0
go=0

z=80
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!Racecar.dead) {
    alarm[0]=170-count*10
    instance_create(x,y,PoliceBomb)
    count+=1

    if (count=15) {alarm[1]=150 image_angle=10}
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vol=2
go=1
image_angle=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    if (visible) {
        image_angle*=1.03
        vol-=0.01
        sound_pitch(snd,vol)
        direction-=10
        speed+=0.1
        blade+=10*vol
        z=80*(1-speed/12)
        if (speed>12 && visible) {
            o=instance_create(x,y,CarExplode)
            o.image_xscale=10
            o.image_yscale=10
            o.image_speed=0.2
            sound_stop(snd)
            visible=0
            camera_shake(32)
            Racecar.maxmapspeed=10
            Racecar.mapspeedspeed=0.1
        }
    }
} else {
    blade+=20
    x+=(Racecar.x-x)/30
    y=(y*29+500)/30

    image_angle=point_direction(x,200,Racecar.x,0)-90

    vol=min(1,vol+0.02)
    sound_volume(snd,vol)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,2,2,image_angle,$ffffff,1)

if (!go) {
    draw_sprite_ext(sprite_index,1,x,y,2,2,image_angle+blade,$ffffff,0.5)
    draw_sprite_ext(sprite_index,1,x,y,2,2,image_angle+blade-20,$ffffff,0.25)
    draw_sprite_ext(sprite_index,1,x,y,2,2,image_angle+blade-40,$ffffff,0.125)
} else draw_sprite_ext(sprite_index,1,x,y,2,2,image_angle+blade,$ffffff,1)
