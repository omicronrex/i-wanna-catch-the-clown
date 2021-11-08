#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=vine boom
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=8
image_xscale=0.5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
alarm[0]=2
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dx+=0.5
dy+=0.5
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($ff)
for (i=0;i<360;i+=10) {
    draw_circle(dx+lengthdir_x(32,i),dy+lengthdir_y(32,i),2,0)
    draw_line_width(dx+lengthdir_x(32,i),dy+lengthdir_y(32,i),dx+lengthdir_x(32,i+10),dy+lengthdir_y(32,i+10),4)
}
draw_set_color($ffffff)
