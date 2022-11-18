if rollback_game_running == true { //tracks stats
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
	if player_id == 0 {
	Obj_game.Player_ids.Player_1 = [self.id, "dead"]
	};
	if player_id == 1 {
	Obj_game.Player_ids.Player_2 = [self.id, "dead"]
	};
	if player_id == 2 {
	Obj_game.Player_ids.Player_3 = [self.id, "dead"]
	};
	if player_id == 3 {
	Obj_game.Player_ids.Player_4 = [self.id, "dead"]
	};

	Obj_game.number_of_players_alive -= 1;
	};
}