switch (Enemy_state) {
	case Enemy_state.idle: enemy_zombie_idle(self); break;
	case Enemy_state.wandering: enemy_zombie_wandering(self); break;
	case Enemy_state.stunned: enemy_zombie_stunned(self); break;
	case Enemy_state.searching: enemy_zombie_searching(self); break;
	case Enemy_state.pursuing: enemy_zombie_pursuing(self); break;
	case Enemy_state.attacking: enemy_zombie_attacking(self); break;
	case Enemy_state.attack_cooldown: enemy_zombie_attack_cooldown(self); break;
}

if global.enemies_alive <= 4 and lastAlive = false {
	lastAlive = true;
}

if lastAlive = true and pursueIgnoreDistanceChecks(){
	speed = 1.75;
	Enemy_state = Enemy_state.pursuing

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

if isStunned() {
	Enemy_state = Enemy_state.stunned;
	alarm[0] = stun_timer;
	speed = 0;
	setActiveAnimation(3);
}

if Enemy_state = Enemy_state.stunned and image_index >= 2 and image_index < 3 {
	image_speed = 0;
}

if onCooldown() {
	alarm[1] = attack_cooldown_timer
	Enemy_state = Enemy_state.attack_cooldown;
}

if attacked = true and canPursue() {
	Enemy_state = Enemy_state.pursuing
	attacked = false
}

if canPursue() {
	Enemy_state = Enemy_state.pursuing;
}

//pursuing state issue movement animations
if Enemy_state = Enemy_state.pursuing {
	if sprinting = 1.0 and lastAlive = false {
		speed = 1.75;
	} else if sprinting != 1.0 and lastAlive = false {
		speed = 0.75;
	}
    direction = point_direction(x, y, Obj_player.x, Obj_player.y);
    setActiveAnimation(0)
}

if canSetAttackingState() {
	Enemy_state = Enemy_state.attacking;
	direction = point_direction(x, y, Obj_player.x, Obj_player.y);
}

if Enemy_state = Enemy_state.attacking {
	setActiveAnimation(2);
	speed = 0;
	if withinDamageDistance()
		Obj_player.Current_health -= round(random_range(5, 8));
		canAttack = false;
}

//kills enemy if hp is 0, then does death process
if hp <= 0 {
	dead = true
}

//death process
if dead = true {
    //loot drop
    randomize();
    drop_roll = round(random_range(0, 1000));
    loot_drop(self.id, drop_roll, global.wave);
	global.enemies_alive -= 1;
    instance_destroy(self);
	show_debug_message("Number of enemies alive after death event called: "+ string(global.enemies_alive))
}