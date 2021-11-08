#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gen=instance_create(0,0,GameMaker3DGenerator)

image_xscale=2
image_yscale=2

hp=300

blend=-1

y=-999

timer=0

phase=1

clownbad=0
invincible=1
started=0
flash=0
fakeout=0
speedup=0
dead=0
dying=0
bepis=0
spinn=0
muspeed=0
straightsalvo=0
shotcount=-200

turretleft[0]=0
turretleft[1]=0
turretleft[2]=0

turretright[0]=0
turretright[1]=0
turretright[2]=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) instance_create(0,0,GM3DFadeOut)
room_speed=50
global.game_speed=50
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (difficulty=0) gmboss_easy()
if (difficulty=1) gmboss_normal()
if (difficulty=2) gmboss_hard()
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (started) kill_player()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_speed=50
global.game_speed=50
sound_kind_pitch(1,1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(gen.surf)) {
    draw_surface_ext(gen.surf,x-200,y+140,1,-1,0,merge_color(0,$ffffff,max(0,blend)),1)
}

if (hp>0 && started) {
    bar1=(hp-200)
    bar2=min(100,(hp-100))
    bar3=min(100,hp)

    rect(8-1,8-1,800-16+2,16+2,0,1)

    if (bar3>0) {
        draw_healthbar(8,8,400,24,bar3,0,$80ff,$80ff,1,0,0)
        draw_healthbar(400,8,800-8,24,bar3,0,$80ff,$80ff,0,0,0)
    }

    if (bar2>0) {
        draw_healthbar(8,8,400,24,bar2,0,$40d0ff,$40d0ff,1,0,0)
        draw_healthbar(400,8,800-8,24,bar2,0,$40d0ff,$40d0ff,0,0,0)
    }

    if (bar1>0) {
        draw_healthbar(8,8,400,24,bar1,0,$ffffff,$ffffff,1,0,0)
        draw_healthbar(400,8,800-8,24,bar1,0,$ffffff,$ffffff,0,0,0)
    }
}
