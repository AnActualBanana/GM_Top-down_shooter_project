//loot roll
function loot_drop(enemy_instance = instance_id, drop_roll, wave) {
	switch (enemy_instance.object_index) { //check enemy type
		case Obj_enemy_zombie: 
			if drop_roll > 850 && drop_roll < 950 {var item_drop = Obj_handgun_ammo_drop};
			else if drop_roll >= 950 {var item_drop = Obj_health_pack_small_drop};
			else {var item_drop = "none"}; break;
		default: item_drop = "none"; break;
	}
	
if item_drop != "none" {spawn_drop(enemy_instance, item_drop)}; //does drop
}

function spawn_drop(enemy_instance, item_drop) { //does drop
instance_create_layer(enemy_instance.x, enemy_instance.y, "Instances_1", item_drop);
}