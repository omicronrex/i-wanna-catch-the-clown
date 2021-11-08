#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grid=mp_grid_create(32,32,23,17,32,32)
mp_grid_add_instances(grid,Block,1)
with (PlayerKiller)
    if (object_index!=RenFrog && object_index!=RenFrog2 && object_index!=RenSkull)
        mp_grid_add_instances(other.grid,id,1)
path=path_add()
hastomove=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=0

move_snap(32,32)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hastomove && speed=0) {
    hastomove=0
    if (mp_grid_path(grid,path,x+16,y+16,Player.x,Player.y,0)) {
        p1x=path_get_point_x(path,0)
        p1y=path_get_point_y(path,0)
        p2x=path_get_point_x(path,1)
        p2y=path_get_point_y(path,1)

        direction=round(point_direction(p1x,p1y,p2x,p2y)/90)*90
        speed=4
        alarm[0]=32/speed
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mp_grid_destroy(grid)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hastomove=1
