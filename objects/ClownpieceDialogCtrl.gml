#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spr[0]=1 msg[0]=    "Hah, hah, hah..."
spr[1]=0 msg[1]="Die monster! You don't#belong in this world!"
spr[2]=1 msg[2]=    "Not quite. This land#was given to us fairies."
spr[3]=1 msg[3]=    "You're the one who doesn't#belong here, little lad!"
spr[4]=0 msg[4]="WHAT"
spr[5]=1 msg[5]=    "...but, I'm not sure what to do.#I've got no fight left in me."
spr[6]=0 msg[6]="Mm. I've sort of lost track#of my actual goal, here."
spr[7]=1 msg[7]=    "Ooh, I got a good idea just now."

line=-1

image_xscale=0
scalego=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
lock_controls()
line+=1
sound_play("sndTouhouShot")
if (line==8) {
    sound_play("se_tan00")
    visible=0
    screen_redraw()
    event_game_end()
} else {
    if (spr[line]) {
        ClownDialog.visible=1
        ClownDialog.focus=1
        KidDialog.focus=0
        scalego=-1
        image_xscale=0
        x=xstart+110
    } else {
        KidDialog.visible=1
        KidDialog.focus=1
        ClownDialog.focus=0
        scalego=1
        image_xscale=0
        x=xstart-110
    }

    text=msg[line]

    alarm[0]=200
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible && global.key_pressed[key_jump]) {
    alarm[0]=1
}

image_xscale=inch(image_xscale,scalego,0.1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if (abs(image_xscale)==1) {
    draw_set_halign(1)
    draw_set_valign(1)
    draw_set_color(0)
    draw_set_font(fntCalibri14)
    draw_text(x+110*scalego,y,text)
    draw_set_halign(1)
    draw_set_valign(1)
    draw_set_color($ffffff)
}
