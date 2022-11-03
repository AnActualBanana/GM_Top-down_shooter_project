function enemy_zombie_idle(enemy) {
	enemy_zombie_detection(enemy); //check detection
	if Enemy_state = Enemy_state.pursuing {exit}; //exit early after pursuing check
	speed = 0;
	if relocate_timer = 0 {
		var relocate_check = random_range(0, 999)
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
	enemy_zombie_detection(enemy);
	direction = point_direction(x, y, relocate_x, relocate_y);
	speed = 0.5;
	if point_distance(x, y, relocate_x, relocate_y) <= 1 {
		relocate_timer = choose(180, round(random_range(1, 180)));
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
	show_debug_message("pursuing")
	enemy_zombie_detection(self);
	
	//animation and direction
	direction = point_direction(x, y, Obj_player.x, Obj_player.y);
    setActiveAnimation(0)
	
	//speed setting
    if sprinting = 1.0 and lastAlive = false {
        speed = 1.75
    } else if sprinting != 1.0 and lastAlive = false { 
        speed = 0.75
		}
	direction = point_direction(x, y, Obj_player.x, Obj_player.y);
    setActiveAnimation(0)
	
	if distance_to_object(Obj_player) > detection_circle_max_distance && distance_to_object(Obj_player) > detection_cone_length_max && detection_total_threshold <= 0 && Enemy_state != Enemy_state.idle && Enemy_state != Enemy_state.wandering{ //to searching
		home_x = x;
		home_y = y;
		Enemy_state = Enemy_state.idle;
	}
};
		
function enemy_zombie_attacking(enemy) {
	detection_total_threshold = 1000;
	setActiveAnimation(2);
	speed = 0;
	if withinDamageDistance()
		Obj_player.Current_health -= round(random_range(5, 8));
		canAttack = false;
};

function enemy_zombie_attack_cooldown(enemy) {};

function enemy_zombie_detection(enemy) {
	detection_cone_direction = direction;
	if detection_total_threshold >= 1000 && Enemy_state != Enemy_state.stunned && Enemy_state != Enemy_state.pursuing { //to pursuing if detected
		detection_noise_rate = 0;
		detection_noise_score = 0;
		detection_vision_score = 0;
		detection_vision_rate = 0;
		Enemy_state = Enemy_state.pursuing;
	}
	else {
	if (point_distance(x, y, Obj_player.x, Obj_player.y) < detection_cone_length_max) { // detection vision cone
		if (abs(angle_difference(detection_cone_direction, point_direction(x, y, Obj_player.x, Obj_player.y))) < detection_cone_width) {
			detection_vision_rate = 1.6 * (detection_cone_length_max - point_distance(x, y, Obj_player.x, Obj_player.y)) / 3000;
			}
		else {
			detection_vision_rate = (-1 * point_distance(x, y, Obj_player.x, Obj_player.y)) / 200;
		}
	}
	else {
		detection_vision_rate = (-1 * point_distance(x, y, Obj_player.x, Obj_player.y) - detection_cone_length_max) / 600;
	}
	
	if point_distance(x, y, Obj_player.x, Obj_player.y) <= detection_circle_max_distance {
		detection_noise_rate = Obj_player.total_noise * (10 / (point_distance(x, y, Obj_player.x, Obj_player.y) - (0.5 * detection_circle_min_distance)))
		}
		
	else if (point_distance(x, y, Obj_player.x, Obj_player.y) > detection_circle_max_distance) {
		detection_noise_rate = (-1 * (Obj_player.total_noise * 10 / (point_distance(x, y, Obj_player.x, Obj_player.y) - (0.1 * detection_circle_max_distance))))
		}
	if Enemy_state != Enemy_state.attacking { // adds detection score
		detection_noise_score += detection_noise_rate;
		detection_vision_score += detection_vision_rate;
		detection_total_threshold += (clamp(detection_vision_score, -1000 + detection_total_threshold, 1000 - detection_total_threshold));
		detection_total_threshold += (clamp(detection_noise_score, -1000 + detection_total_threshold, 1000 - detection_total_threshold));
		}
	}
	if detection_total_threshold <= 0 {detection_total_threshold = 0};
	if detection_noise_score < 0 {detection_noise_score = 0};
	if detection_vision_score < 0 {detection_vision_score = 0};
};