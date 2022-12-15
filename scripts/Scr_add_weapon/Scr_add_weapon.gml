//functions for getting items for players


function valid_pickup_list() {
item_pickup_list = [Obj_handgun_ammo_drop, Obj_handgun_drop, Obj_health_pack_small_drop]
//list of items possible to be picked up
new_list = [];
iterator = 0;
for (var obj = 0; obj < array_length(item_pickup_list); obj++) {
	instance_list = []
	for (num = 0; num < instance_number(item_pickup_list[obj]); num++)
	{
		array_push(instance_list,instance_find(item_pickup_list[obj], all))
	};
	show_debug_message(string(instance_list))
	for (var inst = 0; inst < array_length(instance_list); inst++) {
		if point_distance(Obj_player.x, Obj_player.y, instance_list[inst].x, instance_list[inst].y) <= instance_list[inst].pickup_radius {
			array_push(new_list, instance_list[inst]);
			show_debug_message(string(new_list[inst]))
		}
	}
	iterator++;
}
// This function takes the "new_list" array and removes all items from it
// that the "Obj_player" is no longer in range of{
    // Iterate through the array of items
for (var i = 0; i < array_length(new_list); i++)
{
    // Get the current item in the list
    var item = new_list[i];

    // Check if the item is no longer within pickup range of the player
    if (point_distance(Obj_player.x, Obj_player.y, item.x, item.y) > item.pickup_radius)
    {
        // Remove the item from the list
        array_delete(new_list, i, 1);
        i--;
    }
}
}

// This function finds the closest item in the pickup list that the player can pick up
function closest_item()
{
	new_list = valid_pickup_list;
    // Set the initial minimum distance to the maximum possible value
    var min_distance = max(room_width, room_height);
    var closest_item_id = -1;

    // Iterate through the list of items
    for (var i = 0; i < array_length(new_list); i++)
    {
        // Get the current item in the list
        var item = new_list[i];

        // Calculate the distance between the player and the item
        var distance = point_distance(Obj_player.x, Obj_player.y, item.x, item.y);

        // Check if the distance is smaller than the current minimum distance
        if (distance < min_distance)
        {
            // Update the minimum distance and the closest item id
            min_distance = distance;
            closest_item_id = item.id;
        }
    }

    // Return the id of the closest item
    return closest_item_id;
}

function obtain_weapon(weapon_name, player) {
	var new_weapon = instance_create_layer(x, y, "Instances_1", weapon_name, {Player : player.id})
	return new_weapon.id;
}

