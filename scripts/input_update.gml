var i,h,keyboard;

keyboard=false

//check keyboard
if (global.infocus) for (i=0;i<key_sizeof;i+=1) {
    //we check the key direct twice because of how windows handles it
    //this fixes the input lag inherent to it
    keyboard_check_direct(global.keycode[i])

    //update globals
    global.key_pressed[i]=keyboard_check_pressed(global.keycode[i])
    global.key_released[i]=keyboard_check_released(global.keycode[i])
    global.key[i]=((keyboard_check_direct(global.keycode[i]) && global.infocus) || global.key_pressed[i]) && !global.key_released[i]

    if (global.key[i]) keyboard=true
}

if (joystick_found() || global.joysupdated) {
    //joysticks added or removed, let's set up some memory variables
    //they're used to tell where the stick is going

    if (joystick_count()>0) {
        //check for unknown joysticks

        var count;count=0
        message2text=""
        for (i=0;i<joystick_count();i+=1) {
            name=joystick_name(i)
            if (!settings("joymap_"+name+"_set")) {
                message2text+=joystick_name(i)+"#"
                count+=1
            }
        }
        if (count) {
            message2=300
            if (count==1) {
                message2text="New joystick found:#"+message2text+"Go to Options to set it up"
            } else {
                message2text=string(count)+" new joysticks found:#"+message2text+"Go to Options to set them up"
            }
        }
    }

    global.joysupdated=false
    for (i=0;i<joystick_count();i+=1) {
        name=joystick_name(i)
        if (settings("joymap_"+name+"_set")) {
            //this joystick has been configured, get it ready for use
            joy_set[i]=true
            for (b=0;b<key_sizeof;b+=1) {
                joy_button[i,b]=settings("joymap_"+name+"_"+string(b))
                joy_lock[i,b]=0
                global.key_old[i,b]=0
            }
        } else joy_set[i]=false
    }
}

//read joysticks
global.lastjoystick=noone
if (global.infocus) for (j=0;j<joystick_count();j+=1) if (joy_set[j]) {
    for (i=0;i<key_sizeof;i+=1) {
        reading_pressed=0
        reading_released=0
        reading_old=global.key_old[j,i]
        get=joy_get_map(j,i)
        global.key_old[j,i]=get
        if (get) global.lastjoystick=j
        global.key[i]=global.key[i] || get

        global.key_pressed[i]=global.key_pressed[i] || reading_pressed
        global.key_released[i]=global.key_released[i] || reading_released

    }
}


if (global.lastjoystick!=noone) {
    global.lastjoyname=joystick_name(global.lastjoystick)
}
if (keyboard) {
    global.lastjoyname=""
}

//store a copy of it for the player
for (i=0;i<key_sizeof;i+=1) {
    //this is necessary because the player might be running slower than the game
    //this allows the player to do 1fs more accurately
    if (global.key_pressed[i] && storekey_released[i]) {storekey_released_early[i]=1 storekey_released[i]=0}
    storekey_pressed[i]=storekey_pressed[i] || global.key_pressed[i]
    storekey_released[i]=storekey_released[i] || global.key_released[i]
    storekey[i]=(global.key[i] || storekey_pressed[i]) && !storekey_released[i]
}

global.input_h=global.key[key_right]-global.key[key_left]
global.input_v=global.key[key_down ]-global.key[key_up  ]
