///draw_sign_text(x,y,font,color,message,drawbox)
//convenience function for drawing text boxes
var dx,dy,font,color,message,box,left,top,right,bot,flip;

dx=argument0
dy=argument1
font=argument2
color=argument3
message=argument4
box=argument5

draw_set_font(fntMsSans)
w=max(128,string_width(message)+20)
h=string_height(message)+20

left=dx-w-8
top=dy-h-32
right=dx+8
bot=dy-16


if (instance_exists(Player)) {
    global.sign_direction=0
    if (dx>Player.x) global.sign_direction=1
    if (dx-w-8<view_xview+16) global.sign_direction=1
    if (dx+w+8>view_xview+800-16) global.sign_direction=0
}

if (global.sign_direction) {
    //right side bubble
    left=dx-8
    right=dx+w+8
    draw_set_color($deffff)
    draw_roundrect(left,top,right,bot,0)
    draw_set_color(0)
    draw_roundrect(left,top,right,bot,1)
    draw_triangle(left+36,bot,left+16,bot,left+16,bot+20,0)
    draw_set_color($deffff)
    draw_triangle(left+34,bot,left+17,bot,left+17,bot+17,0)
    draw_set_color(0)
} else {
    draw_set_color($deffff)
    draw_roundrect(left,top,right,bot,0)
    draw_set_color(0)
    draw_roundrect(left,top,right,bot,1)
    draw_triangle(right-36,bot,right-16,bot,right-16,bot+20,0)
    draw_set_color($deffff)
    draw_triangle(right-34,bot,right-17,bot,right-17,bot+17,0)
    draw_set_color(0)
}

draw_sprite(sprNotif,0,left+21,top+16)
draw_set_font(fntMsSansB)
draw_text(left+42,top+7,"Information")
draw_set_font(fntMsSans)
draw_text(left+19,top+28,message)
draw_set_color($ffffff)
