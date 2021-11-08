#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//////////////// 3D GM logo ////////////////////
//
// Copyright Simon Donkers 10-10-2004
// www.simondonkers.tk - simondonkers@gmail.com
// 3D game maker logo. Made for GM 6.0
// requires a registered version
//
/////////////////////////////////////////////////////

path_start(pGM3d,5,1,1)

surf=-1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surf=sureface(surf,400,300)

if (surface_set_target_safe(surf)) {
    gmboss_draw()
}
surface_reset_target()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(surf)) surface_free(surf)
