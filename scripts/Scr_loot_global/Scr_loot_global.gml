function loot_drop(enemy_instance = instance_id, drop_roll, wave) {
	switch (enemy_instance.object_index) { //check enemy type
		case Obj_enemy_zombie:
			if (drop_roll >= 0 and drop_roll <= 100) {
				var item_drop = string(lootData[0][0])
			} else if (drop_roll >= 101 and drop_roll <= 175) {
				var item_drop = string(lootData[1][0])
			} else if (drop_roll <= 176 and drop_roll >= 201) {
				var item_drop = string(lootData[round(random_range(0,1))][0])
			} else
				var item_drop = "none";
			break;
		default: item_drop = "none"; break;
	}
	if item_drop != "none" {
		spawn_drop(enemy_instance, item_drop)
	} //does drop
}

function spawn_drop(enemy_instance, item_drop) { //does drop
	instance_create_layer(enemy_instance.x, enemy_instance.y, "Instances_1", item_drop);
}