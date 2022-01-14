#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*GAMECAVE EFFECTS ENGINE 3.X
Read the GCE3X documentation before using this code!

Object Name - objThunder_sheet
Engine - Rain Engine
Purpose - The sheet lightning created by objRain1 (randomly).
*/

image_alpha = 0; //Invisible at the moment.
fadein = true //Whether to fade in or out.
alarm[0] = 120 //Set the alarm for being destroyed.
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy(); //Get destroyed.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha > 1{fadein = false} //If fully faded in, start fading out
if fadein = true{image_alpha += 0.2} //Fade in
if fadein = false{image_alpha -= 0.2} //Fade out
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,-32,-32,room_width+64,room_height+64,0,c_white,image_alpha); //Draw self
