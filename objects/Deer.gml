#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dead=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=Racecar.mapspeed

if (dead) {
    dead+=1
    if (dead<20) {
        repeat (10) {
            instance_create(x,y+8,CarBlood)
        }
    }
} else {
    x=inch(x,Racecar.x,0.5)
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>room_height) instance_destroy()
