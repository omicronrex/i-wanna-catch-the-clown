#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) {
    x=mean(x,Player.x)
    y=mean(y,Player.y)

    Player.djump=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x+16,y-16,1,1,0,$ffffff,0.75)
draw_sprite_ext(sprite_index,0,x-16,y-16,-1,1,0,$ffffff,0.75)
