//functions for getting items for players
function obtain_weapon(weapon_name, player) {
	var new_weapon = instance_create_layer(x, y, "Instances_1", weapon_name, {Player : player.id})
	return new_weapon.id;
}