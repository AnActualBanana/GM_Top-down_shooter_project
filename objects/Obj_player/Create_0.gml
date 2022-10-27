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


//is this the first run? (test)
Current_round = 1

//orientation and rotation speed based on mouse position, fixed, no need to change
rspeed = 18 // Rotation speedThe higher the values, the faster the rotation
dir = 0 //Direction, used only for rotation
image_xscale = 1.5;
image_yscale = 1.5;

animationData = [
    //Player Animation Data
    ["Spr_chad_walk_anim", 0, 1],
	["Spr_chad_idle", 0, 1]
];