///all debug code

//you can delete this code to get rid of all testing aids and debug keys, making it harder to cheat.

if (global.debug_param=="game start") {
    global.test_run=!!string_pos("gm_ttt",parameter_string(0))
    global.debug_overlay=false
    global.debug_god=false
    global.debug_jump=false
    global.debug_hitbox=false
    global.debug_autofire=false
    exit
}

if (!global.test_run) {
    global.debug_return=false
    exit
}

if (global.debug_param=="godmode") {
    global.debug_return=global.debug_god
    exit
}
if (global.debug_param=="autofire") {
    global.debug_return=global.debug_autofire
    exit
}
if (global.debug_param=="infjump") {
    global.debug_return=global.debug_jump
    exit
}

if (global.debug_param=="water surface") {
    if (global.debug_hitbox && sleeping) draw_set_color($ffff00)
    exit
}

if (global.debug_param=="world step") {
    if (keyboard_check_pressed(vk_backspace)) {
        global.debug_overlay=!global.debug_overlay
    }
    if (is_ingame()) {
        if (keyboard_check(vk_tab)) {
            move_player(mouse_x,mouse_y,0)
            Player.speed=0
        }
        if (keyboard_check_pressed(vk_insert)) {
            savedata_save(true,"debug save")
        }
        if (keyboard_check_pressed(vk_delete)) {
            global.debug_hitbox=!global.debug_hitbox
        }
        if (keyboard_check_pressed(vk_home)) {
            global.debug_god=!global.debug_god
        }
        if (keyboard_check_pressed(vk_end)) {
            global.debug_jump=!global.debug_jump
        }
        if (keyboard_check_pressed(vk_pageup) && room!=room_last) {
            instance_activate_all()
            instance_destroy_id(Player)
            room_goto_next()
        }
        if (keyboard_check_pressed(vk_pagedown) && room!=global.first_room) {
            instance_activate_all()
            instance_destroy_id(Player)
            room_goto_previous()
        }
        if (instance_exists(Player) && mouse_check_button_pressed(mb_right)) {
            func=show_menu("Debug Menu|-|Go to...|Infinite Jump|Godmode|Hitboxes|Autofire|Save Here",0)
            if (func=1) {
                s="Select room:|-"
                r=global.first_room
                do {
                    s+="|"+room_get_name(r)
                    r=room_next(r)
                } until (r=-1)
                goto=show_menu(s,0)
                if (goto) {
                    r=global.first_room
                    repeat (goto-1) r=room_next(r)
                    instance_activate_all()
                    instance_destroy_id(Player)
                    room_goto(r)
                }
            }
            if (func=2) {global.debug_jump=!global.debug_jump}
            if (func=3) {global.debug_god=!global.debug_god}
            if (func=4) {
                global.debug_hitbox=!global.debug_hitbox
                if (!global.debug_hitbox) {
                    with (all) visible=object_get_visible(object_index)
                }
            }
            if (func=5) {global.debug_autofire=!global.debug_autofire}
            if (func=6) {savedata_save(true,"debug")}
        }
        if (global.debug_hitbox) all.visible=1
    }
    exit
}

if (global.debug_param=="ortho draw") {
    if (keyboard_check(vk_f8)) d3d_set_projection_ortho(0,0,room_width,room_height,0)
    exit
}

if (global.debug_param=="world draw") {
    if (global.debug_overlay) {
        draw_set_color(c_black)
        draw_set_halign(fa_left)
        draw_set_font(fntFileSmall)

        var drawX,drawY,drawAlign;
        drawX = 0;
        drawY = 0;
        drawAlign = 0;
        if (instance_exists(Player))
        {
            drawX = Player.x;
            drawY = Player.y;
            drawAlign = Player.x mod 3;
        }

        str="X: "+string(drawX)+" (align "+string(drawAlign)+")#"
           +"Y: "+string(drawY)+"#"
           +"Room: "+room_get_name(room)+" ("+string(room)+")#"
           +"FPS: "+string(fps)+" ("+string(fps_real)+") / "+string(room_speed)+"#"
           +string_repeat("God mode",global.debug_god)+"#"
           +string_repeat("Infinite jump",global.debug_jump)
        draw_text_outline(40,40,str,$ffff)
    }
    exit
}

if (global.debug_param=="player draw") {
    if (global.debug_god) draw_sprite_ext(sprBow,1,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)
    if (global.debug_jump) draw_sprite_ext(sprBow,2,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)
    if (global.debug_hitbox) {
        draw_sprite_ext(mask_index,0,round(x),round(y),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
    }
    exit
}
