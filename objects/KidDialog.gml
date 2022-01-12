#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=difficulty
focus=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (focus) {
    x=(x*9+(xstart))/10
    y=(y*9+(ystart))/10
    image_blend=merge_color(image_blend,$ffffff,1/10)
} else {
    x=(x*9+(xstart-50))/10
    y=(y*9+(ystart+20))/10
    image_blend=merge_color(image_blend,$999999,1/10)
}
