//checks if sprint conditions are met before running script
//gets inputs
Scr_get_inputs();
if ((instance_exists (Obj_player)) and (Obj_player.Current_stamina > 0)) {
//getsplayer info
Scr_get_player_info();

//Reverts state to Walking when lshift released or when no stamina
if ((keyboard_lshift or keyboard_left or keyboard_down or keyboard_right or keyboard_up or keyboard_space = false) or (Obj_player.Current_stamina <= 0)) {Player_state = Player_state.walking}

//inputs move the player, also checks for collision with solid and stops movement accordingly
//orthagonal movements
if keyboard_left and (!keyboard_up and !keyboard_down and !keyboard_right) and place_free(x - 7, y) {x = Obj_player.x - Sprint_speed;}
if keyboard_right and (!keyboard_up and !keyboard_down and !keyboard_left) and place_free(x + 7, y) {x = Obj_player.x + Sprint_speed;}
if keyboard_up and (!keyboard_left and !keyboard_right and !keyboard_down) and place_free(x, y - 7) {y = Obj_player.y - Sprint_speed;}
if keyboard_down and (!keyboard_left and !keyboard_right and !keyboard_up) and place_free(x, y + 7) {y = Obj_player.y + Sprint_speed;}
//diagonal movements
if keyboard_left and keyboard_up {
	if place_free (x - 7, y) {x = Obj_player.x - (Sprint_speed * 0.5);}
	if place_free (x, y - 7) {y = Obj_player.y - (Sprint_speed * 0.5);}}
if keyboard_right and keyboard_up {
	if place_free (x + 7, y) {x = Obj_player.x + (Sprint_speed * 0.5);}
	if place_free (x, y - 7) {y = Obj_player.y - (Sprint_speed * 0.5);}}
if keyboard_left and keyboard_down {
	if place_free (x - 7, y) {x = Obj_player.x - (Sprint_speed * 0.5);}
	if place_free (x, y + 7) {y = Obj_player.y + (Sprint_speed * 0.5);}}
if keyboard_right and keyboard_down {
	if place_free (x + 7, y) {x = Obj_player.x + (Sprint_speed * 0.5);}
	if place_free (x, y + 7) {y = Obj_player.y + (Sprint_speed * 0.5);}}
	
//reduces stamina every frame
Obj_player.State = 3
Obj_player.Current_stamina -= 1;
Obj_player.Stamina_cooldown_timer = 0
Obj_player.Idle_timer = 0
}