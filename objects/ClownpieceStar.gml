#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
scale=3
image_alpha=0

angle=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=max(1,image_xscale-0.25)
image_alpha=1-(image_xscale-1)/2

angle-=5
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,1,x,y,scale*1.5,scale*1.5,angle,$ffffff,image_alpha*0.3)
draw_sprite_ext(sprite_index,1,x,y,scale,scale,angle,$ffffff,1)
