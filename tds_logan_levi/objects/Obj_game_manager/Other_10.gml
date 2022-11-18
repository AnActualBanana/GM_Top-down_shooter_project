/// @description open menu
var _width = 300;
var _height = 100;

create_button(40, 40, _width, _height, "Next Wave", next_wave_button);

create_button(40, 40 + _height + 40, _width, _height, "Options", on_click);

create_button(40, 40 + (_height + 40) * 2, _width, _height, "Quit", Scr_quit_game);