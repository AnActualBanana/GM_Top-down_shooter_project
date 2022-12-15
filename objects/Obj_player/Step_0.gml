//tracks stats
Current_score = global.enemies_killed_total
total_noise = noise_multiple_state;
//checks player state, runs appropriate script
get_inputs(self);

switch (Player_state) {
	case Player_state.idle: 
		player_state_idle(self); 
		break;
	case Player_state.walking: 
		player_state_walking(self); 
		break;
	case Player_state.sprinting: 
		player_state_sprinting(self); 
		break;
	case Player_state.crouched: 
		player_state_crouched(self); 
		break;
	case Player_state.in_menu: 
		player_state_in_menu(self); 
		break;
}
//checks for currently equipped weapon, then runs corresponding script
switch (Player_equipped_weapon) {
	case Player_equipped_weapon.handgun: 
		Scr_handgun(self, handgun); 
		break;
	case Player_equipped_weapon.menu: 
		break;
}
//points sprite at mouse
dir = point_direction(x, y, mouse_x, mouse_y);

if (Player_state = Player_state.walking || Player_state = Player_state.sprinting) {
	setActiveAnimation(0)
}

if (Player_state = Player_state.idle and image_index = 0) {
	var randomIdleAnimation = round(random_range(0, 1000));
	if randomIdleAnimation >= 10 {
	setActiveAnimation(1)
	} else {
	setActiveAnimation(2)
	}
}
//high score
if Current_score >= global.highest_score {
	global.highest_score = Current_score
}
//death process
if Current_health <= 0 {
	Dead = true
}

if Dead = true { //death process
	Enemies_killed_round = 0;
	global.enemies_killed_round = 0;
	global.wave = 0;
	room_goto(0);
	instance_destroy(self);
	Obj_game_manager.Player_ids.Player_1 = [self.id, "dead"];
	Obj_game_manager.number_of_players_alive -= 1;
	};