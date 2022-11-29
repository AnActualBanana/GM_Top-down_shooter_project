if instance_exists(Player) {
	//changes the player state-based accuracy modifier based on the player state variable
//positions gun
x = Player.x + lengthdir_x(5, Player.image_angle);
y = Player.y + lengthdir_y(5, Player.image_angle);

//rotates gun according to mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

if (image_angle >= 90 && image_angle <= 270) {
	layer = layer_get_id("gun_back");}
if (image_angle >= 0 && image_angle <= 89) {
	layer = layer_get_id("gun_front");}

if Player.Player_state = Player_state.idle //idle
	{Accuracy_modifier_state = Obj_player.Accuracy_modifier_idle;
	Max_recoil_modifier_state = Obj_player.Max_recoil_modifier_idle;
	}
if Player.Player_state = Player_state.crouched //crouched
	{Accuracy_modifier_state = Obj_player.Accuracy_modifier_crouched;
	Max_recoil_modifier_state = Obj_player.Max_recoil_modifier_crouched;
	}
if Player.Player_state = Player_state.walking //walking
	{Accuracy_modifier_state = Obj_player.Accuracy_modifier_walking;
	Max_recoil_modifier_state = Obj_player.Max_recoil_modifier_walking;
	}
if Player.Player_state = Player_state.sprinting //sprinting
	{Accuracy_modifier_state = Obj_player.Accuracy_modifier_sprinting;
	Max_recoil_modifier_state = Obj_player.Max_recoil_modifier_sprinting;}

//constantly adjusted accuracy based on current effective recoil, will be further modified by player state script
Final_accuracy = ((Accuracy * Accuracy_modifier_state) + Recoil_effective)
}