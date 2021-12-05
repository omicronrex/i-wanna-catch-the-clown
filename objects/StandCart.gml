#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=max(ystart,y-1)

if (i) {
    vol=max(0,vol-0.01)
    sound_volume(i,vol)
    if (vol==0) {
        sound_stop(i)
        i=-1
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.vspeed>2 && y=ystart) {
    if (i) sound_stop(i)
    i=sound_play_paused("sndRenBossWall")
    sound_volume(i,0.3)
    sound_resume(i)
    vol=0.3
    y=ystart+3
}
