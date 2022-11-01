function enemy_zombie_idle(enemy) {
	speed = 0;
	if relocate_timer = 0 {
	var relocate_check = random_range(0, 999)
	show_debug_message(string(relocate_check))
		if relocate_check >= 667 {
				relocate_x = (random_range(home_x - 50, home_x + 50));
				relocate_y = (random_range(home_y - 50, home_y + 50));
				Enemy_state = Enemy_state.wandering;
			}
		else {
				relocate_timer = 180;
		}
	}
};

function enemy_zombie_wandering(enemy) {
	show_debug_message("wandering")
	direction = point_direction(x, y, relocate_x, relocate_y);
	speed = 0.5;
	if point_distance(x, y, relocate_x, relocate_y) <= 1 {
		relocate_timer = round(random_range(1, 180));
		Enemy_state = Enemy_state.idle;
	}
};

function enemy_zombie_stunned(enemy) {
	if image_index >= 2 and image_index < 3 {
		image_speed = 0;
	}
};

function enemy_zombie_searching(enemy) {};

function enemy_zombie_pursuing(enemy) {
	//animation and direction
	direction = point_direction(x, y, Obj_player.x, Obj_player.y);
    setActiveAnimation(0)
	//speed setting
    if sprinting = 1.0 {
        speed = 1.75
    } else { 
        speed = 0.75
		}
		
	if distance_to_object(Obj_player) > 150 { //to idle
		home_x = x;
		home_y = y;
		Enemy_state = Enemy_state.idle;
	}
};
		
function enemy_zombie_attacking(enemy) {
	if point_distance(self.x, self.y, Obj_player.x, Obj_player.y) < 50
		Obj_player.Current_health -= round(random_range(5, 8));
		canAttack = false;
		
	if distance_to_object(Obj_player) > 150 { //to idle
		home_x = x;
		home_y = y;
		Enemy_state = Enemy_state.idle;
	}
};

function enemy_zombie_attack_cooldown(enemy) {};