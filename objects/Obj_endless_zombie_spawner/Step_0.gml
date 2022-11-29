if instance_exists(Obj_player) {
	if Normal_zombie_spawn_timer = Normal_zombie_spawn_time_round && Normal_zombie_spawned_round < Normal_zombie_spawn_count_round {
	var next_player = random_player();
	var next_spawn_x = clamp(choose ((next_player.x - random_range(75, 500)), next_player.x + random_range(75, 500)), 0, room_width)
	var next_spawn_y = clamp(choose ((next_player.y - random_range(75, 500)), next_player.y + random_range(75, 500)), 0, room_height)
	instance_create_layer(next_spawn_x, next_spawn_y,"Instances_1", Obj_enemy_zombie)
	Normal_zombie_spawned_round += 1
	Normal_zombie_spawn_timer = 0
}
Normal_zombie_spawn_timer += 1;
}