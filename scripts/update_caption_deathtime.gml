var itemstring,i,c;

if (room=rmHub || room=rmHistory || room=rmClear || room=rmSecretEnd) {
    room_caption=global.game_title
} else if (room=rAfterlife) {
    if (instance_exists(ClownPortal)) room_caption="Score: "+ClownPortal.points
    else room_caption="Catch the Clown Score: "+string(RenClownHeart.clicks)
} else if (global.show_deathtime) {
    itemstring=""
    if (settings("fullscreen")) {
        c=0 for (i=0;i<8;i+=1) c+=has_item("Item"+string(i+1))
        itemstring=string(c)+"/8"
    } else {
        if (has_item("Item1")) itemstring+="⚽" else itemstring+="✗"
        if (has_item("Item2")) itemstring+="🧸"else itemstring+="✗"
        if (has_item("Item3")) itemstring+="🎁"else itemstring+="✗"
        if (has_item("Item4")) itemstring+="🍑"else itemstring+="✗"
        if (has_item("Item5")) itemstring+="💍"else itemstring+="✗"
        if (has_item("Item6")) itemstring+="☃" else itemstring+="✗"
        if (has_item("Item7")) itemstring+="☀" else itemstring+="✗"
        if (has_item("Item8")) itemstring+="🍔"else itemstring+="✗"
    }

    room_caption=strong(
        global.game_title,
        " - "+global.name_difficulties[difficulty],
        " - Resets: ",savedata("deaths"),
        " - Time: ",format_time(savedata("time")),
        pick(global.lastjoyname!="",""," "+global.lastjoyname),
        " - Items: ["+itemstring+"]",
        pick(savedata("clear"),""," - Clear!")
    )
}
