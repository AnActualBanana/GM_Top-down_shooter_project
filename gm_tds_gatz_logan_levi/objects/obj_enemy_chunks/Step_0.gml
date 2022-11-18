//bounces off walls
move_bounce_solid(false);

//controls speed
if (speed > 0)
{
speed -= 0.5
image_angle += 2;
}

if (speed < 0)
{
speed = 0;	
}

//fades
if (is_fading = 1)
{
image_alpha -= 0.02;	
}


if (image_alpha < 0.01)
{
instance_destroy();	
}