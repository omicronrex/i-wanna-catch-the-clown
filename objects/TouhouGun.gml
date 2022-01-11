#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) if (!cutscene) {
    x=mean(x,Player.x)
    y=mean(y,Player.y)
    gravity=0
    speed=0

    Player.djump=1
}
if (instance_exists(Grave)) {
    x=mean(x,Grave.x)
    y=mean(y,Grave.y)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x+16,y-16,1,1,0,$ffffff,0.75)
draw_sprite_ext(sprite_index,0,x-16,y-16,-1,1,0,$ffffff,0.75)
