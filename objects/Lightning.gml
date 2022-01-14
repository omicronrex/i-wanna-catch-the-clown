#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*GAMECAVE EFFECTS ENGINE 3.X
Read the GCE3X documentation before using this code!

Object Name - objThunder_fork_complex
Engine - Rain Engine
Purpose - Generates a lightning "shape" and then draws it. This is
the complex, more realistic type of lightning. It uses primitives and
a few statements to give a realstical approach to the lightning.
*/

alpha = 1; //The alpha of the lightning.
_irr = 40; //The complexity of the lightning; the larger value, the more CPU usage
_ml = 20; //The maximum length of the lightning
_br = 18; //The random change of an irritation having branches.


_x=x;
_y=y;

instance_create(0,0,LightningFade)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
n_br = 0; //Number of branches

//I use 'mb' for the M-ain B-ranch and 'sb' for the branchings
mb_dir = 200+random(140); //Direction of the piece of line
for (i=0;i<_irr;i+=1) {
    mb_x[i] = _x; mb_y[i] = _y; //Position of the irritation; I used 'mb' for the M-ain B-ranch
    _branching = (random(_br)<1); //Whether irritation i has a branching
    if (_branching = true) {
       n_br += 1;
       b_irr[n_br] = random(_irr); //Number of irritations for this branching
       sb_x[n_br,0] = mb_x[i]; sb_y[n_br,0] = mb_y[i];
          //Position of the first irritation: the same as the position of the irritation
          //of the main branch this branching starts on

       ///////////
       _c = cos(pi*floor(random(2)));
       if (_c=1) sb_dir = 190+random(60);
       else sb_dir = 350-random(60);
       ////////// This makes the branch going left OR right; not left and later right

       for (j=1;j<b_irr[n_br];j+=1) {
           sb_x[n_br,j] = sb_x[n_br,j-1]+lengthdir_x(random(_ml),sb_dir);
           sb_y[n_br,j] = sb_y[n_br,j-1]+lengthdir_y(random(_ml),sb_dir);
           if (_c=1) sb_dir = 190+random(60);
           else sb_dir = 350-random(60);
           }
       }
    _x += lengthdir_x(random(_ml),mb_dir);
    _y += lengthdir_y(random(_ml),mb_dir);

    mb_dir = mb_dir-30+random(60);
    if (mb_dir > 340) mb_dir -= random(60);
    if (mb_dir < 200) mb_dir += random(60); //Lightning never goes up, so prevent it from happening
    }
alpha -= 1/9; //Slowly fade out.
if alpha<0{instance_destroy()} //Destroy when faded out.

draw_set_blend_mode(bm_add); //Draw additive-ly
draw_set_color(make_color_rgb(217,160,255)); //Set the colour to a purplish thing.
draw_set_alpha(alpha/2); //Draw the lightning at the specified alpha value.

for (xxx=-1;xxx<=1;xxx+=1) {
    for (yyy=-1;yyy<=1;yyy+=1) {

        draw_primitive_begin(pr_linestrip);
        for (i=0;i<_irr;i+=1) {
            draw_vertex(mb_x[i]+xxx,mb_y[i]+yyy);
            }
        draw_primitive_end();

    for (i=1;i<n_br;i+=1) {
        draw_primitive_begin(pr_linestrip);
        for (j=0;j<b_irr[i];j+=1) {
            draw_vertex(sb_x[i,j]+xxx,sb_y[i,j]+yyy);
            }
        draw_primitive_end();
        }
    }
}

draw_set_alpha(1); //Reset Alpha
draw_set_color(c_white); //Reset colour.
draw_set_blend_mode(0)
