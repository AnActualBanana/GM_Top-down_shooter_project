if instance_exists (Obj_player) {
//runs scripts to get inputs and player info
Scr_get_inputs();
Scr_get_player_info();

//inputs move the player, also checks for collision with solid and stops movement accordingly
//orthagonal movements
//lshift switches to sprint state if player has stamina, also resets stamina timer
if ((keyboard_lshift) and (keyboard_left or keyboard_right or keyboard_up or keyboard_down) and (Obj_player.Current_stamina >= 1)) {
	Player_state = Player_state.sprinting; Obj_player.Stamina_cooldown_timer = 0}
	
if keyboard_left and (!keyboard_up and !keyboard_down and !keyboard_right) and place_free(x - 7, y) {x = Obj_player.x - Walk_speed;}
if keyboard_right and (!keyboard_up and !keyboard_down and !keyboard_left) and place_free(x + 7, y) {x = Obj_player.x + Walk_speed;}
if keyboard_up and (!keyboard_left and !keyboard_right and !keyboard_down) and place_free(x, y - 7) {y = Obj_player.y - Walk_speed;}
if keyboard_down and (!keyboard_left and !keyboard_right and !keyboard_up) and place_free(x, y + 7) {y = Obj_player.y + Walk_speed;}
//diagonal movements
if keyboard_left and keyboard_up {
	if place_free (x - 7, y) {x = Obj_player.x - (Walk_speed * 0.5);}
	if place_free (x, y - 7) {y = Obj_player.y - (Walk_speed * 0.5);}}
if keyboard_right and keyboard_up {
	if place_free (x + 7, y) {x = Obj_player.x + (Walk_speed * 0.5);}
	if place_free (x, y - 7) {y = Obj_player.y - (Walk_speed * 0.5);}}
if keyboard_left and keyboard_down {
	if place_free (x - 7, y) {x = Obj_player.x - (Walk_speed * 0.5);}
	if place_free (x, y + 7) {y = Obj_player.y + (Walk_speed * 0.5);}}
if keyboard_right and keyboard_down {
	if place_free (x + 7, y) {x = Obj_player.x + (Walk_speed * 0.5);}
	if place_free (x, y + 7) {y = Obj_player.y + (Walk_speed * 0.5);}}
	
//player management
//begins idle timer after no movement input, resets idle timer with input, and switches player state to idle after 2 seconds
if ((keyboard_left or keyboard_right or keyboard_up or keyboard_down or keyboard_lctrl or keyboard_space) = false) {
	Obj_player.Idle_timer = Obj_player.Idle_timer + 1
	if Obj_player.Idle_timer = 60 {Player_state = Player_state.idle}
}
else {Obj_player.Idle_timer = 0}

//manages player numbers and variables such as stamina and weapon cooldown
//stamina regen timer
if ((Obj_player.Stamina_cooldown_timer < Obj_player.Stamina_cooldown_threshold) and (keyboard_lshift == false)) {
	Obj_player.Stamina_cooldown_timer += 1}
	
//stamina regen, checks for stamina cooldown timer
if ((Obj_player.Current_stamina < Obj_player.Max_stamina) and (Obj_player.Stamina_cooldown_timer = Obj_player.Stamina_cooldown_threshold)) 
	{Obj_player.Current_stamina += clamp(Obj_player.Regen_stamina_walking, 0, (Obj_player.Max_stamina - Obj_player.Current_stamina))}

//detects crouch input and switches state to crouched
if keyboard_lctrl {Player_state = Player_state.crouched}
	
Obj_player.noise_multiple_state = Obj_player.noise_multiple_walking;
}