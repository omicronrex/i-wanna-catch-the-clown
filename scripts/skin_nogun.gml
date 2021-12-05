if (argument0=="mask") {
    skin_default("mask")
}

if (argument0=="step") {
    skin_default("step")
    switch (sprite_index) {
        case sprPlayerIdle: {sprite_index=sprPlayerIdleNo break}
        case sprPlayerFall: {sprite_index=sprPlayerFallNo break}
        case sprPlayerJump: {sprite_index=sprPlayerJumpNo break}
        case sprPlayerRunning: {sprite_index=sprPlayerRunningNo break}
    }
}

if (argument0=="draw") {
    skin_default("draw")
}
