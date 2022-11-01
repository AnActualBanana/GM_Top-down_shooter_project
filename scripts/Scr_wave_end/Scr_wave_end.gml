if (instance_exists(Obj_game_manager) && instance_exists(Obj_player)){
	Obj_game_manager.Shop_open = true
	Obj_game_manager.Game_state = Game_state.not_in_round
	global.enemies_alive = Obj_endless_zombie_spawner.Normal_zombie_spawn_count_round;
}