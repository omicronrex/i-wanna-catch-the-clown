time=0
if (timer=1) {
    sprite_index=sprClownPiece
    with (ClownpieceStar4) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    instance_destroy_id(ClownMoon2)
    sound_play("sndBossDeath")
    hspeed=1*esign(400-x,1)
    vspeed=-0.5
    friction=0
}
if (timer=50) {
    settings("clown",1)
    sound_play("sndBossDeath")
    instance_create(x,y,Lolisplosion)
    instance_destroy_id(Sigil)
    camera_shake(40,30)
    repeat (50) {
        instance_create(x,y,ClownPopParticlesOut)
    }
    instance_destroy()
    ClownpieceDialogCtrl.alarm[0]=100
}
