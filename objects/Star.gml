#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hsp=0.2+random(1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=hsp
if (x>800) instance_destroy()
draw_circle_color(view_xview+x,view_yview+y,random(2),$ffffff,0,0)
