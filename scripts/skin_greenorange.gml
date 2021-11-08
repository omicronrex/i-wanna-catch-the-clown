if (argument0=="mask") {
    skin_default("mask")
}

if (argument0=="step") {
    skin_default("step")
    if (difficulty==2) switch (sprite_index) {
        case sprPlayerIdle: {sprite_index=sprPlayerIdleGOH break}
        case sprPlayerFall: {sprite_index=sprPlayerFallGOH break}
        case sprPlayerJump: {sprite_index=sprPlayerJumpGOH break}
        case sprPlayerRunning: {sprite_index=sprPlayerRunningGOH break}
    } else switch (sprite_index) {
        case sprPlayerIdle: {sprite_index=sprPlayerIdleGO break}
        case sprPlayerFall: {sprite_index=sprPlayerFallGO break}
        case sprPlayerJump: {sprite_index=sprPlayerJumpGO break}
        case sprPlayerRunning: {sprite_index=sprPlayerRunningGO break}
    }
}

if (argument0=="draw") {
    skin_default("draw")

    if (bow) {
        draw_sprite_ext(sprBow,3,floor(bowx),floor(bowy+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)
    }
}
