if instance_exists(Obj_game_manager) && instance_exists(Obj_endless_zombie_spawner) {
	if Obj_game_manager.Round_begin = false {
	Obj_game_manager.Round_begin = true
	Obj_endless_zombie_spawner.Normal_zombie_spawn_time_round = 30
	Obj_endless_zombie_spawner.Normal_zombie_spawn_count_round = round(random_range(minSpawn * global.wave, maxSpawn * global.wave));
	global.enemies_alive = Obj_endless_zombie_spawner.Normal_zombie_spawn_count_round;
	}
//checks for round kill goal, once reached, runs round end script
if (Obj_player.Enemies_killed_round >= Obj_endless_zombie_spawner.Normal_zombie_spawn_count_round) {
	Obj_game_manager.Round_begin = false;
	script_execute(Scr_wave_end)
	}
}