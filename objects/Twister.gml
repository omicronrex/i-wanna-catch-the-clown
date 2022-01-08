#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
height=256+224
smooth=-8
bepp=0

mode=0

for (i=0;i<height/32;i+=1) rotlist[i]=random_range(10,80)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1/90


if (mode=1) {
    for (i=0;i<height/32;i+=1) {
        if (rotlist[i]!=0) {
            rotlist[i]-=esign(angle_difference(rotlist[i],45),1)
            effect_create_above(ef_smoke,x+random(160),y+i*32+32,0,$808080)
            if (rotlist[i]>90 || rotlist[i]<0) {
                rotlist[i]=0
                camera_shake(4,30)
                sound_play("earthquaketest (2)")
                if (i<14) sound_play("block") else {sound_play("Explosion") camera_shake(16,150) TheGunEater.image_index=3}
                effect_create_above(ef_spark,x+80,y+i*32+16,2,$ff00)
            }
            break
        }
    }
    if (i==height/32) mode=2
}

if (mode=2) {
    smooth=min(height,smooth+2)
    effect_create_above(ef_smoke,x+random(160),y+smooth,0,$ff00)
    if (smooth=height) {
        mode=3
        TheGunEater.timer=2000
        TheGunEater.image_index=4
    }
}
if (mode=4) {
    if (height>256) {
        effect_create_above(ef_firework,x+80-200+random(400),random_range(y+height+32,512),0,$808080)
        effect_create_above(ef_smoke,x+80-200+random(400),random_range(y+height+32,512),1,$808080)
        camera_shake(4,30)
        height-=1
        if (!(height mod 8)) sound_play("earthquaketest (2)")
        IntroArtifact.y-=1
        TheGunEater.y-=1
        tile_layer_shift(1001,0,-1)
        tile_layer_shift(-10,0,-1)
        if (height=256) {
            sound_play("Explosion")
            camera_shake(16,150)
            unlock_controls()
            IntroCtrl.active=1
            TheGunEater.image_index=1
            mode=5
            smooth=height
        }
    }
}
if (mode=5) {
    smooth-=2
    if (smooth<-8) mode=6
}
if (mode=6) {
    bepp=min(1,bepp+0.003)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (j=max(0,view_yview);j<y+height;j+=1) {
    i=j-y
    k=i mod 32
    img=0
    displace=0

    if (mode=0 || mode=1) {
        rot=rotlist[i div 32]
        if (rot==0) img=1
    } else if (mode=2) {
        if (i<smooth) rot=((smooth-i)/2 mod 90)
        else {rot=0 img=1}
    } else if (mode=3) {
        rot=((smooth-i)/2 mod 90)
    } else if (mode=4) {
        rot=((smooth-i+720-(smooth-height))/2 mod 90)
    } else if (mode=5) {
        if (i<smooth) rot=((smooth-i)/2 mod 90)
        else rot=0
    } else {
        f=bepp*sqr((height-i)/height)
        rot=(((0.5+0.5*sin(7+timer+i/511)*sin(11+timer*1.682+i/111)*sin(13+timer*1.442+i/345)*f)*360) mod 90)
        displace=80*sin(5+timer*1.851+i/452)*sin(19+timer*1.13+i/579)*f
    }

    draw_sprite_part_ext(sprite_index,img,0,k,160,1,x+80+displace+lengthdir_x(-80,rot)+lengthdir_x(-80,rot-90),y+i,dcos(rot),1,merge_color($606060,$ffffff,dcos(rot)),1)
    draw_sprite_part_ext(sprite_index,img,0,k,160,1,x+80+displace+lengthdir_x(-80,rot)+lengthdir_x(-80,rot-90)+160*dcos(rot),y+i,dsin(rot),1,merge_color($606060,$ffffff,dsin(rot)),1)
}
if (smooth<height) draw_sprite_ext(sprGreenGlow,0,x,y+smooth,5,1,0,$ffffff,1)
