if instance_exists(Obj_player) {
	//changes the player state-based accuracy modifier based on the player state variable
	
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