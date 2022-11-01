//tracks stats
Current_score = global.enemies_killed_total
total_noise = noise_multiple_state;
//checks player state, runs appropriate script
switch (Player_state) {
	case Player_state.idle: Scr_player_state_idle(); break;
	case Player_state.walking: Scr_player_state_walking(); break;
	case Player_state.sprinting: Scr_player_state_sprinting(); break;
	case Player_state.crouched: Scr_player_state_crouched(); break;
	case Player_state.in_menu: Scr_player_state_in_menu(); break;
}
//checks for currently equipped weapon, then runs corresponding script
switch (Player_equipped_weapon) {
	case Player_equipped_weapon.handgun: Scr_handgun(); break;
	case Player_equipped_weapon.menu: break;
}
//points sprite at mouse
dir = point_direction(x, y, mouse_x, mouse_y);

if Current_score >= global.highest_score {global.highest_score = Current_score} //high score

//death process
if Current_health <= 0 {Dead = true}
if Dead = true {
	Enemies_killed_round = 0;
	global.enemies_killed_round = 0;
	global.wave = 0;
	room_goto(0);
	instance_destroy(Obj_endless_zombie_spawner);
	instance_destroy(self);
	};