#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=0
name=""
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,1,x,y)
draw_sprite(sprite_index,2+frame,x,y)
draw_sprite(sprite_index,0,x,y)

dx=x+112
dy=y+251

draw_set_font(fTimes)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color(0)
draw_set_alpha(0.5)
draw_text(dx-1,dy-1,name)
draw_text(dx+1,dy-1,name)
draw_text(dx-1,dy+1,name)
draw_text(dx+1,dy+1,name)
draw_set_alpha(1)
draw_text(dx+1,dy,name)
draw_text(dx-1,dy,name)
draw_text(dx,dy+1,name)
draw_text(dx,dy-1,name)
draw_set_color($ffffff)
draw_text(dx,dy,name)
draw_set_halign(0)
draw_set_valign(0)
