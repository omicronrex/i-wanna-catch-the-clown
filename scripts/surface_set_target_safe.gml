var mem,err;

mem=error_occurred
err=error_last

if (surface_exists(argument[0])) {
    error_occurred=0
    surface_set_target(argument[0])
    error_last=err
    if (error_occurred) {
        error_occurred=mem
        surface_reset_target()
        return 0
    }
    error_occurred=mem
    return 1
}
return 0
