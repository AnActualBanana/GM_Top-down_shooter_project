if menu == "main_menu" {
	switch(menu_index) {

	case 0:
		instance_create_layer(x, y, "Instances_1", Obj_menu, {menu : "player_select"});
		instance_destroy(self)
		break;
	case 1:
		game_end();
		break;
}
}
if menu == "player_select" {
	switch(menu_index) {

	case 0: Obj_game.number_of_players = 1; room_goto(1); global.wave = 1;
			break;
	case 1: Obj_game.number_of_players = 2; room_goto(1); global.wave = 1;
			break;
	case 2: Obj_game.number_of_players = 3; room_goto(1); global.wave = 1;
			break;
	case 3: Obj_game.number_of_players = 4; room_goto(1); global.wave = 1;
			break;
	case 4: with instance_create_layer(x, y, "Instances_1", Obj_menu, {menu : "main_menu"}){
			menu = "main_menu"
			};
			instance_destroy(self);
			break;
};
};
if menu == "lobby" {
	switch(menu_index) {
	
	case 0: if !rollback_game_running {
				rollback_start_game()
				};
			instance_destroy(Obj_menu);
			room_goto(2);
			break;
	case 1: instance_create_layer(x, y, "Instances_1", Obj_menu, {menu : "player_select"});
			room_goto(0);
			break;
	}

}
