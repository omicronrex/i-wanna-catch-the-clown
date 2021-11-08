#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=2
global.fullscreen_cursor_visible=true

walled=0
clicks=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!walled) {
    if (view_xview>=room_width-800) {
        with (HeartArmyClown) go=1
        walled=1
    }
}

collect_items()

if (!instance_exists(ClownPortal)) effect_create_above(ef_cloud,random(room_width),random(room_height),2,$808080)
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=115
applies_to=self
invert=0
arg0=0
arg1=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndRenBoink")
effect_create_below(ef_smoke,x+16,y+16,1,$808080)
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (speed<6) {
    sound_play("sndRenClown3")
    if (speed=0) direction=choose(45,90,135)
    else direction=choose(45,135,225,315)
    speed+=1
    clicks+=1
    effect_create_above(ef_firework,x+16,y+16,1,$808080)
    effect_create_below(ef_smoke,x+16,y+16,1,$808080)
} else {
    camera_follow(Player)
    sound_play("sndRenGlass")
    global.fullscreen_cursor_visible=false

    repeat (100) instance_create(x+16,y+16,ClownShard)

    effect_create_above(ef_firework,x+16,y+16,2,$808080)
    effect_create_below(ef_smoke,x+16,y+16,2,$808080)

    instance_create(x,y,ClownPortal)
    x+=1000
    speed=0

    with (HeartArmyClown) {
        instance_create(x+16,y+16,ArmyClownBall)
        instance_destroy()
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.fullscreen_cursor_visible=false
