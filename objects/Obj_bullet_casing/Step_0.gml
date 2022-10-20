//Bounces off walls
move_bounce_solid(false);

//Controls speed
if (speed > 0)
{
speed -= 0.5
image_angle += 2;
}

if (speed < 0)
{
speed = 0;	
}


//Fades
if (is_fading = 1)
{
image_alpha -= 0.02;	
}

//Destroys when invisible
if (image_alpha < 0.01)
{
instance_destroy();	
}