function player_state_walking(player) {
	if instance_exists (player) {
//runs scripts to get inputs and player info
		get_inputs(player);

//inputs move the player, also checks for collision with solid and stops movement accordingly
	//orthagonal movements
		//lshift switches to sprint state if player has stamina, also resets stamina timer
		if ((keyboard_lshift) and (keyboard_left or keyboard_right or keyboard_up or keyboard_down) and (player.Current_stamina >= 1)) {
		player.Player_state = Player_state.sprinting; player.Stamina_cooldown_timer = 0
		};
	
		if keyboard_left and (!keyboard_up and !keyboard_down and !keyboard_right) and place_free(x - 7, y) {
			x = player.x - Walk_speed
			};
		if keyboard_right and (!keyboard_up and !keyboard_down and !keyboard_left) and place_free(x + 7, y) {
			x = player.x + Walk_speed
			};
		if keyboard_up and (!keyboard_left and !keyboard_right and !keyboard_down) and place_free(x, y - 7) {
			y = player.y - Walk_speed
			};
		if keyboard_down and (!keyboard_left and !keyboard_right and !keyboard_up) and place_free(x, y + 7) {
			y = player.y + Walk_speed
			};

	//diagonal movements
		if keyboard_left and keyboard_up {
			if place_free (x - 7, y) {x = player.x - (Walk_speed * 0.5);}
			if place_free (x, y - 7) {y = player.y - (Walk_speed * 0.5);}}
		if keyboard_right and keyboard_up {
			if place_free (x + 7, y) {x = player.x + (Walk_speed * 0.5);}
			if place_free (x, y - 7) {y = player.y - (Walk_speed * 0.5);}}
		if keyboard_left and keyboard_down {
			if place_free (x - 7, y) {x = player.x - (Walk_speed * 0.5);}
			if place_free (x, y + 7) {y = player.y + (Walk_speed * 0.5);}}
		if keyboard_right and keyboard_down {
			if place_free (x + 7, y) {x = player.x + (Walk_speed * 0.5);}
			if place_free (x, y + 7) {y = player.y + (Walk_speed * 0.5);}}
	
	//player management
		//begins idle timer after no movement input, resets idle timer with input, and switches player state to idle after 2 seconds
		if ((keyboard_left or keyboard_right or keyboard_up or keyboard_down or keyboard_lctrl or keyboard_space) = false) {
			player.Idle_timer = player.Idle_timer + 1
			if player.Idle_timer = 60 {
				player.Player_state = Player_state.idle
				};
		};
		else {
			player.Idle_timer = 0
			};

	//manages player numbers and variables such as stamina and weapon cooldown
		//stamina regen timer
		if ((player.Stamina_cooldown_timer < player.Stamina_cooldown_threshold) and (keyboard_lshift == false)) {
			player.Stamina_cooldown_timer += 1}
	
		//stamina regen, checks for stamina cooldown timer
		if ((player.Current_stamina < player.Max_stamina) and (player.Stamina_cooldown_timer = player.Stamina_cooldown_threshold)) {
			player.Current_stamina += clamp(player.Regen_stamina_walking, 0, (player.Max_stamina - player.Current_stamina))
			};

		//detects crouch input and switches state to crouched
		if keyboard_lctrl {player.Player_state = Player_state.crouched}
	
		player.noise_multiple_state = player.noise_multiple_walking;
	};
};