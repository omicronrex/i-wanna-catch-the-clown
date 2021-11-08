#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
itemid="itemItem"+string_digits(object_get_name(object_index))
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!savedata(itemid)) {
    image_blend=0
    image_alpha=0.5
    i=instance_create(x,y,Sus)
    with (HubWarp) if (roomTo=other.location) {
        other.i.dx=x+16-0.5
        other.i.dy=y+16-0.5
    }
}
