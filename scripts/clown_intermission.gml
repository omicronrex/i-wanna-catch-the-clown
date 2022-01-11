time=0
mode="wait"

if (timer=1) {
    //erase bullets
    with (ClownpieceGrazeBullet) {effect_create_above(ef_spark,x,y,1,$ff00ff) instance_destroy()}
    with (ClownLaserDown) {repeat (250) {if (x>0 && x<800) effect_create_above(ef_spark,x,y,0,$ff00ff) x+=8} instance_destroy()}
    with (ClownLaserLeft) {repeat (250) {if (x>0 && x<800) effect_create_above(ef_spark,x,y,0,$ff00ff) x-=8} instance_destroy()}
}

if (timer=100) {
    hp=100
    timer=0
    phase+=1
}
