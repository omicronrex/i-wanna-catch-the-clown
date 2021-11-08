if (argument0=="mask") {
    skin_default("mask")
}

if (argument0=="step") {
    skin_default("step")
    switch (sprite_index) {
        case sprPlayerIdle: {sprite_index=sprPlayerIdleH break}
        case sprPlayerFall: {sprite_index=sprPlayerFallH break}
        case sprPlayerJump: {sprite_index=sprPlayerJumpH break}
        case sprPlayerRunning: {sprite_index=sprPlayerRunningH break}
        case sprPlayerSliding: {sprite_index=sprPlayerSlidingH break}
    }
}

if (argument0=="draw") {
    skin_default("draw")
}
