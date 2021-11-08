maxs=sprite_create_from_screen(0,0,1,1,0,0,0,0)
maxo=object_add()

for (i=0;i<maxo;i+=1) if (object_exists(i)) {
    spr=object_get_sprite(i)
    mask=object_get_mask(i)

    if (spr>=0) used[spr]=1
    if (mask>=0) used[mask]=1
}

out=""

for (u=0;u<maxs;u+=1) if (sprite_exists(u)) {
    if (!used[u]) out+=sprite_get_name(u)+chr(13)
}

clipboard_set_text(out)
