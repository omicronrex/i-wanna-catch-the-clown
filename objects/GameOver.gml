#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_xscale=1/camera_zoom()
image_yscale=image_xscale

if (room=rmCar) image_index=1
if (room=rHerman) image_blend=$80ff

alarm[0]=40/dt

scale=-2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (Clownpiece) event_user(1)
visible=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    image_angle=-view_angle
    x=view_xcenter
    y=view_ycenter

    scale+=0.03
    if (scale>0) {
        scale=min(1,scale)
        d3d_transform_add_scaling(1,scale,1)
        d3d_transform_add_translation(x,608-16,0)
        draw_set_halign(1)
        draw_set_valign(1)
        draw_set_font(fntFileSmall)
        if (room=rHerman) col=$80ff
        else col=rainbow((current_time/16) mod 256)
        draw_text_outline(0,0,"Press ["+key_get_name(global.keycode[key_restart])+"] To Try Again",col)
        draw_set_halign(0)
        draw_set_valign(0)
        d3d_transform_set_identity()
    }

    if (image_index=1) rect(0,0,800,608,merge_color($ff,$ff4000,0.5+0.5*sin(current_time/40)),0.1)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=500
invert=0
*/
