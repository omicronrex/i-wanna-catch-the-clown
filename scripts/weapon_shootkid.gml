if (!global.contact_saves) {
    with (SavePoint) {
        if (place_meeting(x,y,other.id)) {
            exit
        }
    }
}

if (!instance_exists(ShootKid)) {
    if(global.accurate_shootkid && !place_free(x+12*image_xscale,y)) exit
    sound_play_slomo("sndShootkid")
    i=instance_create(x,y,ShootKid)
    i.direction+=sprite_angle
}
