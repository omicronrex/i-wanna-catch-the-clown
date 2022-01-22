#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
select=settings("lastfile")
image_speed=0.2*dt

dx=x+240*select+65

asksel=0

state=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((keyboard_check_pressed(ord("Z")) && keyboard_check(vk_control)) || keyboard_check_pressed(vk_f5)) {
    sound_play("sndItem")
    savedata_read()
    state=""
    exit
}

if (global.key_pressed[key_menu]) {
    room_goto(rmOptions)
}

if (global.key_pressed[key_shoot]) {
    if (state!="") {
        state=""
    } else room_goto(rmTitle)
}

if (state="") {
    if (global.key_pressed[key_left] || global.key_pressed[key_right]) {
        sound_play("sndJump")
        select=modwrap(select+global.input_h,0,3)
    }
    if (global.key_pressed[key_jump]) {
        sound_play("sndDJump")
        savedata_select(select)
        asksel=0
        if (savedata("saved")) {
            state="continue"
        } else {
            state="new file"
        }
        input_clear()
    }
}

//continue or erase
if (state="continue") {
    if (global.key_pressed[key_up] || global.key_pressed[key_down]) {
        sound_play("sndJump")
        asksel=!asksel
        askcount=0
    }
    if (global.key_pressed[key_jump]) {
        if (asksel) {
            askcount+=1
            if (askcount=5) {
                sound_play("sndDeath")
                savedata_default(select)
                state=""
                World.messagetext="Press Ctrl-Z to Undo"
                World.message=200
            } else sound_play("sndShoot")
        } else {
            instance_destroy_id(TitleParticle)
            instance_destroy_id(TitleMenu)
            input_clear()
            savedata_select(select)
            savedata_load()
        }
    }
}

//new file
if (state="new file") {
    if (global.key_pressed[key_left] || global.key_pressed[key_right]) {
        sound_play("sndJump")
        savedata_select(select)
        savedata("diff",modwrap(savedata("diff")+global.input_h,0,global.num_difficulties))
        difficulty=savedata("diff")
    }
    if (global.key_pressed[key_jump]) {
        instance_destroy_id(TitleParticle)
        instance_destroy_id(TitleMenu)
        input_clear()
        savedata_newgame(select)
    }
}

dx=inch(dx,x+select*239+65,16*dt)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
settings("lastfile",select)
savedata_write()

//disable any system messages when leaving the menu
World.message=-1
World.message2=-1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;

draw_set_halign(1)
draw_set_font(fntFileBig)
draw_set_color(0)
draw_text(400,48,"Welcome to Game Maker.")

bow=0

draw_set_color($ffffff)
for (i=0;i<3;i+=1) {
    savedata_select(i)

    draw_set_halign(1)
    draw_set_font(fntFileBig)
    draw_text(x+i*240+64,y,"Game "+string(i+1))
    draw_set_font(fntFileSmall)

    if (savedata("saved")) {
        if (select==i) {
            bow=(difficulty==0)
            if (difficulty=2) sprite_index=sprPlayerIdleH
            else sprite_index=sprPlayerIdleN
        }
        draw_set_halign(0)
        draw_text(x+i*240+10,y+70,"Resets:#  "+string(savedata("deaths"))+"#Time:#  "+format_time(savedata("time")))

        draw_set_halign(1)
        if (state="continue" && select=i) {
            if (!asksel) draw_text(x+i*240+64,y+32,">Continue<#Erase Game")
            else draw_text(x+i*240+64,y+32,"Continue#>"+string_repeat("XX",askcount)+string_copy("Erase Game",1+askcount*2,10-askcount*2)+"<")
        } else draw_text(x+i*240+64,y+48,global.name_difficulties[difficulty])

        draw_set_font(fntFileBig)
        if (savedata("clear")) draw_text(x+i*240+64,y+152,"Clear!")
        draw_set_halign(0)

        if (has_item("Item1")) draw_sprite(sprItem1,0,x+i*240+0,y+192)
        if (has_item("Item2")) draw_sprite(sprItem2,0,x+i*240+32,y+192)
        if (has_item("Item3")) draw_sprite(sprItem3,0,x+i*240+64,y+192)
        if (has_item("Item4")) draw_sprite(sprItem4,0,x+i*240+96,y+192)
        if (has_item("Item5")) draw_sprite(sprItem5,0,x+i*240+0,y+224)
        if (has_item("Item6")) draw_sprite(sprItem6,0,x+i*240+32,y+224)
        if (has_item("Item7")) draw_sprite(sprItem7,0,x+i*240+64,y+224)
        if (has_item("Item8")) draw_sprite(sprItem8,0,x+i*240+96,y+224)
    } else {
        if (select==i) sprite_index=sprPlayerIdle
        draw_set_halign(1)
        if (state="new file" && select=i) draw_text(x+i*240+64,y+32,"Difficulty:#<"+global.name_difficulties[difficulty]+">")
        else draw_text(x+i*240+64,y+48,"No Data")
    }
}
draw_set_halign(0)
draw_set_color(0)

texture_set_interpolation(0)
draw_sprite_ext(sprFileBorder,0,x+select*240,y,32,32,0,$ffffff,1)
texture_reset_interpolation()
draw_sprite(sprite_index,-1,dx,y+308)
if (bow) draw_sprite(sprBow,0,dx,y+308+(floor(image_index)==3))
draw_sprite(sprDynamicPlatform,0,dx-17,y+317)

if (has_item("GlobalItem1")) draw_sprite(sprGlobalItem1,0,400-64,608-124) else draw_sprite(sprUnknown,0,400-64,608-124)
if (has_item("GlobalItem2")) draw_sprite(sprGlobalItem2,0,400-32,608-124) else draw_sprite(sprUnknown,0,400-32,608-124)
if (has_item("GlobalItem3")) draw_sprite(sprGlobalItem3,0,400,608-124) else draw_sprite(sprUnknown,0,400,608-124)
if (has_item("GlobalItem4")) draw_sprite(sprGlobalItem4,0,400+32,608-124) else draw_sprite(sprUnknown,0,400+32,608-124)
if (settings("herman")) draw_sprite(sprGlobalItemHerman,0,400-64,608-92) else draw_sprite(sprUnknown,0,400-64,608-92)
if (settings("joker")) draw_sprite(sprGlobalItemJoker,0,400-32,608-92) else draw_sprite(sprUnknown,0,400-32,608-92)
if (settings("home")) draw_sprite(sprGlobalItemHouse,0,400,608-92) else draw_sprite(sprUnknown,0,400,608-92)
if (settings("clown")) draw_sprite(sprGlobalItemClown,0,400+32,608-92) else draw_sprite(sprUnknown,0,400+32,608-92)

//option info
draw_set_font(fntFileSmall)
draw_set_halign(0) draw_text( 34,553,"["+key_get_name(global.keycode[key_shoot])+"] Back"   )
draw_set_halign(1) draw_text(400,553,"["+key_get_name(global.keycode[key_menu ])+"] Options")
draw_set_halign(2) draw_text(766,553,"["+key_get_name(global.keycode[key_jump ])+"] Accept" )
draw_set_halign(0)
draw_set_color($ffffff)
