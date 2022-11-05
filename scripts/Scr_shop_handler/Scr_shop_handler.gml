function setActiveShop(shopOpened) {
    switch (shopOpened) {
        case "weapon_shop":
            openShop(weaponShopData);
        break;
        case "consumables_shop":
            openShop(consumableShopData);
        break;
    }
    show_debug_message("setActiveShop called, shopOpened value = " + string(shopOpened));
}

function openShop(shopToDisplay) {
	for (shop = 0; shop < array_length(shopToDisplay); ++ shop) {
		if (array_length(activeShop) < array_length(shopToDisplay)) {
			if (array_length(activeShop) = array_length(shopToDisplay)) {
				return;
			} else {
				array_insert(activeShop, shop, shopToDisplay[shop]);
			}
		show_debug_message("activeShop values = " + string(activeShop[shop]));
		}
	}
}