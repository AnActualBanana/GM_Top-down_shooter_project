if instance_exists(Obj_player) {
	//changes the player state-based accuracy modifier based on the player state variable
//positions gun
x = Obj_player.x + lengthdir_x(5, Obj_player.image_angle);
y = Obj_player.y + lengthdir_y(5, Obj_player.image_angle);

//rotates gun according to mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

if (image_angle >= 90 && image_angle <= 270) {
	layer = layer_get_id("gun_back");}
if (image_angle >= 0 && image_angle <= 89) {
	layer = layer_get_id("gun_front");}

if Obj_player.State = 0 //idle
	{Accuracy_modifier_state = Obj_player.Accuracy_modifier_idle;
	Max_recoil_modifier_state = Obj_player.Max_recoil_modifier_idle;
	}
if Obj_player.State = 2 //crouched
	{Accuracy_modifier_state = Obj_player.Accuracy_modifier_crouched;
	Max_recoil_modifier_state = Obj_player.Max_recoil_modifier_crouched;
	}
if Obj_player.State = 1 //walking
	{Accuracy_modifier_state = Obj_player.Accuracy_modifier_walking;
	Max_recoil_modifier_state = Obj_player.Max_recoil_modifier_walking;
	}
if Obj_player.State = 3 //sprinting
	{Accuracy_modifier_state = Obj_player.Accuracy_modifier_sprinting;
	Max_recoil_modifier_state = Obj_player.Max_recoil_modifier_sprinting;}

//constantly adjusted accuracy based on current effective recoil, will be further modified by player state script
Final_accuracy = ((Accuracy * Accuracy_modifier_state) + Recoil_effective)
}