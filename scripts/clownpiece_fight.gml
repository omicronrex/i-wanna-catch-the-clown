//straight lasers
if (phase==0) {
    time=40
    mode="normal"
    clown_attack1()
}

//Hell Sign "Eclipse of Hell"
if (phase==1) {
    time=30
    mode="timeout"
    name='Hell Sign "Eclipse of Hell"'
    clown_spell1()
}

//angled lasers
if (phase==2) {
    time=40
    mode="limited"
    clown_attack2()
}

//Hell Sign "Star and Stripe"
if (phase==3) {
    time=40
    mode="rest"
    name='Hell Sign "Star and Stripe"'
    clown_spell2()
}

//aimed red lasers
if (phase==4) {
    time=45
    mode="limited"
    clown_attack3()
}

//Hellfire "Infernal Essence of Grazing"
if (phase==5) {
    time=60
    mode="rest"
    name='Hellfire "Infernal Essence of Grazing"'
    clown_spell3()
}

//intermission 1
if (phase==6) clown_intermission()

//Inferno "Striped Abyss"
if (phase==7) {
    time=50
    mode="normal"
    name='Inferno "Striped Abyss"'
    clown_spell4()
}

//intermission 2
if (phase==8) clown_intermission()

//"Apollo Hoax Theory"
if (phase==9) {
    time=35
    mode="timeout"
    name='"Apollo Hoax Theory"'
    clown_spell5()
}

if (phase==10) clown_defeat()
