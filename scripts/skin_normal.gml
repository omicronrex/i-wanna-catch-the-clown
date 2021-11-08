if (argument0=="mask") {
    skin_default("mask")
}

if (argument0=="step") {
    skin_default("step")
    switch (sprite_index) {
        case sprPlayerIdle: {sprite_index=sprPlayerIdleN break}
        case sprPlayerFall: {sprite_index=sprPlayerFallN break}
        case sprPlayerJump: {sprite_index=sprPlayerJumpN break}
        case sprPlayerRunning: {sprite_index=sprPlayerRunningN break}
        case sprPlayerSliding: {sprite_index=sprPlayerSlidingN break}
    }
}

if (argument0=="draw") {
    skin_default("draw")
}
