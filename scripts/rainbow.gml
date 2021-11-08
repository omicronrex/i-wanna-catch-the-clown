///rainbow(hue)
//compensates for different color brightness in human vision
var lum,c,r,g,b;

lum=144

c=make_color_hsv(argument[0],128,lum)

r=color_get_red(c)/lum
g=color_get_green(c)/lum
b=color_get_blue(c)/lum
                                                     //kodak grayscale constants
return make_color_hsv(argument[0],128,median(0,(lum/(r*0.2126+g*0.7152+b*0.0722)),255))
