var yes;

if (!hang) {
    if (place_meeting(x,y+vflip,Block) || onPlatform || place_meeting(x,y+vflip,Water1) || place_meeting(x,y+vflip,PlatformWater) || place_meeting(x,y+vflip,GuyWater) || ladderjump) {
        //floor jump
        vspeed=-jump*vflip
        if (global.use_momentum_values) {
            with (instance_place(x,y+vflip,Platform)) other.hspeed+=hspeed
        }
        if (room=rmIntro) sound_play_slomo("sndJump")
        else sound_play_slomo("pop")
        djump=1
        image_index=0
        with (SingleJumpSwitchBlock) event_user(0)
        with (SingleJumpSwitchBlockOff) event_user(0)
        with (DoubleJumpSwitchBlock) event_user(0)
        with (DoubleJumpSwitchBlockOff) event_user(0)

        //ren
        yes=0
        with (RenFrog) {event_user(0) if (vspeed<0) yes=1}
        if (yes) play_sound("sndRenFrog")
        with (RenSkull) event_user(0)

        coyoteTime=0
        jump_timer=0
        if (place_meeting(x,y+1,GuyWater)) onfire=false
    } else if (debug_code("infjump") || (djump<maxjumps || place_meeting(x,y+1*vflip,Water2)) && !(beamstate&beam_onejump)) {
        //double jump
        vspeed=-jump2*vflip

        if (room=rmIntro) sound_play_slomo("sndDJump")
        else {
            s=sound_play_paused("pop")
            sound_pitch(s,1.8)
            sound_resume(s)
        }
        if (djump<maxjumps) djump+=1
        if (djump>2) {
            repeat (5) instance_create(random_range(x-5,x+5),random_range(y+4,y+4),TripleJumpStar)
        }
        image_index=0
        with (DoubleJumpSwitchBlock) event_user(0)
        with (DoubleJumpSwitchBlockOff) event_user(0)


        //ren
        yes=0
        with (RenFrog2) {event_user(0) if (vspeed<0) yes=1}
        if (yes) play_sound("sndRenFrog")
        with (RenSkull) event_user(0)

        coyoteTime=0
        jump_timer=0
    } else jump_timer=global.jump_buffering
    ladderjump=false
}
