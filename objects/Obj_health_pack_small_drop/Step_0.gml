//pre-despawn animation
Despawn_timer -= 1;
if (Despawn_timer <= 450) {
	sprite_index = asset_get_index(string("Spr_health_pack_small_drop_blinking"))
	if (Despawn_timer <= 225) {
		image_speed = 3.0
	} else {
		image_speed = 1.5
		}
	}
if (Despawn_timer = 0) { //despawns self after timer expires
	instance_destroy(self);
}