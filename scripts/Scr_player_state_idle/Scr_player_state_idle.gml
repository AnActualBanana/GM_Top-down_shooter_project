if instance_exists (Obj_player) {
//runs script to get inputs
Scr_get_inputs();
Scr_get_player_info();

//gets movement input and switches player to walking state when movement input is detected
//lshift switches to sprint state if player has stamina, also resets stamina timer
if ((keyboard_lshift) and (keyboard_left or keyboard_right or keyboard_up or keyboard_down) and (Obj_player.Current_stamina >= 1)) {
	Player_state = Player_state.sprinting; Obj_player.Stamina_cooldown_timer = 0}
else if ((!keyboard_lshift) and (keyboard_left or keyboard_right or keyboard_up or keyboard_down)) {Player_state = Player_state.walking}

//switches player to crouched state if ctrl input detected
if keyboard_lctrl {Player_state = Player_state.crouched}
//stamina regen
if ((Obj_player.Current_stamina < Obj_player.Max_stamina) ) {
	Obj_player.Current_stamina += clamp(Obj_player.Regen_stamina_idle, 0, (Obj_player.Max_stamina - Obj_player.Current_stamina))}
}