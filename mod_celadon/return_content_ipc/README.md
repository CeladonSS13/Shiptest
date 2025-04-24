## CELADON_RETURN_CONTENT_IPC

ID мода: CELADON_RETURN_CONTENT_IPC

### Описание мода

Этот модпак будет служить лишь записью о том, что где в кор коде было удалено и возвращено на старый код. 
Этот модпак откатывает ревертит изменения офов.


### Используется в других проектах?
- Нет

### Изменения *кор кода*

ОТКАТ ПР https://github.com/shiptest-ss13/Shiptest/pull/3589 - ИПС аугментация

- REMOVE: `code/datums/components/crafting/recipes/misc.dm` : `/datum/crafting_recipe/replacement_structure`
- REMOVE: `code/game/objects/items/devices/scanners.dm` : ``
- EDIT: `code/game/objects/items/devices/scanners.dm` : `/obj/item/stack/medical/proc/heal_carbon(mob/living/carbon/C, mob/user, brute, burn, integrity = 0)` -> `/obj/item/stack/medical/proc/heal_carbon(mob/living/carbon/C, mob/user, brute, burn)`
- EDIT: `code/game/objects/items/devices/scanners.dm` : `if(!heals_inorganic && !IS_ORGANIC_LIMB(affecting))` -> `if(!IS_ORGANIC_LIMB(affecting)) //Limb must be organic to be healed - RR`
- EDIT: `code/game/objects/items/tools/weldingtool.dm` : `item_heal_robotic(target, user, brute_heal = 15, burn_heal = 0, integrity_loss = 5)` -> `item_heal_robotic(target, user, brute_heal = 15, burn_heal = 0)`
- EDIT: `code/modules/mob/living/carbon/damage_procs.dm` : `/mob/living/carbon/proc/get_damaged_bodyparts(brute = FALSE, burn = FALSE, stamina = FALSE, status, ignore_integrity = FALSE)` -> `/mob/living/carbon/proc/get_damaged_bodyparts(brute = FALSE, burn = FALSE, stamina = FALSE, status)`
- REMOVE: `code/modules/mob/living/carbon/human/examine.dm` : `if(BP.uses_integrity && (BP.integrity_loss-BP.integrity_ignored) > 0)`
- REMOVE: `code/modules/mob/living/carbon/human/human.dm` : `if (BP.uses_integrity) // Same, but for integrity`
- REMOVE: `code/modules/mob/living/damage_procs.dm` : `/mob/living/proc/heal_overall_integrity(amount, required_status, updating_health = TRUE)`
- REMOVE: `code/modules/mob/living/living.dm` : `heal_overall_integrity(INFINITY, null, TRUE) //heal all limb integrity, so that you can...`
- EDIT: `code/modules/mob/mob_helpers.dm` : `/proc/item_heal_robotic(mob/living/carbon/human/H, mob/user, brute_heal, burn_heal, integrity_loss=0)` -> `/proc/item_heal_robotic(mob/living/carbon/human/H, mob/user, brute_heal, burn_heal)`
- EDIT: `code/modules/power/cable.dm` : `if(item_heal_robotic(H, user, 0, 15, integrity_loss = 5))` -> `if(item_heal_robotic(H, user, 0, 15))`
- EDIT: `code/modules/projectiles/guns/energy/special.dm` : `item_heal_robotic(target, user, brute_heal = 15, burn_heal = 0)` -> `item_heal_robotic(target, user, brute_heal = 15, burn_heal = 0, integrity_loss = 5)`
- REMOVE: `code/modules/surgery/bodyparts/bodyparts.dm` : `много всего`
- REMOVE: `code/modules/surgery/bodyparts/robot_bodyparts.dm` : `uses_integrity = TRUE`
- REMOVE: `code/modules/surgery/bodyparts/species_parts/ipc_bodyparts.dm` : `uses_integrity = TRUE`
- REMOVE: `code/modules/surgery/mechanical.dm` : `/datum/surgery_step/repair_structure`
- REMOVE: `code/game/objects/items/devices/scanners.dm` : `var/list/damaged = C.get_damaged_bodyparts(1,1,ignore_integrity=TRUE)` -> `var/list/damaged = C.get_damaged_bodyparts(1,1)`


### Оверрайды

- Отсутствуют


### Дефайны

- Отсутствуют


### Используемые файлы, не содержащиеся в модпаке

- Отсутствуют


### Авторы

MrCat15352
