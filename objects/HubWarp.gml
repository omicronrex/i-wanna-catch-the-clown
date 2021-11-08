#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c1=0
c2=0

var num; num=irandom(30)

repeat (10) {
    i=instance_create(random_range(8,24),random_range(8,24),WarpPart1)
    i.speed=random_range(1,2)
    i.direction=random(360)
    i.owner=id
    with (i) repeat (num) {event_step() x+=hspeed y+=vspeed}
    p1[c1]=i c1+=1
}

repeat (8) {
    i=instance_create(random_range(8,24),random_range(8,24),WarpPart2)
    i.speed=random_range(1,2)
    i.direction=random(360)
    i.owner=id
    with (i) repeat (num) {event_step() x+=hspeed y+=vspeed}
    p2[c2]=i c2+=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_translation(x,y,0)

draw_set_circle_precision(32)

draw_set_blend_mode(bm_subtract)
repeat (2) draw_circle_color(16,16,24,$c0c0c0,0,0)
draw_set_blend_mode(0)

draw_set_circle_precision(8)

draw_set_color($696969)
for (i=0;i<c1;i+=1) {o=p1[i] draw_circle(16-(16-o.x)*0.7,o.y,6,0)}
for (i=0;i<c2;i+=1) {o=p2[i] draw_circle(16-(16-o.x)*0.6,16-(16-o.y)*0.7,6,0)}

draw_set_color($c0c0c0)
for (i=0;i<c2;i+=1) {o=p2[i] draw_circle(16-(16-o.x)*0.5,16-(16-o.y)*0.6,4,0)}

draw_set_color($d2d2d2)
for (i=0;i<c1;i+=1) {o=p1[i] draw_circle(16-(16-o.y)*0.5,16-(16-o.x)*0.6,3,0)}
for (i=0;i<c2;i+=1) {o=p2[i] draw_circle(16-(16-o.x)*0.3,16-(16-o.y)*0.4,3,0)}

draw_set_color($ffffff)
for (i=0;i<c1;i+=1) {o=p1[i] draw_circle(16-(16-o.y)*0.2,16-(16-o.x)*0.3,3,0)}
for (i=0;i<c2;i+=1) {o=p2[i] draw_circle(16-(16-o.y)*0.2,16-(16-o.x)*0.3,3,0)}

draw_set_alpha(1)

draw_set_circle_precision(16)

d3d_transform_set_identity()
