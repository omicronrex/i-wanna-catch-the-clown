///camera_shake(intensity,[duration])

with (World) {
    if (camera_shaketime) camera_shakelength=max(camera_shakelength,argument[0])
    else camera_shakelength=argument[0]
    if (argument_count>1) camera_shaketime=argument[1]
    else camera_shaketime=camera_shakelength
    camera_shakelen=camera_shaketime
}
