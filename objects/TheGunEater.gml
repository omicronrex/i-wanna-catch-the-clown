#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
timer=0
active=0
y+=32

//liftblock prop
phase=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(Player)) exit

if (place_meeting(x-16,y+24,Player) && active=-1) {
    if (global.player_weapon=weapon_default) {
        active=1
        timer=32
        instance_destroy_id(IntroBlock)
        instance_destroy_id(IntroSlope)
        lock_controls()
    }
}

if (active) {
    timer+=1
    if (!(timer mod 4)) {
        if (timer<32) effect_create_above(ef_smoke,x+random(32),512,0,$808080)
        if (timer>250 && timer<298) effect_create_above(ef_smoke,x+random(32),512,0,$808080)
        if (timer>320 && timer<380) {k=random(24) effect_create_above(ef_smoke,x+k,y+32-k,0,$808080)}
    }

    if (timer=100) {
        global.player_skin=skin_nogun
        global.player_weapon=weapon_none
        image_index=1
        sound_play("sndPac")
    }
    if (timer=150) {
        sound_play("sfx_staticmenace")
        image_speed=0.02
    }
    if (timer=250) {
        hspeed=-2
        sound_play("block")
    }
    if (timer=298) {
        hspeed=-1
        vspeed=1
        sound_play("block")
    }
    if (timer=418) {
        x=1184
        y=512
        hspeed=0
        vspeed=-1
        sound_play("block")
    }
    if (timer=450) {
        vspeed=0
        sound_play("earthquaketest (2)")
        effect_create_above(ef_firework,x+16,y+16,1,$808080)
        effect_create_above(ef_smoke,x+16,y+16,2,$808080)
    }
    if (timer=500) {
        Twister.mode=1
        sound_play("block")
    }
    if (timer=2100) {
        Twister.mode=4
    }

    if (hspeed<0) {
        with (instance_place(x-4,y,Player)) {
            x=min(x,other.x-6-other.hspeed)
            move_contact_solid(270,4)
        }
    }
}

if (image_index>2 && image_speed>0) {
    image_index=2
    image_speed=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(image_index),x,y)
draw_sprite_ext(sprite_index,ceil(image_index),x,y,1,1,0,$ffffff,frac(image_index))
