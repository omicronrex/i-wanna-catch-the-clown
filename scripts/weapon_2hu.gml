shootj+=1
if (shootj=4 || shootj=8 || shootj=12) {
    play_sound("sndTouhouShot")
    instance_create(TouhouGun.x-10,TouhouGun.y-20,TouhouBullet)
    instance_create(TouhouGun.x+10,TouhouGun.y-20,TouhouBullet)

    instance_create(TouhouGun.x-30,TouhouGun.y-15,TouhouBullet)
    instance_create(TouhouGun.x+30,TouhouGun.y-15,TouhouBullet)
}

if (shootj=12) {
    shootj=0
    instance_create(TouhouGun.x-30,TouhouGun.y-20,TouhouBullet2)
    instance_create(TouhouGun.x+30,TouhouGun.y-20,TouhouBullet2)
}
