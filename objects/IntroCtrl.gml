#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=1
timer=0
bg=-1

cutscene=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
intro_sequence()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
savedata("seen"+"title drop",0)
if (bg!=-1) background_delete(bg)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (timer<100) rect(0,0,room_width,room_height,0,1-timer/100)
if (timer>600 && timer<650) rect(0,0,room_width,room_height,$ffffff,1-(timer-600)/50)
if (timer>700 && timer<900) {
    d3d_set_projection_ortho(0,0,800,608,0)
    f=(timer-700)/200
    draw_clear(0)
    draw_set_blend_mode(bm_add)
    for (i=0;i<32;i+=1) {
        k=1+(i-16)/16*f
        a=180
        draw_background_ext(bg,xc+lengthdir_x(-xc*k,a*k-a)+lengthdir_x(-yc*k,-90+a*k-a),yc+lengthdir_y(-xc*k,a*k-a)+lengthdir_y(-yc*k,-90+a*k-a),k,k,a*k-a,$ffffff,1/32)
    }
    draw_set_blend_mode(0)
}
if (timer>800) rect(0,0,room_width,room_height,0,(timer-800)/100)
