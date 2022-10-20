//Sets angle to face player, plus random deviation
image_angle = Obj_gun.image_angle+random_range(-45,45);
image_xscale = 0.2;
image_yscale = 0.2;

//Casing speed
speed = 10+random_range(3,6);

//Sets direction to eject perpendicular to player, plus random deviation
direction = Obj_gun.image_angle+random_range(-110,-70);

//Controls fading
is_fading = 0;
alarm_set(0, 150+random_range(30,90));

//Controls sound
alarm_set(1,10);

//Sets casing according to player
image_speed = 0;

if (instance_exists(obj_player_rifle))
{
image_index = 0;	
}

if (instance_exists(obj_player_shotgun))
{
image_index = 1;	
}

if (instance_exists(Obj_handgun))
{
image_index = 2;	
}