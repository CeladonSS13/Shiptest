// коммит Delyasha Ребаланс патронов 68f5c5ecca9d26a210e35e644884090912dafe1b
/obj/projectile/bullet/a357
	damage = 45
	armour_penetration = 10 	//Ребаланс по предложке, для усиления револьверов

/obj/projectile/bullet/a44roum
	damage = 35

/obj/projectile/bullet/a44roum/hp
	damage = 50 	//Изменения по предложке, общее увеличение урона у .44 и HP на 10

// Бафф .45-70.
// До этого более крупный калибр имеет меньше ап и такой же урон чем в разы мелкий .357?
/obj/projectile/bullet/a4570
	damage = 50 // 3 выстрела для крита против 50 брони. 4 выстрела для крита против 6 брони
	armour_penetration = 20

/obj/projectile/bullet/a4570/match
	damage = 45 // крит с 4 выстрелов в 6. Не имеет смысла на деле кроме как рикошетов, которые не всегда прокают.
	armour_penetration = 30
	ricochets_max = 8
	ricochet_incidence_leeway = 0 // Всегда рикошетит. С меня Эвандель взял обещание самому это починить

/obj/projectile/bullet/a4570/hp
	damage = 70 // 3 выстрела для крита против 40 брони. 4 выстрела для крита против 50 брони.
	armour_penetration = -10 // Имо в разы хуже чем обычный,
							 // т.к. его единственное преимущество, так это крит с 2 против 20 брони. Любая броня дальше убивается с 3.
