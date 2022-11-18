switch(menu_index) {

	case 0:
		show_debug_message("NEW GAME");
		room_goto(1);
		global.wave = 1
		break;
	case 3:
		game_end();
		break;
}
