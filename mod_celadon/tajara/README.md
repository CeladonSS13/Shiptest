

#### Список PRов:

- https://github.com/MysticalFaceLesS/Shiptest/pulls/429
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

## Раса - Таяры

ID мода: TAJARA

### Описание мода

Таяраны - это [Данные удалены]. Они [Данные удалены]. И вообще [Данные удалены].
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*

- `code/__HELPERS/global_lists.dm`:
  - `/proc/make_datum_references_lists()`
- `code/__HELPERS/mobs.dm`:
  - `/proc/random_features()`
  - `/proc/random_hairstyle()`
  - `/proc/random_facial_hairstyle()`
- `code/__HELPERS/names.dm`:
  - `/proc/generate_code_phrase()`
- `code/_globalvars/bitfields.dm`:
  - `DEFINE_BITFIELD(bodytype, list(...))`
- `code/controllers/subsystem/traumas.dm`:
  - `/datum/controller/subsystem/traumas/Initialize()`
- `code/datums/components/tackle.dm`:
  - `/datum/component/tackler/proc/rollTackle()`
- `code/game/machinery/scan_gate.dm`:
  - `/obj/machinery/scanner_gate/proc/perform_scan()`
- `code/game/objects/structures/mirror.dm`:
  - `/obj/structure/mirror/magic/attack_hand()`
- `code/modules/admin/create_mob.dm`:
  - `/proc/randomize_human()`
- `code/modules/antagonists/devil/devil.dm`:
  - `/proc/randomdevilban()`
- `code/modules/awaymissions/corpse.dm`:
  - `/obj/effect/mob_spawn/human/equip()`
- `code/modules/client/preferences.dm`:
  - `/datum/preferences/proc/ShowChoices()`
  - `/datum/preferences/proc/process_link()`
  - `/datum/preferences/proc/copy_to()`
- `code/modules/client/preferences_savefile.dm`:
  - `/datum/preferences/proc/load_character()`
  - `/datum/preferences/proc/save_character()`
- `code/modules/clothing/head/_head.dm`:
  - `/obj/item/clothing/head/var/supports_variations`
- `code/modules/clothing/masks/_masks.dm`:
  - `/obj/item/clothing/mask/var/supports_variations`
- `code/modules/clothing/spacesuits/hardsuit.dm`:
  - `/obj/item/clothing/suit/space/hardsuit/engine/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/mining/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/syndi/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/syndi/ramzi/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/syndi/elite/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/syndi/cybersun/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/syndi/cybersun/paramed/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/syndi/inteq/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/medical/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/rd/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/security/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/security/hos/var/supports_variations`
  - `/obj/item/clothing/head/helmet/space/hardsuit/security/independent/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/security/independent/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/security/independent/inteq/var/supports_variations`
  - `/obj/item/clothing/suit/space/hardsuit/solgov/var/supports_variations`
- `code/modules/clothing/suits/_suits.dm`:
  - `/obj/item/clothing/suit/var/supports_variations`
- `code/modules/mob/living/carbon/human/consistent_human.dm`:
  - `/mob/living/carbon/human/dummy/consistent/proc/seeded_randomization()`
- `code/modules/mob/living/carbon/human/species.dm`:
  - `/datum/species/proc/handle_hair()`
  - `/datum/species/proc/handle_mutant_bodyparts()`
  - `/datum/species/proc/is_wagging_tail()`
- `code/modules/mob/living/carbon/human/update_icons.dm`:
  - `/mob/living/carbon/human/update_inv_head()`
  - `/mob/living/carbon/human/update_inv_wear_suit()`
  - `/mob/living/carbon/human/update_inv_wear_mask()`
- `code/modules/overmap/objects/outpost/outpost.dm`:
  - `/datum/overmap/outpost/proc/gen_outpost_name()`
- `code/modules/research/designs/limbgrower_designs.dm`:
  - `/datum/design/leftarm/var/category`
  - `/datum/design/rightarm/var/category`
  - `/datum/design/leftleg/var/category`
  - `/datum/design/rightleg/var/category`
- `code/modules/surgery/bodyparts/bodyparts.dm`:
  - `/obj/item/bodypart/proc/update_limb()`
  - `/obj/item/bodypart/proc/get_limb_icon()`

### Оверрайды

- `mod_celadon/tajara/code/preferences/preferences.dm`:
  - `/datum/preferences/New()`
  - `/datum/preferences/process_link()`
  - `/datum/preferences/random_character()`
- `mod_celadon/tajara/code/species/species.dm`:
  - `/datum/species/start_wagging_tail()`
  - `/datum/species/stop_wagging_tail()`
- `mod_celadon/tajara/code/tweaks/crates.dm`:
  - `/obj/structure/closet/crate/freezer/surplus_limbs/PopulateContents()`
- `mod_celadon/tajara/code/tweaks/limbgrower.dm`:
  - `/obj/machinery/limbgrower/Initialize()`
- `mod_celadon/tajara/code/tweaks/nanite_program.dm`:
  - `/datum/nanite_program/sensor/species/New()`

### Дефайны

- `code/__DEFINES/~mod_celadon/tajara.dm`:
  - `DNA_SKIN_TONE_NOSE_BLOCK`
  - `SKINNOSECOLORS`
  - `SKINTAJARACOLORS`
  - `BAN_HURTTAJARA`
  - `istajara(A)`
  - `SPECIES_TAJARA`
  - `RANDOM_SKIN_TONE_NOSE`
  - `RANDOM_SKIN_TONE_TAJARA`
  - `TAJARA_MASK_PATH`
  - `TAJARA_HEAD_PATH`
  - `TAJARA_SUIT_PATH`
- `code/__DEFINES/inventory.dm`:
  - `TAJARA_VARIATION`
- `code/__DEFINES/mobs.dm`:
  - `BODYTYPE_TAJARA`

### Используемые файлы, не содержащиеся в модпаке

- `icons/mob/augmentation/augments_lizard.dmi`
- `mod_celadon/_storage_icons/icons`
- `mod_celadon/_storage_icons/icons/tajara`
- `mod_celadon/_storage_sounds/sound`

### Авторы:

DuckNeMyDuck, MrCat15352, SuhEugene
