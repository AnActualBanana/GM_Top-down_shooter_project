if instance_exists(Obj_player) {
	if (keyboard_r = true && Obj_player.Player_reloading = false && Obj_handgun.Reserve_ammo > 0) {
		Player_reloading = true
		Obj_handgun.Reload_timer = Obj_handgun.Reload_speed
		audio_play_sound(Snd_handgun_reload, 1, 0)
		}
//decreases reload timer
if Obj_handgun.Reload_timer > 0 {Obj_handgun.Reload_timer -= 1};
//reloads
if Obj_handgun.Reload_timer = 0 && Obj_player.Player_reloading = true {
	if Obj_handgun.Reserve_ammo >= (Obj_handgun.Mag_size - Obj_handgun.Current_ammo) {
		Obj_handgun.Reserve_ammo -= (Obj_handgun.Mag_size - Obj_handgun.Current_ammo);
		Obj_handgun.Current_ammo = Obj_handgun.Mag_size
		}
	else {Obj_handgun.Current_ammo += Obj_handgun.Reserve_ammo
		  Obj_handgun.Reserve_ammo = 0;};
	Obj_player.Player_reloading = false;
	}
//aiming and shooting controls
//decreases cooldown timer
if Obj_player.Weapon_cooldown > 0 {Obj_player.Weapon_cooldown -= 1};

//checks player state and reduces recoil based on state
switch (Player_state) {
	case Player_state.idle: {if Obj_handgun.Recoil_effective > 0 {
	Obj_handgun.Recoil_effective -= Obj_handgun.Recoil_reduction_rate_idle}
							if Obj_handgun.Recoil_effective = 0 {Obj_handgun.Final_accuracy = Obj_handgun.Accuracy}
} break;

	case Player_state.walking: {if Obj_handgun.Recoil_effective > 0 {
	Obj_handgun.Recoil_effective -= Obj_handgun.Recoil_reduction_rate_walking}
} break;

	case Player_state.sprinting: {if Obj_handgun.Recoil_effective > 0 {
	Obj_handgun.Recoil_effective -= Obj_handgun.Recoil_reduction_rate_sprinting}
} break;
	
	case Player_state.crouched: {if Obj_handgun.Recoil_effective > 0 {
	Obj_handgun.Recoil_effective -= Obj_handgun.Recoil_reduction_rate_crouched}
} break;
}
//shooting
	//checks for weapon cooldown and if weapon has ammo
if (Obj_player.Weapon_cooldown = 0 && mouse_check_button_pressed(mb_left) && Obj_handgun.Current_ammo > 0 && Obj_player.Player_reloading = false) {
	Obj_player.Weapon_cooldown = Obj_player.Cooldown_value + Obj_handgun.Rof_cooldown;
	dir = point_direction(x, y, mouse_x, mouse_y);
	var gun_x = x + lengthdir_x(0, dir)
	var gun_y = y + lengthdir_y(0, dir)
	var aimed_x = gun_x + lengthdir_x (500, random_range(dir - Obj_handgun.Final_accuracy, dir + Obj_handgun.Final_accuracy))
	var aimed_y = gun_y + lengthdir_y (500, random_range(dir - Obj_handgun.Final_accuracy, dir + Obj_handgun.Final_accuracy))
	var target = collision_line(gun_x, gun_y, aimed_x, aimed_y, Obj_all_enemies, true, true)
	if (target != noone) var contact_x = aimed_x
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
    } else {
        target = found
        contact_x = end_x
        contact_y = end_y
        percent_end = middle_way
    }
} 
//creates muzzle flash and bullet casing objects, sets casing object to appropriate image
instance_create_layer(Obj_handgun.x, Obj_handgun.y, "Instances_1", Obj_muzzle_flare);
instance_create_layer(Obj_handgun.x, Obj_handgun.y, "gun_front", Obj_gunfire_tracer);    //why isn't this displaying?
{
Obj_gunfire_tracer.image_angle = point_direction(Obj_handgun.x, Obj_handgun.y, aimed_y, aimed_x); 
Obj_gunfire_tracer.image_yscale = 100;
Obj_gunfire_tracer.image_xscale = 100;
}
with instance_create_layer(Obj_handgun.x, Obj_handgun.y, "gun_front", Obj_bullet_casing)
{Obj_bullet_casing.image_index = 2; Obj_bullet_casing.image_speed = 0};

//recoil calculation, adds recoil to gun, according to gun's recoil stats
if Obj_handgun.Final_accuracy < Obj_handgun.Max_recoil_threshold {
	Obj_handgun.Recoil_effective = 
		Obj_handgun.Recoil_effective + Obj_handgun.Recoil_factor}
else Obj_handgun.Recoil_effective =
	Obj_handgun.Recoil_effective + ((Obj_handgun.Max_recoil_threshold + Obj_handgun.Recoil_factor) - (Obj_handgun.Final_accuracy)) //okay, this one is unneccesarily complicated (you can always improve), but basically, this creates an effective "max" recoil by adding max recoil threshold and recoil factor.
// removes ammo from mag
Obj_handgun.Current_ammo -= 1;
//gunfire sound
audio_sound_pitch(Snd_handgun, random_range(0.95, 1.1));
audio_sound_gain(Snd_handgun, random_range(0.95, 1.1), 1);
audio_play_sound(Snd_handgun, 1, 0);
if (target != noone) {
	
//critical hit check
var crit = false;
var crit_roll = round(random_range(0, 999));

if crit_roll >= Obj_handgun.Critical_threshold {
	crit = true; var Critical_multiplier = Obj_handgun.Critical_multiplier};
else Critical_multiplier = 1;
var dmg = (Obj_handgun.Damage * Critical_multiplier);

//stun check
var stun = false;
var stun_roll = round(random_range(0, 999));

if stun_roll >= Obj_handgun.Stun_threshold {stun = true;
	var Stun_duration = Obj_handgun.Stun_duration};
else Stun_duration = 0;

//final damage calculation
var final_dmg = dmg;

//check for valid target, do damage and sound
target.hp = target.hp - (final_dmg)
	target.stun_timer = Stun_duration;
	target.attacked = true;
instance_create_layer(contact_x, contact_y, "gun_front", Obj_blood_mist);
audio_sound_pitch(Snd_bullet_impact, random_range(0.9, 1.1));
audio_sound_gain(Snd_bullet_impact, random_range(1, 2), 1);
if crit = false {audio_play_sound(Snd_bullet_impact, 1, 0)};
if crit = true {audio_play_sound(Snd_shotgun, 1, 0)};
	}
}
//sound for no ammo
else if Obj_handgun.Current_ammo = 0 && Obj_player.Weapon_cooldown = 0 && mouse_check_button_pressed(mb_left) && Player_reloading = false{
audio_play_sound(Snd_handgun_empty, 1, 0);
}
}