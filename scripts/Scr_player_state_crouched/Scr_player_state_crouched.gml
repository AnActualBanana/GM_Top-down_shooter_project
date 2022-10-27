if instance_exists (Obj_player) {
//runs script to get inputs and player variables
Scr_get_inputs();
Scr_get_player_info();

// checks inputs and moves player with their crouch speed, also detects appropriate inputs for returning to walking or Croucheding states
if (keyboard_lctrl = 0) {Player_state = Player_state.walking}

//resets idle timer upon movement input
if (keyboard_left or keyboard_right or keyboard_up or keyboard_down) {Idle_timer = 0};

//inputs move the player, also checks for collision with solid and stops movement accordingly
//orthagonal movements
if keyboard_left and (!keyboard_up and !keyboard_down and !keyboard_right) and place_free(x - 7, y) {x = Obj_player.x - Crouched_speed;}
if keyboard_right and (!keyboard_up and !keyboard_down and !keyboard_left) and place_free(x + 7, y) {x = Obj_player.x + Crouched_speed;}
if keyboard_up and (!keyboard_left and !keyboard_right and !keyboard_down) and place_free(x, y - 7) {y = Obj_player.y - Crouched_speed;}
if keyboard_down and (!keyboard_left and !keyboard_right and !keyboard_up) and place_free(x, y + 7) {y = Obj_player.y + Crouched_speed;}
//diagonal movements
if keyboard_left and keyboard_up {
	if place_free (x - 7, y) {x = Obj_player.x - (Crouched_speed * 0.5);}
	if place_free (x, y - 7) {y = Obj_player.y - (Crouched_speed * 0.5);}}
if keyboard_right and keyboard_up {
	if place_free (x + 7, y) {x = Obj_player.x + (Crouched_speed * 0.5);}
	if place_free (x, y - 7) {y = Obj_player.y - (Crouched_speed * 0.5);}}
if keyboard_left and keyboard_down {
	if place_free (x - 7, y) {x = Obj_player.x - (Crouched_speed * 0.5);}
	if place_free (x, y + 7) {y = Obj_player.y + (Crouched_speed * 0.5);}}
if keyboard_right and keyboard_down {
	if place_free (x + 7, y) {x = Obj_player.x + (Crouched_speed * 0.5);}
	if place_free (x, y + 7) {y = Obj_player.y + (Crouched_speed * 0.5);}}

//lshift switches to Sprinting state
if keyboard_lshift and (keyboard_left or keyboard_right or keyboard_up or keyboard_down) {
	Player_state = Player_state.sprinting}
	
//manages player numbers such as stamina and weapon cooldown
Obj_player.State = 2
if Obj_player.Stamina_cooldown_timer < Obj_player.Stamina_cooldown_threshold {
	Obj_player.Stamina_cooldown_timer += 1}
	
//stamina regen, checks for stamina cooldown timer
if ((Obj_player.Current_stamina < Obj_player.Max_stamina) && Obj_player.Stamina_cooldown_timer = Obj_player.Stamina_cooldown_threshold) 
	{Obj_player.Current_stamina += clamp(Obj_player.Regen_stamina_crouched, 0, (Obj_player.Max_stamina - Obj_player.Current_stamina))}

}