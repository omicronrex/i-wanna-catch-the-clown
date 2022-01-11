#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=Player.oldspr
image_xscale=Player.facing
image_index=floor(Player.oldfr)

flash=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!flash) {
    image_yscale+=0.1
    image_xscale-=sign(image_xscale)*0.05

    if (image_yscale>3) {
        visible=0
        unlock_controls()
        flash=1
    }
} else {
    flash+=1
    Player.visible=(flash mod 5) < 3
    if (flash>=100) {
        instance_destroy()
        Player.visible=1
    }
}
