image_speed = 1;
image_xscale = 1.5;
image_yscale = 1.5;
hp = round(random_range(10, 35));; // health
stun_timer = 0; //frames enemy is stunned (counts down to 0)
sprinting = round(random_range(0, 1));
dead = false; //checks for death
speed = 0; //starting speed is randomized
base_speed = speed; // base speed stat from enemy's starting speed so it can be reverted back
attacking = false; // is enemy attacking?
attack_cooldown = 120; //cooldown
attack_cooldown_timer = 0; // timer to count to 0 from cooldown stat
setAnimation = 0;
animation_name = 0;
animation_cooldown = 0;
home_x = x; //home coordinate x for wandering
home_y = y; //home coordinate y for wandering
relocate_x = x;
relocate_y = y;
relocate_timer = 180;

enum Enemy_state {
	idle,
	stunned,
	searching,
	pursuing,
	attacking,
	wandering,
}

Enemy_state = Enemy_state.idle;

/**animation_data, goal is to be able to house all the data required. Number of frames in each animation, 
being able to edit each individual frames origin (for proper hit detecting, rotation, etc.) that stays
consistent with other simpler animations.**/

/*Defining the array values.
animation_name = animationData[0];
get_Sprite = animationData[1];
animation_cool_down = animationData[2];
animation_speed = animationData[3];
frame_data = animationData[4];
*/

//origin_x = frameData[1];
//origin_y = frameData[2];

/*Frame variables/data being stored in a multi-dimension array, 
to be accessed when needed.
*/

/*frameData = [
    [sprite_get_info(sprite_get_number(get_Sprite)), x, y]
];*/

//Animation variables/data being stored in an multi-dimension array, to be accessed when needed.
//0 animation_name, 1 cooldown, animation_speed

animationData = [
    //Enemy Animation Data
    ["Spr_basic_movement", 0, 1],
    ["Spr_basic_idle", 0, 1],
    ["Spr_basic_zombie_attack", 180, 1]
];

/*function getDirection(Object) {
	if (Object.direction >= 90 && Object.direction <= 270) {
		image_xscale = -1.5
		sprite_index = asset_get_index(string(get_Sprite));
	} else if (Object.direction >= 0 && Object.direction <= 89) {
		image_xscale = 1.5
		sprite_index = asset_get_index(string(get_Sprite));
	}
}*/
