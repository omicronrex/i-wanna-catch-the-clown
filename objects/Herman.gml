#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=100
alarm[1]=150
savedata("herman",1)

f=5

active=0
timer=0
atk=0
speak=0
line=1
mouth=0
cur=0
ohmy=0
whatsthat=0
talk=0

dx=152
dy=137

snd=sound_add_included("bgm_herman.mid",1,1)
snd2=sound_add_included("bgm_hermanoffice.mid",1,1)
snd3=sound_add_included("tele.wav",0,1)
snd4=sound_add_included("sfx_crt_off.wav",0,1)

font=font_add_sprite(sprZRFont,ord('!'),1,3)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(snd3)
visible=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(snd)
active=1
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speak=1
timer=0
ohmy=10
sound_loop(snd2)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Player.skin=skin_greenorange

if (active && instance_exists(Player)) {
    timer+=1/room_speed
    k=random(360)

    if (timer>0.734 && timer<4.761) {
        instance_create_moving(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),HermanBullet,6,random(360))
    }

    if (timer>5.511 && timer<8.405) {
        o=instance_create_moving(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),HermanBullet,6,random(360))
        o.sprite_index=sprHermanBullet2
        o.curving=choose(1,-1)
    }

    if (timer>9.449 && timer<10.501) {
        instance_create_moving(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),HermanBullet,6,random(360))
    }

    if (timer>10.501 && atk=0) {
        atk=1
        for (i=0;i<360;i+=20) instance_create_moving(x,y-64,HermanBullet,8,i+k)
    }

    if (timer>10.501 && timer<14.326) {
        instance_create_moving(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),HermanBullet,6,random(360))
    }

    if (timer>14.982 && timer<17.947) {
        o=instance_create_moving(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),HermanBullet,6,random(360))
        o.sprite_index=sprHermanBullet2
        o.curving=choose(1,-1)
    }

    if (timer>10.501 && timer<17.947 && irandom(1)) {
        o=instance_create_moving(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),HermanBullet,3,random(360))
        o.sprite_index=sprHermanBullet2
        o.image_speed=0
        o.image_index=round(o.direction/360*16)
    }

    if (timer>18.964 && timer<20.100) {
        instance_create_moving(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),HermanBullet,6,random(360))
    }

    if (timer>19.797 && atk=1) {
        atk=2
        for (i=0;i<360;i+=20) instance_create_moving(x,y-64,HermanBullet,8,i+k)
    }

    if (timer>19.948 && atk=2) {
        atk=3
        for (i=0;i<360;i+=20) instance_create_moving(x,y-64,HermanBullet,8,i+k)
    }

    if (timer>20.100 && atk=3) {
        atk=4
        for (i=0;i<360;i+=10) instance_create_moving(x,y-64,HermanBullet,8,i+k)
    }

    if (timer>23) {active=0 alarm[2]=1}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (speak) {
switch (line) {
  case 1: text_stock =
  "OH MY!"; break;
  case 2: text_stock =
  "I NEVER EXPECTED YOU TO DEFEAT OUR JOKE AVOIDANCE.
YOU'RE TRULY AMAZING."; break;
  case 3: text_stock =
  "NOW YOU SHOULD HAVE NO PROBLEM DEFEATING THE FINAL BOSS.
ALTHOUGH..."; break;
  case 4: text_stock =
  "OUR SCIENTISTS BELIEVE THE SUPERCOMPUTER CAN'T ACTUALLY CALCULATE THE TRUE STRENGTH OF THE ENEMY FORCES."; break;
  case 5: text_stock =
  "BUT ON THE OTHER HAND."; break;
  case 6: text_stock =
  "WE STILL DON'T EVEN KNOW THE TRUE POTENTIAL OF THE FINAL BOSS..."; break;
  case 7: text_stock =
  "IF ONLY WE COULD LEARN MORE ABOUT ITS WHEREABOUTS...
WHO CREATED IT AND WHY... WHY WAS IT HIDDEN AWAY?"; break;
  case 8: text_stock =
  "IS IT EVEN... HUMAN?"; break;
  case 9: text_stock =
  "OH MY!"; break;
  case 10: text_stock =
  "YOU'RE STILL HERE?"; break;
  case 11: text_stock =
  "WHAT'S THAT?
HOW ARE WE ABLE TO CREATE SUCH AN AMAZING EXPERIENCE?"; break;
  case 12: text_stock =
  "IT'S ALL THANKS TO GAME MAKER, THE GREATEST PROGRAM MARK OVERMARS HAS EVER CREATED!"; break;
  case 13: text_stock =
  "... WELL, TO BE COMPLETELY HONEST, HE DIDN'T BUILD IT FROM SCRATCH. HE USED THIS STRANGE HAMMER-LIKE CORE TO POWER IT."; break;
  case 14: text_stock =
  "NOW THAT I'M THINKING ABOUT IT, IT'S AWFULLY SIMILAR TO YOUR GUN'S TECHNOLOGY."; break;
  case 15: text_stock =
  "FUNNY HOW THAT WORKS."; break;
  case 16: text_stock =
  "ANYWAY, ITS CAPABILITIES EXCEED OUR WILDEST IMAGINATIONS! NOTHING ON THIS PLANET EVEN COMPARES."; break;
  case 17: text_stock =
  "BUT THAT ISN'T EVEN THE CRAZIEST PART. YOU KNOW HOW THE MOST EFFICIENT SUPER COMPUTERS CAN DO,"; break;
  case 18: text_stock =
  "LIKE, ZAZILLION CALCULATIONS IN A MILLISECOND? GAME MAKER DOESN'T WORK QUITE LIKE THAT. WE BELIEVE THAT"; break;
  case 19: text_stock =
  "INSTEAD OF JUST CALCULATING POSSIBLE RESULTS IT ACTUALLY SUBSITUTES THE REALITY WITH ITS OWN VISION OF REALRAMBLE ETC"; break;
  case 20: text_stock =
  "IN OTHER WORDS, GAME MAKER SIMPLY IGNORES ANYTHING THAT DOESN'T WORK PROPERLY."; break;
  case 21: text_stock =
  "TO THINK THAT WE HUMANS WERE ABLE TO TAME IT FOR OUR OWN PURPOSES."; break;
  case 22: text_stock =
  "WHAT'S THAT?
ARE YOU IMPLYING GAME MAKER IS USING US?"; break;
  case 23: text_stock =
  "HA HA HA!
GOOD ONE."; break;
  default: text_stock =
  "...";
    }

    if (cur<string_length(text_stock)) {
        talk+=1
        if (!(talk mod 2) || (line==17 || line==18 || line==19)) {
            cur+=1 mouth=choose(1,2,3)
        }
    } else {
        if (line=20) mouth=1 //pog
        else mouth=0
        timer+=1
        if (timer>50 || line=17 || line=18 || line=19) {
            timer=0
            line+=1
            if (line==1 || line==9 || line=23) ohmy=10
            if (line==11 || line==22) whatsthat=40
            cur=0
            if (line=24) {
                sound_play(snd4)
                settings("herman",1)
                event_game_end()
            }
        }
    }
    ohmy=max(0,ohmy-2)
    whatsthat=max(0,whatsthat-1)
    text_show=string_copy(text_stock,1,cur)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_delete(snd)
sound_delete(snd2)
sound_delete(snd3)
font_delete(font)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=max(1,f-0.25)

if (f>1) {
    for (i=0;i<274;i+=2) {
        draw_sprite_part_ext(sprite_index,0,0,i,304,2,x-dx*f+sin(current_time/100+i/20)*(f-1)*100*((i mod 4)-1),y+i-dy,f,1,$ffffff,1)
    }
} else draw_sprite(sprite_index,0,x,y-ohmy)

if (speak) {
    draw_sprite(sprZRFrame,0,400-216-4,y+200-4)
    draw_sprite(sprZRFrame,1,400-216-4,y+266-9)
    draw_sprite(sprZRFrame,2,400+216-9,y+200-4)
    draw_sprite(sprZRFrame,3,400+216-9,y+266-9)

    draw_set_font(font)
    draw_text_ext(400-216+12,y+200+12,text_show,16,416);

    draw_sprite(sprHermanSpeak,!whatsthat*mouth+3*!!whatsthat,x,y)
    draw_sprite(sprHermanBrow,!!whatsthat,x,y)
}
