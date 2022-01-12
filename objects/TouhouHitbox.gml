#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=200
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha-=0.02
if (image_alpha>0) alarm[0]=1
else visible=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) {
    x=Player.x
    y=Player.y
} else instance_destroy()

if (place_meeting(x,y,TouhouKiller)) kill_player()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_sprite_ext(sprInfinity,0,x,y,1,1,0,$ffffff,image_alpha)
