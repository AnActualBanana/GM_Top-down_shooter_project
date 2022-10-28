switch (Enemy_state) {
	case Enemy_state.idle: enemy_zombie_idle(self); break;
	case Enemy_state.wandering: enemy_zombie_wandering(self); break;
	case Enemy_state.stunned: enemy_zombie_stunned(self); break;
	case Enemy_state.searching: enemy_zombie_searching(self); break;
	case Enemy_state.pursuing: enemy_zombie_pursuing(self); break;
	case Enemy_state.attacking: enemy_zombie_attacking(self); break;
	case Enemy_state.attack_cooldown: enemy_zombie_attack_cooldown(self); break;
}

if stun_timer > 0 {
	stun_timer -= 1
}

if relocate_timer > 0 {
		relocate_timer --;
	}
if attack_cooldown_timer > 0 {
	attack_cooldown_timer -= 1
}

if stun_timer > 0 and Enemy_state != Enemy_state.stunned {
	Enemy_state = Enemy_state.stunned;
	alarm[0] = stun_timer;
	speed = 0;
	setActiveAnimation(3);
}

if attack_cooldown_timer > 0 and Enemy_state != Enemy_state.attack_cooldown and Enemy_state != Enemy_state.stunned {
	alarm[1] = attack_cooldown_timer
	Enemy_state = Enemy_state.attack_cooldown;
}

if distance_to_object(Obj_player) < 150 and distance_to_object(Obj_player) > 20 and Enemy_state != Enemy_state.stunned and Enemy_state != Enemy_state.attacking {
    Enemy_state = Enemy_state.pursuing;
}


if distance_to_object(Obj_player) <= 25 and Enemy_state != Enemy_state.attack_cooldown and Enemy_state != Enemy_state.stunned and Enemy_state != Enemy_state.attacking and canAttack = true {
	Enemy_state = Enemy_state.attacking;
	direction = point_direction(x, y, Obj_player.x, Obj_player.y);
	setActiveAnimation(2);
	speed = 0;
}

//kills enemy if hp is 0, then does death process
if hp <= 0 {dead = true};

//death process
if dead = true {
    //loot drop
    randomize();
    drop_roll = round(random_range(0, 999));
    loot_drop(self.id, drop_roll, global.wave);
    instance_destroy(self);
    };