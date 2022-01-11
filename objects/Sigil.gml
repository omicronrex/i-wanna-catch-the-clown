#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sqscale=0
sqscale2=0
sqrot=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sqscale=min(1,sqscale+0.03)
sqscale2=min(0.9,sqscale2+0.03)
if (sqscale<1) sqrot+=5 else sqrot+=1

if (instance_exists(Clownpiece)) {
    x=Clownpiece.x
    y=Clownpiece.y
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprMagicsquare,0,x,y,sqscale,sqscale2,sqrot,$ffffff,sqscale*0.8)
draw_set_blend_mode(0)
texture_set_interpolation(0)
