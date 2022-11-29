Obj_game.number_of_players_alive += 1;

//assigns players to player variables by instance_id
if player_id == 0 {
Obj_game.Player_ids.Player_1 = [self.id, "alive"]
}
if player_id == 1 {
Obj_game.Player_ids.Player_2 = [self.id, "alive"]
};
if player_id == 2 {
Obj_game.Player_ids.Player_3 = [self.id, "alive"]
};
if player_id == 3 {
Obj_game.Player_ids.Player_4 = [self.id, "alive"]
};

create_cameras(self.id);

Player_state = 0 //player state set to default
State = 0
Dead = false //for death process
Player_reloading = false //for reloading
global.enemies_killed_round = 0 //sets the global variable for enemies killed this round
global.wave = 1
	//player stats
//some speed stats
Walk_speed = 2.0
Sprint_speed = 4.0
Crouched_speed = 1.0
//some weapon and weapon handling stats
Accuracy_modifier_idle = 1.0 //modifier to weapon accuracy when idle (multiply)
Accuracy_modifier_crouched = 0.95 //modifier to weapon accuracy when crouched (multiply)
Accuracy_modifier_walking = 1.2 //modifier to weapon accuracy when walking (multiply)
Accuracy_modifier_sprinting = 1.5 //modifier to weapon accuracy when sprinting (multiply)
Max_recoil_modifier_idle = 1.0
Max_recoil_modifier_crouched = 0.9
Max_recoil_modifier_walking = 1.1
Max_recoil_modifier_sprinting = 1.2
//some max and current player statuses
Current_health = 100
Current_stamina = 100
Max_health = 100
Max_stamina = 100
//stat regen rates
Regen_stamina_walking = 0.25 //rate at which stamina regenerates while walking, per frame
Regen_stamina_crouched = 1.0 //rate at which stamina regenerates while crouched, per frame
Regen_stamina_idle = 0.5 //rate at which stamina regenerates while stationary, per frame
//some cooldown numbers
Idle_timer = 0 //frames without movement input from player
Stamina_cooldown_timer = 0
Stamina_cooldown_threshold = 150
Reload_timer = 0
Weapon_cooldown = 0 //frames until weapon is ready to fire
Cooldown_value = 1
Invincibility_frames = 0 //frames where player takes no damage
Enemies_killed_round = 0 //number of enemies player has killed each round
setAnimation = 0
animation_name = 0
//detection code
noise_multiple_idle = 0.1;
noise_multiple_walking = 1.0;
noise_multiple_crouched = 0.1;
noise_multiple_sprinting = 1.5;
noise_multiple_state = 0.0;
total_noise = 0.0;

y = room_height / 2

if (player_id == 0) {
	x = 50;
}
else if (player_id == 1) {
	x = room_width - 50;
}
instance_create_layer(x, y, "Instances_1", Obj_main_gui)
enum Player_state {
	idle,
	walking,
	sprinting,
	crouched,
	interacting,
	in_menu,
	inactive,
}
Player_state = 0

//creates states for currently equipped weapon, then sets default weapon state
enum Player_equipped_weapon {
	menu,
	hands,
	handgun,
	shotgun,
	rifle_bolt_action,
	placeholder,
}
Player_equipped_weapon = Player_equipped_weapon.handgun

//orientation and rotation speed based on mouse position, fixed, no need to change
dir = 0 //Direction, used only for rotation
image_xscale = 1.5;
image_yscale = 1.5;

animationData = [
    //Player Animation Data
    ["Spr_chad_walk", 0, 1],
	["Spr_chad_idle", 0, 1],
	["Spr_chad_idle_alt", 0, 1]
];
handgun = obtain_weapon(Obj_handgun, self); //gives player handgun (for testing) and assigns instance_id to variable
show_debug_message("player created")