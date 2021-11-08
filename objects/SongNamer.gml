#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("musvol")==0) instance_destroy()
alpha=1
fade=0
alarm[0]=200
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fade) alpha-=0.02
if (alpha<0) instance_destroy()

x=max(800-32-8-48,x-8)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fntSignpost)
w=string_width(text)+4

x=800+w
y=35

if (text="") instance_destroy()
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (text!="") {
    draw_set_font(fntSignpost)
    color=rainbow((current_time/16) mod 256)
    a=alpha*alpha*0.7

    draw_set_halign(2)
    draw_set_color(0)
    draw_set_alpha(a)
    draw_text(x,y+2,text)
    draw_text(x,y-2,text)
    draw_text(x+2,y,text)
    draw_text(x-2,y,text)
    draw_text(x-1,y-1,text)
    draw_text(x+1,y-1,text)
    draw_text(x-1,y+1,text)
    draw_text(x+1,y+1,text)
    draw_set_alpha(alpha)
    draw_set_color(color)
    draw_text(x,y,text)
    draw_set_color($ffffff)
    draw_set_halign(0)
    draw_set_alpha(1)

    draw_sprite_ext(sprMusicNote,0,x,y+2,1,1,0,0,a)
    draw_sprite_ext(sprMusicNote,0,x,y-2,1,1,0,0,a)
    draw_sprite_ext(sprMusicNote,0,x+2,y,1,1,0,0,a)
    draw_sprite_ext(sprMusicNote,0,x-2,y,1,1,0,0,a)
    draw_sprite_ext(sprMusicNote,0,x-1,y-1,1,1,0,0,a)
    draw_sprite_ext(sprMusicNote,0,x+1,y-1,1,1,0,0,a)
    draw_sprite_ext(sprMusicNote,0,x-1,y+1,1,1,0,0,a)
    draw_sprite_ext(sprMusicNote,0,x+1,y+1,1,1,0,0,a)

    draw_sprite_ext(sprMusicNote,0,x,y,1,1,0,color,alpha)
}
