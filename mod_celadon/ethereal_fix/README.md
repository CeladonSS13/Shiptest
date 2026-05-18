
#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pull/1020

## Фикс крови у Эльзуосов

ID мода: CELADON_ETHEREAL_FIX

### Описание мода

Мод даёт Эльзуосам электрическую кровь, удаляет их тип крови, и добавляет пакет с электрической кровью

### Используется в других проектах?
- Нет

### Изменения *кор кода*

- REMOVE: `code\modules\mob\living\carbon\human\species_types\ethereal.dm`: `var/exotic_bloodtype`
- REMOVE: `code\modules\reagents\reagent_containers\blood_pack.dm`: `/obj/item/reagent_containers/blood/elzuose`
- EDIT: `code\modules\reagents\reagent_containers\blood_pack.dm`: `/obj/item/reagent_containers/blood/random/Initialize()`, `var/blood_type`
- REMOVE: `code\datums\blood_type.dm`: `/datum/blood_type/elzuose`

### Оверрайды

- Отсутствуют

### Дефайны

- Отсутствуют

### Используемые файлы, не содержащиеся в модпаке

- Отсутствуют

### Авторы

Quinal
