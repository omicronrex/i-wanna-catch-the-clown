#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat (70) {
    instance_create(400,150,GameMakerBackgroundStar)
    with (GameMakerBackgroundStar) {
        speed*=1.02
        y+=abs(vspeed)/2
        x+=hspeed
        y+=vspeed
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(400,150,GameMakerBackgroundStar)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rect(0,0,800,608,0,0.6)
draw_set_blend_mode(bm_add)
