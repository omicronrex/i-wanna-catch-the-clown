#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var rm;

rm=room_base(room)

bg=tileRen

if (rm=rDiamond4) bg=tileRen2
if (rm=rDiamond3) bg=tileRen3
if (rm=rButterfly1) bg=tileRen4
if (rm=rDiamond6) bg=tileRen5
if (rm=rWater1) bg=tileRen2
if (rm==rTutorial || rm=rmHub || rm=rmHistory) bg=texBlock

tex=background_get_texture(bg)

if (room!=global.lastroom) {
    d3d_model_clear(global.tilemodel)
    d3d_model_primitive_begin(global.tilemodel,pr_trianglelist)

    u=texture_get_width(tex)/background_get_width(bg)
    v=texture_get_height(tex)/background_get_height(bg)

    with (Block) if (object_index!=Block && object_index!=HermanBlock) y=-999

    if (rm==rDiamond1 || rm==rDiamond2 || rm==rDiamond3 || rm=rDiamond4 || rm=rButterfly1 || rm=rDiamond6 || rm=rWater1) {
        with (RenSpikeDown) top=place_meeting(x,y+16,Block)
        with (Block) {
            top=place_meeting(x,y-1,Block)
            if (top) {
                if (place_meeting(x-1,y,Block) || place_meeting(x+1,y,Block)) top=0
            }
            tile_bake(32+x mod 160,y mod 160,32,32,x,y,1000)
            if (!position_meeting(x-8,y+8,Block)) {
                if (!position_meeting(x+8,y-8,Block)) tile_bake(0,32,16,16,x,y,999)
                else tile_bake(0,40,16,16,x,y,999)
            } else {
                if (!position_meeting(x+8,y-8,Block)) tile_bake(8,32,16,16,x,y,999)
                else if (!position_meeting(x-8,y-8,Block)) tile_bake(0,64,16,16,x,y,999)
            }
            if (!position_meeting(x-8,y+24,Block)) {
                if (!position_meeting(x+8,y+40,Block)) tile_bake(0,48,16,16,x,y+16,999)
                else tile_bake(0,40,16,16,x,y+16,999)
            } else {
                if (!position_meeting(x+8,y+40,Block)) tile_bake(8,48,16,16,x,y+16,999)
                else if (!position_meeting(x-8,y+40,Block)) tile_bake(0,80,16,16,x,y+16,999)
            }
            if (!position_meeting(x+40,y+8,Block)) {
                if (!position_meeting(x+24,y-8,Block)) tile_bake(16,32,16,16,x+16,y,999)
                else tile_bake(16,40,16,16,x+16,y,999)
            } else {
                if (!position_meeting(x+24,y-8,Block)) tile_bake(8,32,16,16,x+16,y,999)
                else if (!position_meeting(x+40,y-8,Block)) tile_bake(16,64,16,16,x+16,y,999)
            }
            if (!position_meeting(x+40,y+24,Block)) {
                if (!position_meeting(x+24,y+40,Block)) tile_bake(16,48,16,16,x+16,y+16,999)
                else tile_bake(16,40,16,16,x+16,y+16,999)
            } else {
                if (!position_meeting(x+24,y+40,Block)) tile_bake(8,48,16,16,x+16,y+16,999)
                else if (!position_meeting(x+40,y+40,Block)) tile_bake(16,80,16,16,x+16,y+16,999)
            }
        }
    }

    if (rm==rClown1 || rm==rClown2 || rm==rClown3 || rm==rDiamond5 || rm=rBoss1 || rm=rClown4) with (Block) {
        tile_bake(0,0,32,32,x,y,1000)
    }

    if (rm==rTutorial || rm=rmHub || rm=rmHistory) with (Block) {
        tile_bake(0,0,32,32,x,y,1000)
    }

    with (Block) y=ystart

    d3d_model_primitive_end(global.tilemodel)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.lastroom=room
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_model_draw(global.tilemodel,-0.5,-0.5,0,tex)
