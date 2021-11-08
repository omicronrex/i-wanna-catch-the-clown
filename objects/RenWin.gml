#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
roomTo=room_next(room)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    vol=settings("musvol")
    delta=vol/20
    repeat (20) {
        sleep(100)
        vol-=delta
        sound_kind_volume(1,vol)
    }

    with (Player) instance_destroy()
    input_clear()
    room_goto(roomTo)
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!go) {
    collect_items()
    play_sound("sndRenApplause")
    go=1
}
