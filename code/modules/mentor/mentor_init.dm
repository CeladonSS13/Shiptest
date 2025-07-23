// Инициализация системы ментор тикетов
/proc/init_mentor_system()
    // Проверяем, что глобальный объект для тикетов создан
    if(!GLOB.mhelp_tickets)
        GLOB.mhelp_tickets = new /datum/mentor_help_tickets
    
    // Убедимся, что лог-файл для менторов существует
    if(!GLOB.world_mentor_log)
        GLOB.world_mentor_log = "data/logs/mentor.log"
        start_log(GLOB.world_mentor_log)

// Хук для инициализации системы ментор тикетов при запуске сервера
/proc/setup_mentor_system()
    init_mentor_system()

// Вызываем инициализацию при загрузке мира
/world/proc/setup_mentors()
    setup_mentor_system()

// Добавляем хук в существующий код инициализации
// Вызывается из world/New() в game/world.dm после load_mentors()