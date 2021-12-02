#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=30
alarm[0]=room_speed*2

x=800-48
y=48
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=room_speed
time-=1

if (time=0) {
    Clownpiece.phase+=1
    Clownpiece.timer=0
    instance_destroy()
} else if (time<=3) sound_play("se_timeout2")
else if (time<=10) sound_play("se_timeout")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_subtract)
draw_ellipse_color(x-32,y-20,x+32,y+20,$ffffff,0,0)
draw_set_blend_mode(bm_add)
draw_ellipse_color(x-32,y-20,x+32,y+20,$ff,0,0)
draw_set_blend_mode(0)

draw_set_font(fntSignpost)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color(0)
draw_text(x,y,string(time))
draw_set_color($ffffff)
draw_set_halign(0)
draw_set_valign(0)
