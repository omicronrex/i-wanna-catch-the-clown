#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1
if (timer=40) {
    speed=0
    if (Clownpiece.laserinst) sound_stop(Clownpiece.laserinst)
    Clownpiece.laserinst=play_sound("sndTouhouLazer")
    i=instance_create(x,y,ClownLaser)
}

if (timer>40 && timer<150) {
    effect_create_below(ef_spark,x,y,1,$ff8000)
}

if (timer>150) {
    image_alpha-=0.05
    if (image_alpha<0) {
        with (i) instance_destroy()
        instance_destroy()
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,random_range(1.5,2),random_range(1.5,2),random(360),$ff0000,image_alpha)
draw_sprite_ext(sprite_index,0,x,y,random_range(1,1.2),random_range(1,1.2),random(360),$ffffff,image_alpha)
