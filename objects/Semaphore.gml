#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=0
go=0
polis=0
pos=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (polis<15) alarm[0]=10
pos=(pos+1) mod 4
polis+=1

if (pos=0) {cx=-50 cy=background_y[1]+105}
if (pos=1) {cx=400 cy=-50}
if (pos=2) {cx=800+50 cy=background_y[1]+105}
if (pos=3) {cx=400 cy=650}


instance_create(cx,cy,StoppedPolice)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    y+=Racecar.mapspeed
    CJ.y+=Racecar.mapspeed
    background_y[1]+=Racecar.mapspeed
}

if (Racecar.y<background_y[1]+310 && frame==0 && !polis && !Racecar.saved) {
    polis=1
    alarm[0]=1
    sound_loop("sirens")

    CJ.direction=point_direction(400,304,CJ.x,CJ.y)
    CJ.speed=4
    CJ.sprite_index=sprManDown
    CJ.image_speed=0.5
    CJ.walking=0
    CJ.alarm[0]=-1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_sprite(sprSemaphore,frame,x,y)
draw_sprite(sprSemaphore,frame,x+64,y)
draw_sprite(sprSemaphore,frame,x+128,y)
