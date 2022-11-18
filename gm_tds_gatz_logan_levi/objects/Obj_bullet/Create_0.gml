image_angle = dir;
direction = dir;
image_xscale = random_range(3, 3.5);
image_yscale = 0.8;
image_alpha = random_range(0.5, 0.7);

bullet_speed = 200;

//Time before visible
alarm_set(0,2);

hsp = cos(degtorad(dir)) * bullet_speed;
vsp = -sin(degtorad(dir)) * bullet_speed;