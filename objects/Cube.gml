#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=point_direction(x,y,400,300)+random_range(0,135)
speed=random_range(3,6)/3

d=random(360)
p=random(360)

ax=lengthdir_zx(1,d,p)
ay=lengthdir_zy(1,d,p)
az=lengthdir_zz(1,d,p)

x=random_range(64,800-128)
y=random_range(64,608-128)
z=random_range(32,800)

rot=random(360)

rotspd=random_range(-2,2)

tex=background_get_texture(texBlock)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
motion_add(point_direction(x,y,400,304),0.01)

with (object_index) if (id!=other.id) motion_add(
    point_direction(x,y,other.x,other.y)+180,
    0.005/max(1,point_distance(x,y,other.x,other.y))
)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot+=rotspd

d3d_transform_set_rotation_axis(ax,ay,az,rot)
d3d_transform_add_translation(x,y,z)
d3d_model_draw(global.cubemod,0,0,0,tex)
d3d_transform_set_identity()
