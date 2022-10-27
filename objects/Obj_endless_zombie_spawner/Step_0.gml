if Normal_zombie_spawn_timer = Normal_zombie_spawn_time_round && Normal_zombie_spawned_round < Normal_zombie_spawn_count_round {
	var next_spawn_x = choose ((Obj_player.x - random_range(50, 510)), Obj_player.x + random_range(50, 510))
	var next_spawn_y = choose ((Obj_player.y - random_range(50, 510)), Obj_player.y + random_range(50, 510))
	instance_create_layer(next_spawn_x, next_spawn_y,"Instances_1", Obj_enemy_zombie)
	global.enemies_spawned_round += 1
	Normal_zombie_spawned_round += 1
	Normal_zombie_spawn_timer = 0}
Normal_zombie_spawn_timer += 1