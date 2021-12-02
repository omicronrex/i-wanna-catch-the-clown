shootj+=1
if (shootj=4) {
    shootj=0
    play_sound("sndTouhouShot")
    instance_create(TouhouGun.x-13,TouhouGun.y-20,TouhouBullet)
    instance_create(TouhouGun.x+13,TouhouGun.y-20,TouhouBullet)
}
