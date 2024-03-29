#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
go2=0
roomTo=room_next(room)

fademode=0
roomname=room_names(roomTo)
if (roomname!="") fademode=!savedata("seen"+roomname)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go2) {
    k=0
    s=-1
    final=-1
    texture_set_interpolation(0)

    visible=0
    with (Player) {
        oldfr=0
        visible=0
        image_xscale=other.storescale
        facing=image_xscale
    }

    envelope_prepare()
    screen_redraw()
    dx8_make_opaque()

    with (Player) {
        visible=1
    }

    repeat (99) {
        sleep(20)

        k+=0.01
        f=k*k

        s=dx8_surface_engage(s,800,608)
            dx8_set_alphablend(0)
            draw_surface_ext(application_surface,0,0,f,f,0,$ffffff,1)
        surface_reset_target()

        final=dx8_surface_engage(final,800,608)
            draw_clear(0)
            d3d_set_projection_ortho(0,0,800,608,0)
            texture_set_interpolation(0)
            draw_surface_ext(s,0,0,1/f,1/f,0,merge_color(0,$ffffff,sqrt(k)),1)
            dx8_reset_projection()
            dx8_set_alphablend(1)
            with (Player) event_perform(ev_draw,0)
        surface_reset_target()

        if ((global.rw!=global.width || global.rh!=global.height) && settings("filter")==2) {
            //area filter
            dequanto_surface=dx8_surface_engage(dequanto_surface,global.width*2,global.width*2)
            texture_set_interpolation(1)
            draw_surface_stretched(final,0,0,global.width*2,global.width*2)
            surface_reset_target()
            d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
            draw_surface_stretched(dequanto_surface,0,0,global.rw,global.rh)
        } else {
            surface_reset_target()
            d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
            texture_set_interpolation(settings("filter"))
            draw_surface_stretched(final,0,0,global.rw,global.rh)
        }
        texture_set_interpolation(0)
        screen_refresh()
        io_handle()
    }
    surface_free(s)
    surface_free(final)
    instance_destroy()
    World.pause_delay=5
}

if (go && instance_exists(Player)) {
    vol=settings("musvol")
    delta=vol/100
    k=1
    s=-1
    final=-1
    texture_set_interpolation(0)
    repeat (99) {
        sleep(20)

        vol-=delta
        sound_kind_volume(1,vol)

        k-=0.01
        f=k*k

        s=dx8_surface_engage(s,800,608)
            dx8_set_alphablend(0)
            draw_surface_ext(application_surface,0,0,f,f,0,$ffffff,1)
        surface_reset_target()

        final=dx8_surface_engage(final,800,608)
            draw_clear(0)
            d3d_set_projection_ortho(0,0,800,608,0)
            texture_set_interpolation(0)
            draw_surface_ext(s,0,0,1/f,1/f,0,merge_color(0,$ffffff,sqrt(k)),1)
            dx8_reset_projection()
            dx8_set_alphablend(1)

            Player.bowx=Player.drawx
            Player.bowy=Player.drawy
            Player.drawx=(Player.drawx*19+x+1)/20
            Player.drawy=(Player.drawy*19+y+8)/20

            if (fademode) Player.image_blend=merge_color(0,$ffffff,sqrt(k))
            with (Player) event_perform(ev_draw,0)
        surface_reset_target()

        if ((global.rw!=global.width || global.rh!=global.height) && settings("filter")==2) {
            //area filter
            dequanto_surface=dx8_surface_engage(dequanto_surface,global.width*2,global.width*2)
            texture_set_interpolation(1)
            draw_surface_stretched(final,0,0,global.width*2,global.width*2)
            surface_reset_target()
            d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
            draw_surface_stretched(dequanto_surface,0,0,global.rw,global.rh)
        } else {
            surface_reset_target()
            d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
            texture_set_interpolation(settings("filter"))
            draw_surface_stretched(final,0,0,global.rw,global.rh)
        }
        texture_set_interpolation(0)
        screen_refresh()
        io_handle()
    }
    surface_free(s)
    surface_free(final)

    with (Player) instance_destroy()
    input_clear()

    go=0
    if (fademode) {} else {
        persistent=1
        go2=1
    }

    global.perform_autosave=true
    room_goto(roomTo)
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!go) {
    collect_items()
    play_sound("sndRenApplause")

    with (other) {
        visible=0
        other.storescale=image_xscale
    }

    go=1
}
