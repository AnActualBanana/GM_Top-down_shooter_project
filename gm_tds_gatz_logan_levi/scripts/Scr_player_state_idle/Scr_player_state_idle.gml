function player_state_idle(player) {if instance_exists (player) {
//runs script to get inputs
get_inputs(player);

//gets movement input and switches player to walking state when movement input is detected
//lshift switches to sprint state if player has stamina, also resets stamina timer
if ((keyboard_lshift) and (keyboard_left or keyboard_right or keyboard_up or keyboard_down) and (player.Current_stamina >= 1)) {
	Player_state = Player_state.sprinting; player.Stamina_cooldown_timer = 0}
else if ((!keyboard_lshift) and (keyboard_left or keyboard_right or keyboard_up or keyboard_down)) {Player_state = Player_state.walking}

//switches player to crouched state if ctrl input detected
if keyboard_lctrl {Player_state = Player_state.crouched}
//stamina regen
if ((player.Current_stamina < player.Max_stamina) ) {
	player.Current_stamina += clamp(player.Regen_stamina_idle, 0, (player.Max_stamina - player.Current_stamina))}

player.noise_multiple_state = player.noise_multiple_idle;
}
}