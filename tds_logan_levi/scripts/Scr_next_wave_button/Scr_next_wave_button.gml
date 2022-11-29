function next_wave_button () {
	if instance_exists(Obj_game_manager) {
	Obj_game_manager.Shop_open = false;
	Obj_game_manager.Next_wave = true;
	}
}