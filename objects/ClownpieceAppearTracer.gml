#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=f*1.01+0.005
path_speed+=0.05

with (instance_create(x+random_range(-64,64),y+random_range(-64,64),ClownpieceAppearEffect)) {
    speed=random(7)
    direction=other.direction+random_range(-10,10)
    image_blend=0
    depth=-99
    owner=other.id
}

if (choose(0,1))
with (instance_create(x+random_range(-64,64),y+random_range(-64,64),ClownpieceAppearEffect)) {
    speed=random(7)
    direction=other.direction+random_range(-10,10)
    image_blend=other.color
    owner=other.id
}
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
