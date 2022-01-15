#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=difficulty

if (room=rHerman) image_index+=3

gravity=0.3
alarm[0]=5

if (!place_free(x,y)) {
    move_outside_solid(0,8)
    if (!place_free(x,y)) {
        x-=8
        move_outside_solid(180,8)
        if (!place_free(x,y)) {
            x+=8
            move_outside_solid(90,8)
            if (!place_free(x,y)) {
                y+=8
                move_outside_solid(270,8)
                if (!place_free(x,y)) {
                    y-=8
                }
            }
        }
    }
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (object_is_ancestor(other.object_index,Platform)) {
    if (vspeed>=0 && bbox_bottom<other.bbox_bottom) {
        y=other.y-9
        if (place_free(x+other.hspeed,y)) x+=other.hspeed
        vspeed=1
    }
} else {
    if (gravity!=0) {
        vspeed*=-0.5
        s=sound_play_paused("sndRenBoink")
        sound_volume(s,clamp(abs(vspeed/5),0.2,1))
        sound_resume(s)
    }

    if (abs(vspeed)<1) {
        vspeed=0
        move_outside_solid(90,8)
        move_contact_solid(270,8)
        gravity=0
    }
}
