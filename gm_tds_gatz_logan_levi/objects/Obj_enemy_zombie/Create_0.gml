image_speed = 1;
image_xscale = 1.5;
image_yscale = 1.5;
hp = round(random_range(10, 35));; // health
stun_timer = 0; //frames enemy is stunned (counts down to 0)
sprinting = round(random_range(0, 1));
dead = false; //checks for death
speed = 0; //starting speed is randomized
base_speed = speed; // base speed stat from enemy's starting speed so it can be reverted back
attack_cooldown_timer = 0; // timer to count to 0 from cooldown stat
setAnimation = 0;
animation_name = "Spr_basic_idle";
animation_cooldown = 0;
home_x = x; //home coordinate x for wandering from
home_y = y; //home coordinate y for wandering from
relocate_x = x; //coordinate x to wander to
relocate_y = y; //coordinate y to wander to
relocate_timer = 180;
canAttack = true;

//variables for detection
detection_cone_direction = direction; // direction zombie is facing
detection_cone_width = 15; //degrees on either side of direction for detection cone
detection_cone_length_max = 500; // max distance for detection cone
detection_circle_min_distance = 20; // max distance before instant detection, noise is calculated based on distance player is between min and max range
detection_circle_max_distance = 200; // max distance for noise to factor
detection_vision_score = 0; //player being seen for detection
detection_vision_rate = 0; //rate of increase of detection vision score per frame (additive)
detection_noise_score = 0; //total player noise
detection_noise_rate = 0; //rate of increase of detection noise score per frame (additive)
detection_total_threshold = 0; //total detection score out of 1000
detection_total_max = 1000; // max detection (switches state)
//detection bar sprite
detection_bar_width = 58;
detection_bar_height = 12;
detection_bar_x = x - (detection_bar_width/2)
detection_bar_y = y - 50
//detection cone sprite

attacked = false;
last_attacked_by = undefined; // palyer who last damaged enemy
target = enemy_targeting_closest(self); // current target player
lastAlive = false;

enum Enemy_state {
	idle,
	stunned,
	searching,
	pursuing,
	attacking,
	wandering,
	attack_cooldown
}

Enemy_state = Enemy_state.idle;

animationData = [
    //Enemy Animation Data - [Animation name, attack_cooldown, image_speed, animation cooldown]
    ["Spr_basic_movement", 0, 1],
    ["Spr_basic_idle", 0, 1, 0],
    ["Spr_basic_zombie_attack", 90, 1],
	["Spr_basic_enemy_stun", 0, 1]
];

//Can add additional data later if needed.
lootData = [
	[Obj_handgun_ammo_drop],
	[Obj_health_pack_small_drop]
];

Player_interaction_stats = [ // tracks [damage dealt by, damage dealt to, detection total by, last attacked by]
["Player_1", 0, 0, false],
["Player_2", 0, 0, false],
["Player_3", 0, 0, false],
["Player_4", 0, 0, false],
]