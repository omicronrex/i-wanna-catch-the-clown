#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=0
angle=0
fade=0

points="0"
counter=0
length=0

instance_create(x+16,y+16,PortalFader)

ef=sound_kind_effect(1,se_gargle)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=(scale+0.01)*1.01
angle+=1

counter+=1
if (counter=10) {counter=1 length+=1}
points="-"+string(counter)
repeat (length) points+=string(irandom(9))

if (scale>5000) {
    if (fade=0) {
        fade=instance_create(0,0,ClownFader)
        fade.ef=ef
        fade.val=sqrt(sqrt(scale/6000))
    }
} else {
    camera_shake(1+scale/500)

    sound_effect_options(ef,0,sqrt(sqrt(scale/6000)))
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_effect_destroy(ef)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_primitive_begin(pr_trianglefan)
    draw_vertex_color(x+16,y+16,0,1)
    l=scale*random_range(1,1.05)+random(10)
    a=random(1)
    l1=l
    a1=a
    for (i=0;i<360;i+=5) {
        draw_vertex_color(x+16+lengthdir_x(l,angle+i),y+16+lengthdir_y(l,angle+i),0,a)
        l=scale*random_range(1,1.05)+random(10)
        a=random(1)
    }
    draw_vertex_color(x+16+lengthdir_x(l1,angle+i),y+16+lengthdir_y(l1,angle+i),0,a1)
draw_primitive_end()
