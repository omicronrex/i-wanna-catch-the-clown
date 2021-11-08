#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=2
image_yscale=2

state=0
timer=0
color=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (distance_to_object(Player)<30) {
    if (state=0) {
        state=1
        sound_play("bleep14")
        color=$ff
        timer=-20
    }
}

if (state=1) {
    timer+=1
    if (timer=20) with (ItemTrinket1) if (image_blend!=0) {vspeed=1 sound_play("sndBlockChange")} else sound_play("sndRenBonk")
    if (timer=40) with (ItemTrinket2) if (image_blend!=0) {vspeed=1 sound_play("sndBlockChange")} else sound_play("sndRenBonk")
    if (timer=60) with (ItemTrinket3) if (image_blend!=0) {vspeed=1 sound_play("sndBlockChange")} else sound_play("sndRenBonk")
    if (timer=80) with (ItemTrinket4) if (image_blend!=0) {vspeed=1 sound_play("sndBlockChange")} else sound_play("sndRenBonk")
    if (timer=100) with (ItemTrinket5) if (image_blend!=0) {vspeed=1 sound_play("sndBlockChange")} else sound_play("sndRenBonk")
    if (timer=120) with (ItemTrinket6) if (image_blend!=0) {vspeed=1 sound_play("sndBlockChange")} else sound_play("sndRenBonk")
    if (timer=140) with (ItemTrinket7) if (image_blend!=0) {vspeed=1 sound_play("sndBlockChange")} else sound_play("sndRenBonk")
    if (timer=160) with (ItemTrinket8) if (image_blend!=0) {vspeed=1 sound_play("sndBlockChange")} else sound_play("sndRenBonk")

    if (timer=200) {
        if (
            has_item("Item1") &&
            has_item("Item2") &&
            has_item("Item3") &&
            has_item("Item4") &&
            has_item("Item5") &&
            has_item("Item6") &&
            has_item("Item7") &&
            has_item("Item8")
        ) {
            state=2
            color=$ff00
            sound_play("bleep5")
        } else {
            state=3
            color=0
            sound_play("bleep14")
        }
    }
}
if (state=2) {
    timer+=1
    if (timer=250) {
        camera_shake(4,50)
        sound_play("door27")
        vspeed=1.3
        state=2
    }
    if (y>ystart+64) {
        y=ystart+64
        vspeed=0
        camera_shake(4,50)
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y,Player)) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dx=floor(x)-0.5
dy=floor(y)-0.5
draw_background_ext(texBlock,x,y,2,2,0,$ffffff,1)
draw_set_color($808080)
draw_circle(dx+32,dy+20,16,0)
draw_triangle(dx+32,dy+4,dx+16,dy+56,dx+48,dy+56,0)
draw_set_color(color)
draw_circle(dx+32,dy+20,14,0)
draw_triangle(dx+32,dy+8,dx+18,dy+54,dx+46,dy+54,0)
draw_set_color($ffffff)
