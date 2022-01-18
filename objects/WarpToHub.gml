#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

//this warp can be used to return to the hub room configured in the engine settings

if (!savedata("clear")) instance_destroy()

msg="Press UP to return to hub."

font=fntSignpost
color=$ffffff

active=0
going=0
depth=-1

if (!room_exists(global.hub_room)) instance_destroy()

instance_create(x,y,WarpToHubPoint)

repeat (10) {
    i=instance_create(random_range(8,24),random_range(8,24),WarpPart1)
    i.speed=random_range(1,2)
    i.direction=random(360)
    i.owner=id
}

repeat (8) {
    i=instance_create(random_range(8,24),random_range(8,24),WarpPart2)
    i.speed=random_range(1,2)
    i.direction=random(360)
    i.owner=id
}

var num; num=irandom(30)

with (WarpPart1) if (owner=other.id) repeat (num) {event_step() x+=hspeed y+=vspeed}
with (WarpPart2) if (owner=other.id) repeat (num) {event_step() x+=hspeed y+=vspeed}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=median(0.5,1,1-distance_to_object(Player)/100)
active=0

with (Player) {
    with (instance_nearest(x,y,WarpToHubPoint)) {
        n=instance_nearest(x,y,RenSave)
        with (WarpToHub) {
            if (other.id!=current) {
                current=other.id
                n=instance_nearest(x,y,RenSave)
                step1x=x
                step1y=y
                step2x=n.x
                step2y=n.y
                step3x=other.n.x
                step3y=other.n.y
                step4x=other.x
                step4y=other.y
                going=1
                f=0
            }
        }
    }
}

if (going) {
    f=min(3,f+0.05)

    if (f<1) {
        x=cosine(step1x,step2x,f)
        y=cosine(step1y,step2y,f)
    } else if (f<2) {
        x=cosine(step2x,step3x,f-1)
        y=cosine(step2y,step3y,f-1)
    } else if (f<3) {
        x=cosine(step3x,step4x,f-2)
        y=cosine(step3y,step4y,f-2)
    } else {
        going=0
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!going) {
    active=1

    if (global.key_pressed[key_up]) {
        instance_destroy_id(Player)
        room_goto(global.hub_room)
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (Player) {
    with (instance_nearest(x,y,WarpToHubPoint)) {
        with (WarpToHub) {
            current=other.id
            x=current.x
            y=current.y
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_translation(x,y,0)

draw_set_alpha(image_alpha*image_alpha*image_alpha*image_alpha*image_alpha)

draw_set_circle_precision(32)

draw_set_blend_mode(bm_subtract)
repeat (2) draw_circle_color(16,16,24,merge_color(0,$c0c0c0,image_alpha),0,0)
draw_set_blend_mode(0)

draw_set_circle_precision(8)

draw_set_color($696969)
with (WarpPart1) if (owner=other.id) draw_circle(16-(16-x)*0.7,y,6,0)
with (WarpPart2) if (owner=other.id) draw_circle(16-(16-x)*0.6,16-(16-y)*0.7,6,0)

draw_set_color($c0c0c0)
with (WarpPart2) if (owner=other.id) draw_circle(16-(16-x)*0.5,16-(16-y)*0.6,4,0)

draw_set_color($d2d2d2)
with (WarpPart1) if (owner=other.id) draw_circle(16-(16-y)*0.5,16-(16-x)*0.6,3,0)
with (WarpPart2) if (owner=other.id) draw_circle(16-(16-x)*0.3,16-(16-y)*0.4,3,0)

draw_set_color($ffffff)
with (WarpPart1) if (owner=other.id) draw_circle(16-(16-y)*0.2,16-(16-x)*0.3,3,0)
with (WarpPart2) if (owner=other.id) draw_circle(16-(16-y)*0.2,16-(16-x)*0.3,3,0)

draw_set_alpha(1)

draw_set_circle_precision(16)

d3d_transform_set_identity()
