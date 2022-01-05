#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
angle=270
mode=0
red=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1
if (timer=40) {
    speed=0
    if (mode=1) angle=point_direction(Clownpiece.x+80,Clownpiece.y-270,x,y)
    if (mode=-1) angle=point_direction(Clownpiece.x-80,Clownpiece.y-270,x,y)
    if (mode=2) angle=point_direction(Clownpiece.x+50,Clownpiece.y-600,x,y)
    if (mode=-2) angle=point_direction(Clownpiece.x-50,Clownpiece.y-600,x,y)
    if (red && instance_exists(Player)) angle=point_direction(x,y,Player.x,Player.y)

    if (Clownpiece.laserinst) sound_stop(Clownpiece.laserinst)
    Clownpiece.laserinst=play_sound("sndTouhouLazer")
    i=instance_create(x,y,ClownLaser)
    i.image_angle=angle
    i.red=red
}

if (timer>40 && timer<150) {
    if (red) effect_create_below(ef_spark,x,y,1,$ff)
    else effect_create_below(ef_spark,x,y,1,$ff8000)
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
if (red) draw_sprite_ext(sprite_index,0,x,y,random_range(1.5,2),random_range(1.5,2),random(360),$ff,image_alpha)
else draw_sprite_ext(sprite_index,0,x,y,random_range(1.5,2),random_range(1.5,2),random(360),$ff0000,image_alpha)
draw_sprite_ext(sprite_index,0,x,y,random_range(1,1.2),random_range(1,1.2),random(360),$ffffff,image_alpha)
