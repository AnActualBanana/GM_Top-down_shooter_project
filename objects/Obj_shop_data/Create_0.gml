#macro SHOP_INVENTORY 20
/// @description Variables/Arrays
// You can write your code in this editor

itemName = 0;
itemPrice = 0;
itemAmount = 0;
itemMinAmount = 0;
itemMaxAmount = 0;
itemRestocks = 0;
itemBuyLimit = 0;
stockAmount = 0;
infiniteStock = 0;
shopOpened = 0;
shopToDisplay = 0;
rowLength = 6;

/*variables for both of the arrays:
    *name*    *price*     *#received* *undecided*    *undecided*    *restock*     *LimitToBuy*
    itemName, itemPrice, itemAmount, itemMinAmount, itemMaxAmount, itemRestocks, itemBuyLimit*/
weaponShopData = [
    [Spr_handgun_ammo_drop, 25, 0, 0, 0, 0]
    /*["Spr_shotgun_ammo_drop", 25, 0, 0, 0, 0, 0],
    ["Spr_smg_ammo_drop", 25, 0, 0, 0, 0, 0],
    ["Spr_small_grenade", 75, 0, 0, 0, 0, 0],
    ["Spr_large_grenade", 150, 0, 0, 0, 0, 0],
    ["Spr_sticky_grenade", 125, 0, 0, 0, 0, 0],
    ["Spr_lure_grenade", 150, 0, 0, 0, 0, 0],
    ["Spr_zombie_scent", 350, 0, 0, 0, 0, 0],
    ["Spr_concussion_grenade", 100, 0, 0, 0, 0, 0]*/
];

consumableShopData = [
    ["Spr_health_pack_small_drop", 45, 0, 0, 0, 0],
    ["Spr_health_pack_large", 90, 0, 0, 0, 0],
    ["Spr_health_boost_small", 125, 0, 0, 0, 0],
    ["Spr_health_boost_large", 175, 0, 0, 0, 0],
    ["Spr_stamina_boost_small", 125, 0, 0, 0, 0],
    ["Spr_stamina_boost_large", 175, 0, 0, 0, 0],
    ["Spr_group_health_pack_small", 150, 0, 0, 0, 0],
    ["Spr_group_health_pack_large", 250, 0, 0, 0, 0],
	["Spr_quick_revive", 500, 0, 0, 0, 0]
];

//Empty array to house all the data for display per instance
activeShop = [
];
