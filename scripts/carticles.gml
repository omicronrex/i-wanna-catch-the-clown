//destroy race car
var o,i,rep;

sound_play("sndRenBossWall")
o=instance_create(x,y,RenGMExplosion)
o.image_xscale=3
o.image_yscale=3
camera_shake(8)

rep=8

if (object_index=CarGoDown || object_index=CarGoUp) i=image_index mod 4
if (object_index=Racecar) i=2
if (object_index=Police || object_index=StoppedPolice || object_index=Roadblock) i=4

if (object_index=BigPolice) {
    i=4
    rep=100
    vspeed=-6
}

repeat (irandom(rep)) {
    o=instance_create(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),CarDebris)
    o.image_index=i
    o.vspeed+=vspeed
}
