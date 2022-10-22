function setActiveAnimation(setAnimation) {
    animation_name = string(animationData[setAnimation][0])
    sprite_index = asset_get_index(string(animation_name))
    attack_cooldown_timer = animationData[setAnimation][1]
    image_speed = animationData[setAnimation][2]
    show_debug_message("")
    show_debug_message("")
    show_debug_message("Animation ID set to the value of " + string(setAnimation) + " - Did I break here? - setActiveAnimation")
    show_debug_message("Sprite_index set to " + string(animation_name) + " - Did I break here? - setActiveAnimation")
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