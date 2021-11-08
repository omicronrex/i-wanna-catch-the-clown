#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
m1=0
m2=0
m1inc=0.03
m2inc=0.02
ang=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
m1=max(0,min(1,m1+m1inc))
m2=max(0,min(1,m2+m2inc))
if (m1>=1) m1inc=-abs(m1inc)
if (m1<=0) m1inc=abs(m1inc)
if (m2>=1) m2inc=-abs(m2inc)
if (m2<=0) m2inc=abs(m2inc)
ang+=4
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var c1,c2,c3,c4;

c1=merge_color(c_red,c_blue,m1)
c2=merge_color(c_green,c_yellow,m2)
c3=merge_color(c_purple,c_lime,m1)
c4=merge_color(c_maroon,c_silver,m2)
draw_set_font(fRen1)
draw_set_halign(1)
draw_set_valign(1)
draw_text_transformed_color(540,210,'THE',2,2*m1,0,c3,c3,c4,c4,1)
draw_text_transformed_color(585,365,'BALL',2*m2,2,0,c1,c2,c3,c4,1)
draw_text_transformed_color(175,460,'dont',1,1,ang,c1,c2,c2,c1,1)
draw_set_halign(0)
draw_set_valign(0)
