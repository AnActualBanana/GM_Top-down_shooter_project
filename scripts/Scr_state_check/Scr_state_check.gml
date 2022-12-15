/*Checks to return when attempting to apply the attacking state.*/
function canSetAttackingState(){
	return Enemy_state != Enemy_state.stunned and Enemy_state != Enemy_state.attack_cooldown and Enemy_state != Enemy_state.attacking and canAttack = true and withinAttackDistance();
}
/*Checks to return when attempting to apply the attack_cooldown state.*/ 
function onCooldown(){
	return Enemy_state != Enemy_state.attack_cooldown and Enemy_state != Enemy_state.stunned and attack_cooldown_timer > 0;
}
/*Checks to return when attempting to apply the pursuing state. Also houses the reaction check
for if the enemy has been attacked or not. If the enemy is attacked by the player, it ignores
all distance checks. It only checks for the stunned, attacking, or attack_cooldown state.
*/
function canPursue(){
	if (attacked = true) {
		return pursueIgnoreDistanceChecks();
	} /*else
	return pursuingChecks();*/
}
/*Ignores the distance check called by pursuingChecks(), only checks the states,
the proceeds to grab the location of the player and pursues. Will only stop if the player
breaks the detection range of the zombie again.*/
function pursueIgnoreDistanceChecks(){
	return Enemy_state != Enemy_state.pursuing and Enemy_state != Enemy_state.stunned and Enemy_state != Enemy_state.attacking and Enemy_state != Enemy_state.attack_cooldown;
}
/*Checks for applying the stunned state.*/
function isStunned(){
	return stun_timer > 0 and Enemy_state != Enemy_state.stunned;
}
/*Checks for applying the pursuing state. Also handles the distance check here.*/
function pursuingChecks(){

	}
/*Distance check to apply the attacking state.*/
function withinAttackDistance(){
	return distance_to_object(target) <= 20;
}
/*Distance check to apply the damage too the target*/
function withinDamageDistance(){
	return distance_to_object(target) <= 30;
}