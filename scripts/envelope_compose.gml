//during end step, compose the window and update the internal buffer.

if (((global.rw!=global.width || global.rh!=global.height)) || global.use_application_surface) {
    dx8_make_opaque()
    d3d_set_depth(0)
    application_surface=dx8_surface_engage(application_surface,global.width,global.height)
    surface_reset_target()

    if ((global.rw!=global.width || global.rh!=global.height) && settings("filter")==2) {
        //area filter
        dequanto_surface=dx8_surface_engage(dequanto_surface,global.width*2,global.width*2)
        texture_set_interpolation(1)
        draw_surface_stretched(application_surface,0,0,global.width*2,global.width*2)
        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        draw_surface_stretched(dequanto_surface,0,0,global.rw,global.rh)
    } else {
        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        texture_set_interpolation(settings("filter"))
        draw_surface_stretched(application_surface,0,0,global.rw,global.rh)
    }

    /*
        this place is where you can add any post-processing effects using the application surface.
        remember to set the engine option to always use an application surface, when using this.
    */

    with (Ripple) event_user(0)
    with (Ripple2) event_user(0)

    //gui
    d3d_set_projection_ortho(0,0,global.width,global.height,0)

    with (SongNamer) event_user(1)

    //minimize button
    if (minalpha>0) {
        if (minclick=3) draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
        else draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,pick(minhover=3,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
        draw_sprite_ext(sprCapButtons,1,global.width-90,0,1,1,0,mincolor2,minalpha)
        if (minclick=2) draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
        else draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,pick(minhover=2,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
        draw_sprite_ext(sprCapButtons,3+settings("fullscreen"),global.width-45,0,1,1,0,mincolor2,minalpha)
        if (minclick=1) draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,merge_color(mincolor1,$2311e8,0.5),minalpha)
        else draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,pick(minhover=1,mincolor1,$2311e8),minalpha)
        draw_sprite_ext(sprCapButtons,2,global.width,0,1,1,0,mincolor2,minalpha)
    }

    if (curalpha>0) draw_sprite_ext(sprAeroArrow,0,mousex,mousey,1,1,0,$ffffff,curalpha)

    if (!global.pause) {
        if ((keyboard_check(vk_tab) || debug_mode || fps_real<global.game_speed*0.95) && is_ingame()) {
            str=string(round(fps))
            fpsa=min(1.5,fpsa+0.05)
        } else {
            str=string(global.game_speed)
            fpsa=max(0,fpsa-0.05)
        }
        if (fpsa>0.5) {
            for (i=0;i<string_length(str);i+=1)
                draw_sprite_ext(sprFraps,string_pos(string_char_at(str,i+1),"0123456789")-1,32+4+20*i,32+4,1,1,0,$ffffff,fpsa-0.5)
        }
    }


    //draw debug overlay
    debug_code("world draw")

    if (message) {
        draw_set_font(fntFileSmall)
        draw_set_alpha(min(1,message/100))
        if (room=rHerman) col=$80ff
        else col=$ffff
        draw_text_outline(40,40,messagetext,col)
        draw_set_alpha(1)
    }
    if (message2) {
        draw_set_font(fntFileSmall)
        draw_set_halign(2)
        draw_set_alpha(min(1,message2/100))
        if (room=rHerman) col=$80ff
        else col=$ffff
        draw_text_outline(global.width-40,40,message2text,col)
        draw_set_halign(0)
        draw_set_alpha(1)
    }

    with (FadeIn) event_user(0)

    if (is_ingame() && settings("fullscreen") && room!=rmIntro && room!=rmHub && room!=rmHistory && room!=rmClear && room!=rmSecretEnd) {
        draw_set_font(fntFileSmall)
        if (room=rHerman) col=$80ff
        else col=$ffff
        draw_text_outline(6,2,room_caption,col)
    }

    if (room=rmTitle && settings("fullscreen") && score>0) {
        draw_set_font(fntFileSmall)
        draw_text_outline(6,2,"Score: "+string(score),$ffff)
    }

    with (AreaNamer) event_user(0)
    dx8_reset_projection()

    texture_reset_interpolation()
}
