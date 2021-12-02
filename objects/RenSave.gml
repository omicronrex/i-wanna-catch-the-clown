#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index==0) if (instance_exists(Player)) {
    image_index=1
    image_speed=1/50
    play_sound("sndRenBeep5")
    save=1

    with (Racecar) {petrol=1000 damage=0 tnt=max(2,tnt) sound_play("sndItem")}

    with (GameMaker) {with (WarpToHub) instance_destroy() active=1 state="begin" with (other) {effect_create_above(ef_firework,x+16,y+16,2,$ff00) alarm[0]=2}}

    if (room=rmHistory) with (instance_nearest(x,y,TextDraw))
        text="Thanks for playing!##Difficulty:#"+global.name_difficulties[difficulty]+
             "#Resets: "+string(savedata("deaths"))+
             "#Time: "+format_time(savedata("time"))
}
