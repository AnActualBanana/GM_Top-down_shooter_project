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
animation_name = 0;
animation_cooldown = 0;
home_x = x; //home coordinate x for wandering
home_y = y; //home coordinate y for wandering
relocate_x = x;
relocate_y = y;
relocate_timer = 180;
canAttack = true;

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
    //Enemy Animation Data
    ["Spr_basic_movement", 0, 1],
    ["Spr_basic_idle", 0, 1, 0],
    ["Spr_basic_zombie_attack", 90, 1],
	["Spr_basic_enemy_stun", 0, 1]
];

//Future array for holding drop data, can be 2d, or whatever is needed.
lootData[0] = [0, 0, 0, 0, 0, 0, 0, 0, 0]

projectileData = [
[],
[],
[],
[],
[],
];