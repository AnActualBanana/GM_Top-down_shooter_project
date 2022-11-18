//pre-despawn animation
Despawn_timer -= 1;
if (Despawn_timer = 0){ //despawns self after timer expires
instance_destroy(self);
}