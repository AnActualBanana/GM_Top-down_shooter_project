// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
if instance_exists(Obj_game_manager) && instance_exists(Obj_endless_zombie_spawner) {
	if Obj_game_manager.Round_begin = false {
	Obj_endless_zombie_spawner.Normal_zombie_spawn_time_round = 30
	Obj_endless_zombie_spawner.Normal_zombie_spawn_count_round = 10
	Obj_player.Enemies_killed_round = 0;
	Obj_game_manager.Round_begin = true
	}
//checks for round kill goal, once reached, runs round end script
if (Obj_player.Enemies_killed_round >= Obj_endless_zombie_spawner.Normal_zombie_spawn_count_round) {script_execute(Scr_wave_end)}
}