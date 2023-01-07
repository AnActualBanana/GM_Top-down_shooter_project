if instance_exists(Obj_game_manager) {
	switch (Game_state) {
		case Game_state.not_in_round: 
			with (Obj_player) {Player_state = Player_state.in_menu};
			with (Obj_player) {Player_equipped_weapon = Player_equipped_weapon.menu};
			instance_destroy(Obj_all_enemies);
			with (Obj_player) {Enemies_killed_round = 0}; break;
		case Game_state.in_round: {switch (global.wave) { // runs appropriate wave script
			default: script_execute(Scr_wave_random_progressive); break;
			} break;
		}
	}
}
//next wave
if Next_wave == true && instance_exists(Obj_player){
Obj_game_manager.Game_state = Game_state.in_round;
with (Obj_player) {Player_state = Player_state.idle};
with (Obj_player) {Player_equipped_weapon = Player_equipped_weapon.handgun};
Obj_endless_zombie_spawner.Normal_zombie_spawned_round = 0;
Obj_endless_zombie_spawner.Normal_zombie_spawn_timer = 0;
global.wave += 1;
Obj_game_manager.Next_wave = false;
}



if (Shop_open)
	event_user(0);
else
	event_user(1);