///sureface(id):valid
///sureface(id,w,h):id
//makes SURE that your SURFACE is ready :)
var s;

if (surface_exists(argument[0])) {
    if (argument_count=1) return true

    if (surface_get_width(argument[0])=argument[1] && surface_get_height(argument[0])=argument[2]) {
        return argument[0]
    }
}

if (argument_count=1) return false

s=surface_create(argument[1],argument[2])
if (surface_exists(s)) {
    return s
}

show_message("The game failed to allocate a drawing surface of dimensions "+string(argument[1])+"x"+string(argument[2])+
             ".##Make sure you have enough vram available.##The game will now close.")
with (all) instance_destroy()
game_end()
return -1
