
function enemy_zombie_wandering(enemy) {
direction = point_direction(x, y, enemy.relocate_x, enemy.relocate_y)
speed = 0.5
if point_distance(x, y, enemy.relocate_x, enemy.relocate_y) <= 1
{
Enemy_state = Enemy_state.idle
}
}