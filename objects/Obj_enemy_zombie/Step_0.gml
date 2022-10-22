if animation_cooldown > 0 {
	animation_cooldown --;
}
switch (Enemy_state) {
	case Enemy_state.idle: enemy_zombie_idle(self); break;
	case Enemy_state.stunned: enemy_zombie_idle(self); break;
	case Enemy_state.searching: enemy_zombie_idle(self); break;
	case Enemy_state.pursuing: enemy_zombie_idle(self); break;
	case Enemy_state.attacking: enemy_zombie_idle(self); break;
	case Enemy_state.wandering: enemy_zombie_wandering(self); break;
}
if stun_timer > 0 { 
    Enemy_state = Enemy_state.stunned;
    stun_timer --;
    speed = 0;
}

if distance_to_object(Obj_player) < 250 and distance_to_object(Obj_player) > 20 {
        Enemy_state = Enemy_state.pursuing;
        if sprinting = 1.0 {
            speed = 1.75
        } else { 
            speed = 0.75
        }
}

//pursuing state issue movement animations
if Enemy_state = Enemy_state.pursuing {
    direction = point_direction(x, y, Obj_player.x, Obj_player.y);
    setActiveAnimation(0)
}

//attacking state issue attack animations
if distance_to_object(Obj_player) <= 20 && Enemy_state != Enemy_state.stunned {
    Enemy_state = Enemy_state.attacking;
    direction = point_direction(x, y, Obj_player.x, Obj_player.y);
    if Enemy_state = Enemy_state.attacking && attacking = false && attack_cooldown_timer = 0 {
        //attack
        setActiveAnimation(2)
        attacking = true;
        if point_distance(self.x, self.y, Obj_player.x, Obj_player.y) < 60 {
            Obj_player.Current_health -= round(random_range(10, 20));
			attack_cooldown_timer = attack_cooldown;
            attacking = false;
		}
    }
}

//attack cooldown
if attacking = false  && attack_cooldown_timer > 0 {
attack_cooldown_timer --;
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