//pre-despawn animation
Despawn_timer -= 1;
if (Despawn_timer <= 450) {
	if (Despawn_timer <= 125) {
	image_speed = 1.0
	}
	else {
	image_speed = 0.5
	}
	}
if (Despawn_timer = 0) { //despawns self after timer expires
instance_destroy(self);
}