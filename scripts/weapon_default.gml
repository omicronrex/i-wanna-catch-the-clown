if (instance_number(Bullet)<4 && !instance_exists(GMShip)) {
    i=instance_create(x,y-2*vflip,Bullet)
    i.owner=id

    i.hspeed=facing*16*dt*slomo
    i.direction+=sprite_angle

    if (room=rmIntro) sound_play("sndShoot")
    else sound_play("sndRenShot")
}
