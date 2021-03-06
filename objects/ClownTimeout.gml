#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=30
alarm[0]=room_speed*2
alarm[1]=1

x=400
y=64
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-0.5
alarm[0]=room_speed
if (instance_exists(Player)) {
    time-=1

    if (time=-1) {
        Clownpiece.phase+=1
        Clownpiece.timer=0
        Clownpiece.spellcardbg=0
        Clownpiece.vulnerable=0
        if (Clownpiece.mode="limited") Clownpiece.hp=25
        instance_destroy()
        i=sound_play_paused("se_tan00")
        sound_volume(i,0.5)
        sound_resume(i)
    } else if (time<5) sound_play("se_timeout2")
    else if (time<10) sound_play("se_timeout")
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Clownpiece.spellrad=time*9+64
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=max(48,y)
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

draw_set_font(fntFileBig)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color(0)
draw_text(x+2,y+2,string(time))
draw_text(x-2,y+2,string(time))
draw_text(x+2,y-2,string(time))
draw_text(x-2,y-2,string(time))
draw_set_color($ffffff)
draw_text(x,y,string(time))
draw_set_halign(0)
draw_set_valign(0)
