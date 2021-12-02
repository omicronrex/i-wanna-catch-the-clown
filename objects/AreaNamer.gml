#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=2

roomname=room_names(room)

if (roomname="" || savedata("seen"+roomname)) {instance_destroy() exit}

savedata("seen"+roomname,true)

lock_controls()

if (roomname="title drop") roomname="I Wanna Catch the Clown"
else roomname="Welcome to##"+roomname
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (SongNamer) {
    alarm[0]=200
    x=800+w+10
}

if (room=rTutorial) alpha-=0.0125
else alpha-=0.02

rect(0,0,800,608,0,alpha)

draw_set_alpha(1-abs(1-alpha))
draw_set_halign(1)
draw_set_valign(1)
draw_set_font(fntFileBig)
draw_text(400,304,roomname)
draw_set_alpha(1)
draw_set_halign(0)
draw_set_valign(0)

if (alpha<0) {
    unlock_controls()
    instance_destroy()
}
