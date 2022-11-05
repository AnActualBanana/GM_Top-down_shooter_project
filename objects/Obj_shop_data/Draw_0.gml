/// @description Insert description here
// You can write your code in this editor
draw_sprite_stretched(
	Spr_shop_hud,
	0,
	x-6,
	y-6,
	12+rowLength*36,
	12+(((SHOP_INVENTORY-1) div rowLength) + 1) * 36
);

for (var i = 0; i < SHOP_INVENTORY; ++ i) {
	var xx = x + (i mod rowLength) * 36 + 2;
	var yy = y + (i div rowLength) * 36 + 2;
	draw_sprite(Spr_shop_slot, 0, xx, yy)
	if (activeShop != -1) {
		draw_sprite(Spr_handgun_ammo_drop, 0, xx, yy)
		show_debug_message("Sprite drawn to shop, displayed?");
	}
	show_debug_message("Shop attempting to display");
}