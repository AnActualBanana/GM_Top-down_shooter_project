function enemy_zombie_idle(enemy) {
	speed = 0;
	if enemy.relocate_timer > 0 {enemy.relocate_timer -= 1};
	else {
		var relocate_check = round(random_range(0, 1000));
		if relocate_check >= 667 {
			enemy.relocate_x = enemy.home_x + clamp(random_range(-50, 50), -25, 25);
			enemy.relocate_y = enemy.home_y + clamp(random_range(-50, 50), -25, 25);
			Enemy_state = Enemy_state.wandering;
		}
		else {
		enemy.relocate_timer = 60
		};
		}
		//other code, such as detection
}