function setActiveAnimation(setAnimation) {
    animation_name = string(animationData[setAnimation][0])
    sprite_index = asset_get_index(string(animation_name))
    attack_cooldown_timer = animationData[setAnimation][1]
    image_speed = animationData[setAnimation][2]
}

function getDirection(Object) {
    if (Object.direction >= 90 && Object.direction <= 270) {
        image_xscale = -1.5
        sprite_index = asset_get_index(string(animation_name))
    } else if (Object.direction >= 0 && Object.direction <= 89) {
        image_xscale = 1.5
        sprite_index = asset_get_index(string(animation_name))
    }
}

function getGunDirection(Object) {
	if (Object.direction >= 90 && Object.direction <= 270) {
		image_xscale = -2
		sprite_index = asset_get_index(string("Spr_handgun"))
	} else if (Object.direction >= 0 && Object.direction <= 89) {
		image_xscale = 2
		sprite_index = asset_get_index(string("Spr_handgun"))
	}
}