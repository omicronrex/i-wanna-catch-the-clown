///move_player(x,y,check place free)
//move the player to a different location
//this is necessary due to sprite smoothing
var dx,dy,a;

with (Player) {
    dx=argument0-x dy=argument1-y

    if (argument2) {
        x+=dx
        y+=dy
        instance_activate_around_player()
        a=place_free(x,y)
        x-=dx
        y-=dy
    }
    else a=1
    if (a) {
        oldx+=dx oldy+=dy
        newx+=dx newy+=dy
        oldbowx+=dx oldbowy+=dy
        newbowx+=dx newbowy+=dy
        x+=dx y+=dy
        drawx+=dx drawy+=dy
        return 1
    }
}

return 0
