
menu_x = x;
menu_y = y;
button_h = 32;

// buttons
button[0] = "New Game";
button[1] = "Load Game(placeholder)";
button[2] = "Options(placeholder)";
button[3] = "Exit";
buttons = array_length_1d(button);
audio_play_sound(Snd_menu_song, 0, 1)
menu_index = 0;
last_selected = 0;