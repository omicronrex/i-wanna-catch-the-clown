#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=$404040
if (abs(400-x)>180) image_blend=$4080
image_alpha=Racecar.vol
image_xscale=3
image_yscale=(Racecar.mapspeed-Racecar.vspeed)*0.55
image_angle=Racecar.angle-90
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=Racecar.mapspeed
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
