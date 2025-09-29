import json
import os
import re
from pathlib import Path

# Пути к папкам
configs_path = Path("F:/GitHubRepo/MrCat/_maps/_mod_celadon/configs")
outfits_path = Path("F:/GitHubRepo/MrCat/mod_celadon/outfit/code")
other_file = outfits_path / "other.dm"

# Маппинг фракций к папкам
faction_mapping = {
    "/datum/faction/elysium": "elysium",
    "/datum/faction/independent": "independent", 
    "/datum/faction/nt": "nanotrasen",
    "/datum/faction/inteq": "inteq",
    "/datum/faction/solfed": "solfed",
    "/datum/faction/solgov": "solfed",
    "/datum/faction/syndicate": "syndicate",
    "/datum/faction/pirate": "pirate"
}

# Маппинг названий ролей к job_icon
job_icon_mapping = {
    # Капитаны
    "captain": "captain",
    "caid": "captain",
    "carrier captain": "captain",
    "intelligence officer": "captain",
    
    # Главы отделов
    "head of personnel": "headofpersonnel",
    "hop": "headofpersonnel",
    
    "head of security": "headofsecurity", 
    "hos": "headofsecurity",
    "security director": "headofsecurity",
    "response lieutenant": "headofsecurity",
    
    "chief engineer": "chiefengineer",
    "ce": "chiefengineer",
    "engineering director": "chiefengineer",
    
    "chief medical officer": "chiefmedicalofficer",
    "cmo": "chiefmedicalofficer", 
    "medical director": "chiefmedicalofficer",
    
    "research director": "researchdirector",
    "rd": "researchdirector",
    "science director": "researchdirector",
    
    "quartermaster": "quartermaster",
    "qm": "quartermaster",
    
    # Безопасность
    "security officer": "securityofficer",
    "security": "securityofficer",
    "mukatell": "securityofficer",
    "response combatant": "securityofficer",
    "security operative": "securityofficer",
    
    "warden": "warden",
    "detective": "detective",
    
    # Инженеры
    "engineer": "stationengineer",
    "engineering technician": "stationengineer",
    "response engineer": "stationengineer",
    "carrier engineer": "stationengineer",
    
    "atmospheric technician": "atmospherictechnician",
    "atmos": "atmospherictechnician",
    
    # Медицина
    "medical doctor": "medicaldoctor",
    "doctor": "medicaldoctor",
    "response physician": "medicaldoctor",
    "medical technician": "medicaldoctor",
    
    "paramedic": "paramedic",
    "chemist": "chemist",
    "geneticist": "geneticist",
    "virologist": "virologist",
    "psychologist": "psychologist",
    "brig phys": "medicaldoctor",
    
    # Наука
    "scientist": "scientist",
    "roboticist": "roboticist",
    
    # Карго
    "cargo tech": "cargotechnician",
    "cargo technician": "cargotechnician",
    
    # Сервис
    "assistant": "assistant",
    "ahisa`i": "assistant",
    "carrier deckhand": "assistant",
    "loner": "assistant",
    
    "janitor": "janitor",
    "custodial operative": "janitor",
    "lp janitorial specialist": "janitor",
    
    "cook": "cook",
    "chef": "cook",
    
    "bartender": "bartender",
    "botanist": "botanist",
    "curator": "curator",
    "chaplain": "chaplain",
    "lawyer": "lawyer",
    "dispatcher": "lawyer",
    
    # Шахтеры
    "miner": "shaftminer",
    "shaft miner": "shaftminer",
    
    # Специальные роли
    "mime": "mime",
    "clown": "clown",
    "prisoner": "prisoner",
    "patient": "assistant",
    "pilot": "assistant",
    "mech_pilot": "assistant",
    "waiter": "assistant",
    "artist": "assistant",
    "dungeonmaster": "assistant",
    "manager": "assistant"
}

def get_job_icon(job_name):
    """Получить job_icon для роли"""
    job_lower = job_name.lower().strip()
    
    # Прямое соответствие
    if job_lower in job_icon_mapping:
        return job_icon_mapping[job_lower]
    
    # Поиск по частичному совпадению
    for key, value in job_icon_mapping.items():
        if key in job_lower or job_lower in key:
            return value
    
    # Специальные случаи
    if "captain" in job_lower or "caid" in job_lower:
        return "captain"
    elif "security" in job_lower or "officer" in job_lower:
        return "securityofficer"
    elif "engineer" in job_lower:
        return "stationengineer"
    elif "doctor" in job_lower or "medic" in job_lower:
        return "medicaldoctor"
    elif "scientist" in job_lower:
        return "scientist"
    elif "miner" in job_lower:
        return "shaftminer"
    
    return "assistant"

