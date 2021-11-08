#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1/120

for (i=0;i<256;i+=1) {
    k=i mod 32
    f=sqr((256-i)/256)
    rot=(((0.5+0.5*sin(7+timer+i/511)*sin(11+timer*1.682+i/111)*sin(13+timer*1.442+i/345)*f)*360) mod 90)
    draw_sprite_part_ext(sprite_index,0,0,k,160,1,x+80+80*sin(5+timer*1.851+i/452)*sin(19+timer*1.13+i/579)*f+lengthdir_x(-80,rot)+lengthdir_x(-80,rot-90),y+i,dcos(rot),1,merge_color($606060,$ffffff,dcos(rot)),1)
    draw_sprite_part_ext(sprite_index,0,0,k,160,1,x+80+80*sin(5+timer*1.851+i/452)*sin(19+timer*1.13+i/579)*f+lengthdir_x(-80,rot)+lengthdir_x(-80,rot-90)+160*dcos(rot),y+i,dsin(rot),1,merge_color($606060,$ffffff,dsin(rot)),1)
}
