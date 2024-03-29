function player_state_crouched (player) {
if instance_exists (player) {
//runs script to get inputs and player variables
get_inputs(player);

// checks inputs and moves player with their crouch speed, also detects appropriate inputs for returning to walking or Croucheding states
if (keyboard_lctrl = 0) {player.Player_state = Player_state.walking}

//resets idle timer upon movement input
if (keyboard_left or keyboard_right or keyboard_up or keyboard_down) {Idle_timer = 0};

//inputs move the player, also checks for collision with solid and stops movement accordingly
//orthagonal movements
if keyboard_left and (!keyboard_up and !keyboard_down and !keyboard_right) and place_free(x - 7, y) {x = player.x - Crouched_speed;}
if keyboard_right and (!keyboard_up and !keyboard_down and !keyboard_left) and place_free(x + 7, y) {x = player.x + Crouched_speed;}
if keyboard_up and (!keyboard_left and !keyboard_right and !keyboard_down) and place_free(x, y - 7) {y = player.y - Crouched_speed;}
if keyboard_down and (!keyboard_left and !keyboard_right and !keyboard_up) and place_free(x, y + 7) {y = player.y + Crouched_speed;}
//diagonal movements
if keyboard_left and keyboard_up {
	if place_free (x - 7, y) {x = player.x - (Crouched_speed * 0.5);}
	if place_free (x, y - 7) {y = player.y - (Crouched_speed * 0.5);}}
if keyboard_right and keyboard_up {
	if place_free (x + 7, y) {x = player.x + (Crouched_speed * 0.5);}
	if place_free (x, y - 7) {y = player.y - (Crouched_speed * 0.5);}}
if keyboard_left and keyboard_down {
	if place_free (x - 7, y) {x = player.x - (Crouched_speed * 0.5);}
	if place_free (x, y + 7) {y = player.y + (Crouched_speed * 0.5);}}
if keyboard_right and keyboard_down {
	if place_free (x + 7, y) {x = player.x + (Crouched_speed * 0.5);}
	if place_free (x, y + 7) {y = player.y + (Crouched_speed * 0.5);}}

//lshift switches to Sprinting state
if keyboard_lshift and (keyboard_left or keyboard_right or keyboard_up or keyboard_down) {
	player.Player_state = Player_state.sprinting}
	
if player.Stamina_cooldown_timer < player.Stamina_cooldown_threshold {
	player.Stamina_cooldown_timer += 1
	}
	
//stamina regen, checks for stamina cooldown timer
if ((player.Current_stamina < player.Max_stamina) && player.Stamina_cooldown_timer = player.Stamina_cooldown_threshold) 
	{player.Current_stamina += clamp(player.Regen_stamina_crouched, 0, (player.Max_stamina - player.Current_stamina))}

player.noise_multiple_state = player.noise_multiple_crouched;
}
};