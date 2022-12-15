function Scr_handgun(player, handgun) { //which player and handgun object to use
	if (keyboard_r = true && player.Player_reloading = false && handgun.Reserve_ammo > 0) {
		Player_reloading = true
		handgun.Reload_timer = handgun.Reload_speed
		audio_play_sound(Snd_handgun_reload, 1, 0)
	};
//decreases reload timer
	if handgun.Reload_timer > 0 {handgun.Reload_timer -= 1};
//reloads
	if handgun.Reload_timer = 0 && player.Player_reloading = true {
		if handgun.Reserve_ammo >= (handgun.Mag_size - handgun.Current_ammo) {
			handgun.Reserve_ammo -= (handgun.Mag_size - handgun.Current_ammo);
			handgun.Current_ammo = handgun.Mag_size
		}
		else {
			handgun.Current_ammo += handgun.Reserve_ammo
			handgun.Reserve_ammo = 0
		};
		Obj_player.Player_reloading = false;
	}
//aiming and shooting controls
//decreases cooldown timer
	if Obj_player.Weapon_cooldown > 0 {Obj_player.Weapon_cooldown -= 1};

//checks player state and reduces recoil based on state
	switch (Player_state) {
		case Player_state.idle: {
			if handgun.Recoil_effective > 0 {
				handgun.Recoil_effective -= handgun.Recoil_reduction_rate_idle
			};
			if handgun.Recoil_effective = 0 {
				handgun.Final_accuracy = handgun.Accuracy
			};
		} break;
		case Player_state.walking: {
			if handgun.Recoil_effective > 0 {
				handgun.Recoil_effective -= handgun.Recoil_reduction_rate_walking
			}
		} break;
		case Player_state.sprinting: {
			if handgun.Recoil_effective > 0 {
				handgun.Recoil_effective -= handgun.Recoil_reduction_rate_sprinting
				}
		} break;
		case Player_state.crouched: {
			if handgun.Recoil_effective > 0 {
				handgun.Recoil_effective -= handgun.Recoil_reduction_rate_crouched
			}
		} break;
	}
//shooting
	//checks for weapon cooldown and if weapon has ammo
	if (Obj_player.Weapon_cooldown = 0 && left_mouse_button && handgun.Current_ammo > 0 && Obj_player.Player_reloading = false) {
		Obj_player.Weapon_cooldown = Obj_player.Cooldown_value + handgun.Rof_cooldown;
		dir = point_direction(x, y, mouse_x, mouse_y);
		var gun_x = x + lengthdir_x(0, dir)
		var gun_y = y + lengthdir_y(0, dir)
		var aimed_x = gun_x + lengthdir_x (500, random_range(dir - handgun.Final_accuracy, dir + handgun.Final_accuracy))
		var aimed_y = gun_y + lengthdir_y (500, random_range(dir - handgun.Final_accuracy, dir + handgun.Final_accuracy))
		var target = collision_line(gun_x, gun_y, aimed_x, aimed_y, Obj_all_enemies, true, true)
		if (target != noone) {var contact_x = aimed_x};
		var contact_y = aimed_y
		var percent_start = 0;
		var percent_end = 1;
	var distance_x = aimed_x - gun_x
	var distance_y = aimed_y - gun_y
	var iterations = ceil(log2(point_distance(gun_x, gun_y, aimed_x, aimed_y)))
	repeat (iterations) {
		var middle_way =  (percent_end - percent_start) * 0.5 + percent_start
		var end_x = distance_x * middle_way + gun_x
		var end_y = distance_y * middle_way + gun_y
		var start_x = distance_x * percent_start + gun_x
		var start_y = distance_y * percent_start + gun_y
		var found = collision_line(start_x, start_y, end_x, end_y, Obj_all_enemies, true, true)
		if (found == noone) {
			percent_start = middle_way;
		};
		else {
			target = found
			contact_x = end_x
			contact_y = end_y
			percent_end = middle_way
		}
	} 
//creates muzzle flash and bullet casing objects, sets casing object to appropriate image
	instance_create_layer(handgun.x, handgun.y, "Instances_1", Obj_muzzle_flare);
	with instance_create_layer(handgun.x, handgun.y, "gun_front", Obj_bullet_casing) {
		Obj_bullet_casing.handgun = handgun;
		Obj_bullet_casing.image_index = 2; Obj_bullet_casing.image_speed = 0
	};

//recoil calculation, adds recoil to gun, according to gun's recoil stats
	if handgun.Final_accuracy < handgun.Max_recoil_threshold {
		handgun.Recoil_effective = handgun.Recoil_effective + handgun.Recoil_factor
	}
	else handgun.Recoil_effective =
	handgun.Recoil_effective + ((handgun.Max_recoil_threshold + handgun.Recoil_factor) - (handgun.Final_accuracy)) //okay, this one is unneccesarily complicated (you can always improve), but basically, this creates an effective "max" recoil by adding max recoil threshold and recoil factor.
// removes ammo from mag
	handgun.Current_ammo -= 1;
//gunfire sound
	audio_sound_pitch(Snd_handgun, random_range(0.95, 1.1));
	audio_sound_gain(Snd_handgun, random_range(0.95, 1.1), 1);
	audio_play_sound(Snd_handgun, 1, 0);

	if (target != noone) {
	
//critical hit check
	var crit = false;
	var crit_roll = round(random_range(0, 999));

	if crit_roll >= handgun.Critical_threshold {
		crit = true; var Critical_multiplier = handgun.Critical_multiplier
	};
	else {
		Critical_multiplier = 1
	};
	var dmg = round(random_range(handgun.min_hit, handgun.max_hit)) * Critical_multiplier;

//stun check
	var stun = false;
	var stun_roll = round(random_range(0, 999));

	if stun_roll >= handgun.Stun_threshold {
		stun = true;
		var Stun_duration = handgun.Stun_duration
	};
	else {Stun_duration = 0};

//final damage calculation
	var final_dmg = dmg;

//check for valid target, do damage and sound
	target.hp = target.hp - (final_dmg)
	target.stun_timer = Stun_duration;
	target.attacked = true;
	target.last_attacked_by = player;
	instance_create_layer(contact_x, contact_y, "gun_front", Obj_blood_mist);
	audio_sound_pitch(Snd_bullet_impact, random_range(0.9, 1.1));
	audio_sound_gain(Snd_bullet_impact, random_range(1, 2), 1);
	if crit = false {audio_play_sound(Snd_bullet_impact, 1, 0)};
	if crit = true {audio_play_sound(Snd_shotgun, 1, 0)};
		}
	}
//sound for no ammo
	else if handgun.Current_ammo = 0 && Obj_player.Weapon_cooldown = 0 && mouse_check_button_pressed(mb_left) && Player_reloading = false{
	audio_play_sound(Snd_handgun_empty, 1, 0);
	}
}