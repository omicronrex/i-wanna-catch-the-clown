//returns true if inside a game room

switch (room) {
    case rmCapcom: case rmInit: case rmTitle: case rmOptions: case rmMenu: return 0
    default: return 1
}
