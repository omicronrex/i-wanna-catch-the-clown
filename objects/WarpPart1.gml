#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
motion_add(point_direction(x,y,16,16),point_distance(x,y,16,16)/60)

direction+=random_range(-2,2)

x=median(6,x,28)
y=median(6,y,28)