def find_outfit_files(faction_folder):
    """Найти все .dm файлы в папке фракции"""
    faction_path = outfits_path / faction_folder
    if not faction_path.exists():
        return []
    
    dm_files = []
    for root, dirs, files in os.walk(faction_path):
        for file in files:
            if file.endswith('.dm'):
                dm_files.append(Path(root) / file)
    return dm_files

def update_outfit_file(file_path, outfit_updates):
    """Обновить файл аутфита, добавив job_icon"""
    if not file_path.exists():
        return
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    updated = False
    for outfit_path, job_icon in outfit_updates.items():
        # Ищем определение аутфита
        pattern = rf'(/datum/outfit{re.escape(outfit_path)}[^\n]*\n(?:[^\n/].*\n)*)'
        match = re.search(pattern, content, re.MULTILINE)
        
        if match:
            outfit_block = match.group(1)
            # Проверяем, есть ли уже job_icon
            if 'job_icon' not in outfit_block:
                # Добавляем job_icon после первой строки
                lines = outfit_block.split('\n')
                if len(lines) > 1:
                    lines.insert(1, f'\tjob_icon = "{job_icon}"')
                    new_block = '\n'.join(lines)
                    content = content.replace(outfit_block, new_block)
                    updated = True
    
    if updated:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Обновлен файл: {file_path}")

def main():
    missing_outfits = []
    
    # Обрабатываем все конфиги
    for config_file in configs_path.glob("*.json"):
        print(f"Обрабатываем: {config_file.name}")
        
        with open(config_file, 'r', encoding='utf-8') as f:
            config = json.load(f)
        
        faction = config.get("faction", "")
        faction_folder = faction_mapping.get(faction)
        
        if not faction_folder:
            print(f"  Неизвестная фракция: {faction}")
            continue
        
        job_slots = config.get("job_slots", {})
        outfit_updates = {}
        
        for job_name, job_data in job_slots.items():
            outfit_path = job_data.get("outfit", "")
            if not outfit_path:
                continue
            
            # Убираем /datum/outfit из пути
            clean_path = outfit_path.replace("/datum/outfit", "")
            job_icon = get_job_icon(job_name)
            
            outfit_updates[clean_path] = job_icon
        
        # Ищем файлы аутфитов для этой фракции
        outfit_files = find_outfit_files(faction_folder)
        
        if not outfit_files:
            print(f"  Не найдены файлы аутфитов для фракции: {faction_folder}")
            for outfit_path, job_icon in outfit_updates.items():
                missing_outfits.append(f"/datum/outfit{outfit_path} - job_icon = \"{job_icon}\"")
            continue
        
        # Обновляем файлы
        found_outfits = set()
        for outfit_file in outfit_files:
            with open(outfit_file, 'r', encoding='utf-8') as f:
                file_content = f.read()
            
            file_updates = {}
            for outfit_path, job_icon in outfit_updates.items():
                if f"/datum/outfit{outfit_path}" in file_content:
                    file_updates[outfit_path] = job_icon
                    found_outfits.add(outfit_path)
            
            if file_updates:
                update_outfit_file(outfit_file, file_updates)
        
        # Добавляем не найденные аутфиты в список
        for outfit_path, job_icon in outfit_updates.items():
            if outfit_path not in found_outfits:
                missing_outfits.append(f"/datum/outfit{outfit_path} - job_icon = \"{job_icon}\"")
    
    # Записываем недостающие аутфиты в other.dm
    if missing_outfits:
        with open(other_file, 'w', encoding='utf-8') as f:
            f.write("// Аутфиты, не найденные в модулях фракций\n")
            f.write("// Требуется добавить job_icon к следующим аутфитам:\n\n")
            for outfit in missing_outfits:
                f.write(f"// {outfit}\n")
        
        print(f"\nНе найдено {len(missing_outfits)} аутфитов. Список записан в {other_file}")

if __name__ == "__main__":
    main()