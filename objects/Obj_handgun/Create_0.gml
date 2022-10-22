//weapon stats
//minimum and maximum hit range
min_hit = 6
max_hit = 12
Rof_cooldown = 20 //weapon cooldown before next shot is fired, in frames (fire rate)
Damage = round(random_range(min_hit, max_hit)) // damage, random range from min and max hit
Mag_size = 10 //number of rounds magazine can hold
Current_ammo = 10 //number of rounds currently in magazine
Reserve_ammo = 100
Reload_timer = 0 // number of frames before weapon is reloaded
Reload_speed = 90 // number of frames it takes weapon to reload
	//recoil calculation, gets added to accuracy in Step event
Recoil_factor = 7.0 //amount of recoil generated per shot, (base recoil stat)
Recoil_modifier_crouched = -0.4 //amount of recoil subtracted from each shot while crouched (crouched recoil bonus) (negative number)
Recoil_modifier_walking = 0.4 //amount of recoil added to each shot while walking (walking recoil penalty)
Recoil_modifier_sprinting = 0.6//amount of recoil added to each shot while sprinting (sprinting recoil penalty)
Recoil_effective = 0 //effective recoil (the number that cools down)
Max_recoil_modifier_state = 1.0 // modifier for maximum amount of effective recoil, adjusted by player's state
Max_recoil_threshold = 10.9 //maximum amount of effective recoil before reducing recoil added per shot
Recoil_reduction_rate_idle = 0.25 //the amount of recoil that is subtracted, per frame, while idle
Recoil_reduction_rate_crouched = 0.5 //the amount of recoil that is subtracted , per frame, while crouched
Recoil_reduction_rate_walking = 0.15 //the amount of recoil that is subtracted  per frame, while walking
Recoil_reduction_rate_sprinting = 0.005 //the amount of recoil that is subtracted per frame, while sprinting
	//accuracy calculation, number is in degrees on either side of cursor
Accuracy_modifier_state = 1.0 //accuracy  modifier while player in different states
Accuracy = 5 //base accuracy (degrees), before modifiers
Final_accuracy = 0 //final accuracy, after calculations
	//special roll thresholds, out of 1000
Critical_threshold = 900 //number to hit or beat on a crit roll to hit a critical
Critical_multiplier = 2.5 //multiple of damage a critical hit will deal
Stun_threshold = 667 //number to hit or beat on a stun roll to hit a stun
Stun_duration = 60 //frames to stun target for if stun roll is a success

instance_create_depth(Obj_handgun.x, Obj_handgun.y, 0, Obj_crosshair)