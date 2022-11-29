/// @description (Pickup)
if Obj_player.Current_health < Obj_player.Max_health {
Obj_player.Current_health += clamp(Health_value, 0, (Obj_player.Max_health - Obj_player.Current_health)); //adds ammo
instance_destroy(self); //despawns self
};
