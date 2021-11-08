#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go==2) {
    y-=6
    image_xscale+=12/(image_xscale*32)
    image_yscale=image_xscale
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go+=1
if (go=1) {vspeed=4 sound_play("sndDelfruit")}
if (go=2) sound_play("sndMegaDelfruit")
