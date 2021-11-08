#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=-1
image_speed=mmf_animspeed(70,80)
speed=-1/8

alarm[0]=25
alarm[1]=75

play_bg_music("zel3-ending",0)

alpha=-5

ay=-200
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=25

if (!irandom(5)) instance_create(0,0,CreditsTree)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[1]=75

if (!irandom(5)) instance_create(0,0,CreditsMountain)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
TextDraw.alpha=alpha

alpha=min(1,alpha+0.02)

ay=min(200,ay+2)
#define Collision_NiseBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_game_end()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprCongrats,0,400,ay)

draw_self()
