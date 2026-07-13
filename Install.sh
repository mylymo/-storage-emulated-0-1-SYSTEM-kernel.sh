#!/bin/bash

# ============================================
#   BLNE-LINUX SETUP v5.0
#   С выбором языка и часового пояса
# ============================================

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'
BOLD='\033[1m'

# Переменные
BLNE_VERSION="5.0"
INSTALL_DIR=""
LOG_FILE="$HOME/blne_install.log"
LANG_CHOICE=""
TIMEZONE="UTC"

# ============================================
# ФУНКЦИЯ: Логирование
# ============================================
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# ============================================
# ФУНКЦИЯ: Пауза
# ============================================
press_enter() {
    echo -e "\n${CYAN}▶ $MSG_PRESS_ENTER${NC}"
    read
    clear
}

# ============================================
# ШАГ 0: ВЫБОР ЯЗЫКА
# ============================================
step0_language() {
    clear
    echo -e "${PURPLE}"
    cat << "EOF"
    ██████╗ ██╗     ███╗   ██╗███████╗
    ██╔══██╗██║     ████╗  ██║██╔════╝
    ██████╔╝██║     ██╔██╗ ██║█████╗  
    ██╔══██╗██║     ██║╚██╗██║██╔══╝  
    ██████╔╝███████╗██║ ╚████║███████╗
    ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝
EOF
    echo -e "${NC}"
    echo -e "${BOLD}${GREEN}      MINI LINUX FOR TERMUX v${BLNE_VERSION}${NC}"
    echo ""
    echo -e "${WHITE}Select language / Выберите язык:${NC}"
    echo -e "${CYAN}1)${NC} Русский"
    echo -e "${CYAN}2)${NC} English"
    echo ""
    read -p "➜ " LANG_CHOICE
    
    case $LANG_CHOICE in
        1)
            LANG_CHOICE="ru"
            MSG_WELCOME="Добро пожаловать в мастер установки BLNE-LINUX!"
            MSG_LICENSE="ЛИЦЕНЗИОННОЕ СОГЛАШЕНИЕ"
            MSG_ACCEPT="Принимаете лицензионное соглашение?"
            MSG_YES="Да, принимаю"
            MSG_NO="Нет, выйти"
            MSG_DISK="ВЫБОР ДИСКА ДЛЯ УСТАНОВКИ"
            MSG_DISK_OPTIONS="Выберите диск для установки:"
            MSG_INTERNAL="Внутренняя память"
            MSG_HOME="Домашняя папка Termux"
            MSG_MANUAL="Ввести путь вручную"
            MSG_FOLDER_EXISTS="Папка уже существует!"
            MSG_UPDATE="Обновить систему"
            MSG_REINSTALL="Удалить и переустановить"
            MSG_INSTALLING="УСТАНОВКА BLNE-LINUX"
            MSG_DONE="Установка завершена!"
            MSG_FINISH="УСТАНОВКА BLNE-LINUX УСПЕШНО ЗАВЕРШЕНА!"
            MSG_START="Запуск"
            MSG_LOG="Лог"
            MSG_ALIAS="Алиас для быстрого запуска"
            MSG_THANKS="Спасибо за установку!"
            MSG_PRESS_ENTER="Нажмите ENTER для продолжения..."
            MSG_TIMEZONE="ВЫБОР ЧАСОВОГО ПОЯСА"
            MSG_TIMEZONE_SELECT="Выберите часовой пояс:"
            MSG_TIMEZONE_LIST="1) UTC, 2) Moscow, 3) Europe/Moscow, 4) Asia/Yekaterinburg, 5) America/New_York, 6) Europe/London, 7) Asia/Shanghai, 8) Asia/Tokyo, 9) Australia/Sydney, 10) Ввести вручную"
            ;;
        2)
            LANG_CHOICE="en"
            MSG_WELCOME="Welcome to BLNE-LINUX setup wizard!"
            MSG_LICENSE="LICENSE AGREEMENT"
            MSG_ACCEPT="Do you accept the license agreement?"
            MSG_YES="Yes, I accept"
            MSG_NO="No, exit"
            MSG_DISK="SELECT DISK FOR INSTALLATION"
            MSG_DISK_OPTIONS="Choose installation disk:"
            MSG_INTERNAL="Internal storage"
            MSG_HOME="Termux home folder"
            MSG_MANUAL="Enter path manually"
            MSG_FOLDER_EXISTS="Folder already exists!"
            MSG_UPDATE="Update system"
            MSG_REINSTALL="Remove and reinstall"
            MSG_INSTALLING="INSTALLING BLNE-LINUX"
            MSG_DONE="Installation complete!"
            MSG_FINISH="BLNE-LINUX INSTALLATION SUCCESSFUL!"
            MSG_START="Start"
            MSG_LOG="Log"
            MSG_ALIAS="Alias for quick launch"
            MSG_THANKS="Thanks for installing!"
            MSG_PRESS_ENTER="Press ENTER to continue..."
            MSG_TIMEZONE="SELECT TIMEZONE"
            MSG_TIMEZONE_SELECT="Choose your timezone:"
            MSG_TIMEZONE_LIST="1) UTC, 2) Moscow, 3) Europe/Moscow, 4) Asia/Yekaterinburg, 5) America/New_York, 6) Europe/London, 7) Asia/Shanghai, 8) Asia/Tokyo, 9) Australia/Sydney, 10) Enter manually"
            ;;
        *)
            echo -e "${RED}❌ Invalid choice. Default: English.${NC}"
            LANG_CHOICE="en"
            # default messages in English (можно оставить как есть, но проще скопировать)
            MSG_WELCOME="Welcome to BLNE-LINUX setup wizard!"
            MSG_LICENSE="LICENSE AGREEMENT"
            MSG_ACCEPT="Do you accept the license agreement?"
            MSG_YES="Yes, I accept"
            MSG_NO="No, exit"
            MSG_DISK="SELECT DISK FOR INSTALLATION"
            MSG_DISK_OPTIONS="Choose installation disk:"
            MSG_INTERNAL="Internal storage"
            MSG_HOME="Termux home folder"
            MSG_MANUAL="Enter path manually"
            MSG_FOLDER_EXISTS="Folder already exists!"
            MSG_UPDATE="Update system"
            MSG_REINSTALL="Remove and reinstall"
            MSG_INSTALLING="INSTALLING BLNE-LINUX"
            MSG_DONE="Installation complete!"
            MSG_FINISH="BLNE-LINUX INSTALLATION SUCCESSFUL!"
            MSG_START="Start"
            MSG_LOG="Log"
            MSG_ALIAS="Alias for quick launch"
            MSG_THANKS="Thanks for installing!"
            MSG_PRESS_ENTER="Press ENTER to continue..."
            MSG_TIMEZONE="SELECT TIMEZONE"
            MSG_TIMEZONE_SELECT="Choose your timezone:"
            MSG_TIMEZONE_LIST="1) UTC, 2) Moscow, 3) Europe/Moscow, 4) Asia/Yekaterinburg, 5) America/New_York, 6) Europe/London, 7) Asia/Shanghai, 8) Asia/Tokyo, 9) Australia/Sydney, 10) Enter manually"
            ;;
    esac
    
    log "Выбран язык: $LANG_CHOICE"
    clear
}

# ============================================
# ШАГ 0.5: ВЫБОР ЧАСОВОГО ПОЯСА
# ============================================
step0_timezone() {
    clear
    echo -e "${BOLD}${YELLOW}🕐 $MSG_TIMEZONE${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${WHITE}$MSG_TIMEZONE_SELECT${NC}"
    echo -e "$MSG_TIMEZONE_LIST"
    echo ""
    read -p "➜ " TZ_CHOICE
    
    case $TZ_CHOICE in
        1) TIMEZONE="UTC" ;;
        2) TIMEZONE="Europe/Moscow" ;;
        3) TIMEZONE="Europe/Moscow" ;;
        4) TIMEZONE="Asia/Yekaterinburg" ;;
        5) TIMEZONE="America/New_York" ;;
        6) TIMEZONE="Europe/London" ;;
        7) TIMEZONE="Asia/Shanghai" ;;
        8) TIMEZONE="Asia/Tokyo" ;;
        9) TIMEZONE="Australia/Sydney" ;;
        10) echo -e "${YELLOW}Введите часовой пояс (например Europe/Moscow):${NC}"; read TIMEZONE ;;
        *) TIMEZONE="UTC" ;;
    esac
    
    log "Выбран часовой пояс: $TIMEZONE"
    echo -e "${GREEN}✅ $MSG_DONE${NC}"
    sleep 1
    clear
}

# ============================================
# ШАГ 1: ПРИВЕТСТВИЕ
# ============================================
step1_welcome() {
    clear
    echo -e "${PURPLE}"
    cat << "EOF"
    ██████╗ ██╗     ███╗   ██╗███████╗
    ██╔══██╗██║     ████╗  ██║██╔════╝
    ██████╔╝██║     ██╔██╗ ██║█████╗  
    ██╔══██╗██║     ██║╚██╗██║██╔══╝  
    ██████╔╝███████╗██║ ╚████║███████╗
    ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝
EOF
    echo -e "${NC}"
    echo -e "${BOLD}${GREEN}      MINI LINUX FOR TERMUX v${BLNE_VERSION}${NC}"
    echo ""
    echo -e "${WHITE}$MSG_WELCOME${NC}"
    echo ""
    log "Запуск установки"
    press_enter
}

# ============================================
# ШАГ 2: ЛИЦЕНЗИЯ
# ============================================
step2_license() {
    clear
    echo -e "${BOLD}${YELLOW}📜 $MSG_LICENSE${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo ""
    if [[ "$LANG_CHOICE" == "ru" ]]; then
        echo -e "Вы соглашаетесь с тем, что:"
        echo -e "  1. ${RED}НЕ УДАЛЯЙТЕ СИСТЕМНЫЕ ФАЙЛЫ В ПАПКЕ BLNE-LINUX${NC}"
        echo -e "  2. Система работает полностью офлайн"
        echo -e "  3. Вы используете систему на свой страх и риск"
    else
        echo -e "You agree that:"
        echo -e "  1. ${RED}DO NOT DELETE SYSTEM FILES IN BLNE-LINUX FOLDER${NC}"
        echo -e "  2. System works completely offline"
        echo -e "  3. You use the system at your own risk"
    fi
    echo ""
    echo -e "${BOLD}${GREEN}$MSG_ACCEPT${NC}"
    echo -e "${CYAN}1)${NC} $MSG_YES"
    echo -e "${RED}2)${NC} $MSG_NO"
    read -p "➜ " LICENSE_CHOICE
    
    if [[ "$LICENSE_CHOICE" != "1" ]]; then
        log "Установка отменена"
        echo -e "${RED}❌ $MSG_NO${NC}"
        exit 0
    fi
    
    log "Лицензия принята"
    echo -e "${GREEN}✅ $MSG_YES${NC}"
    press_enter
}

# ============================================
# ШАГ 3: ВЫБОР ДИСКА
# ============================================
step3_disk() {
    clear
    echo -e "${BOLD}${YELLOW}💾 $MSG_DISK${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${WHITE}$MSG_DISK_OPTIONS${NC}"
    echo -e "${CYAN}1)${NC} $MSG_INTERNAL (${HOME}/storage/shared)"
    echo -e "${CYAN}2)${NC} $MSG_HOME (${HOME})"
    echo -e "${CYAN}3)${NC} $MSG_MANUAL"
    echo ""
    read -p "➜ " DISK_CHOICE
    
    case $DISK_CHOICE in
        1) INSTALL_DIR="$HOME/storage/shared/BLNE-LINUX" ;;
        2) INSTALL_DIR="$HOME/BLNE-LINUX" ;;
        3) read -p "➜ " INSTALL_DIR ;;
        *) INSTALL_DIR="$HOME/BLNE-LINUX" ;;
    esac
    
    log "Выбран диск: $INSTALL_DIR"
    echo -e "${GREEN}✅ $MSG_DONE: ${BOLD}$INSTALL_DIR${NC}"
    
    if [[ -d "$INSTALL_DIR" ]]; then
        echo -e "${YELLOW}⚠️ $MSG_FOLDER_EXISTS${NC}"
        echo -e "${GREEN}1)${NC} $MSG_UPDATE"
        echo -e "${RED}2)${NC} $MSG_REINSTALL"
        read -p "➜ " DIR_CHOICE
        
        case $DIR_CHOICE in
            1) log "Обновление" ;;
            2) log "Переустановка"; rm -rf "$INSTALL_DIR"; mkdir -p "$INSTALL_DIR" ;;
            *) exit 1 ;;
        esac
    else
        mkdir -p "$INSTALL_DIR"
        log "Папка создана"
    fi
    
    echo -e "${GREEN}✅ $MSG_DONE${NC}"
    press_enter
}

# ============================================
# ШАГ 4: УСТАНОВКА
# ============================================
step4_install() {
    clear
    echo -e "${BOLD}${GREEN}📦 $MSG_INSTALLING${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo ""
    log "Начало установки"
    
    mkdir -p "$INSTALL_DIR/APPS"
    mkdir -p "$INSTALL_DIR/SYSTEM/fs"
    
    # Ядро
    cat > "$INSTALL_DIR/SYSTEM/lib.sh" << 'EOF'
#!/bin/bash
print_header() {
    echo -e "\033[1;36m═══════════════════════════════════\033[0m"
    echo -e "\033[1;35m   BLNE-LINUX v5.0\033[0m"
    echo -e "\033[1;36m═══════════════════════════════════\033[0m"
}
run_app() {
    local app="$1"
    if [[ -f "$BLNE_HOME/APPS/$app.ebe" ]]; then
        source "$BLNE_HOME/APPS/$app.ebe"
    else
        echo -e "\033[1;31m❌ Приложение $app не найдено\033[0m"
    fi
}
EOF
    
    cat > "$INSTALL_DIR/SYSTEM/kernel.sh" << 'EOF'
#!/bin/bash
export BLNE_HOME="$(realpath $(dirname $0)/..)"
export PATH="$BLNE_HOME/SYSTEM:$PATH"
source "$BLNE_HOME/SYSTEM/lib.sh"
cd "$BLNE_HOME" || exit 1
if [[ ! -f "$BLNE_HOME/autoexec.ebe" ]]; then
    echo -e "\033[1;31m🚫 CRITICAL: autoexec.ebe отсутствует\033[0m"
    exit 1
fi
source "$BLNE_HOME/autoexec.ebe"
EOF
    chmod +x "$INSTALL_DIR/SYSTEM/kernel.sh"
    
    # autoexec
    cat > "$INSTALL_DIR/autoexec.ebe" << 'EOF'
#!/bin/bash
print_header
echo -e "\033[1;32m👋 Добро пожаловать в BLNE-LINUX!\033[0m"
echo ""
while true; do
    echo -ne "\033[1;32m[blne]\033[0m:\033[1;34m$(pwd | sed "s|$BLNE_HOME|~|g")\033[0m\$ "
    read -r cmd args
    case "$cmd" in
        time)   echo -e "\033[1;36m🕒 $(date '+%H:%M:%S')\033[0m" ;;
        calc)   echo "🧮 Калькулятор"; read -p "Выражение: " expr; echo "Результат: $(($expr 2>/dev/null || echo 'Ошибка'))" ;;
        editor) echo "📝 Редактор"; read -p "Имя файла: " fname; cat > "$BLNE_HOME/$fname"; echo "✅ Сохранено" ;;
        sysinfo) echo -e "\033[1;36m📊 Информация\033[0m"; echo "Память: $(free -m 2>/dev/null | grep Mem | awk '{print $3"/"$2" MB"}')"; echo "Диск: $(df -h $BLNE_HOME | awk 'NR==2 {print $3"/"$2}')" ;;
        help)   echo "Доступны: time, calc, editor, sysinfo, exit, ls, cd, mkdir, rm, touch, cat" ;;
        exit)   echo "👋 До свидания!"; break ;;
        ls)     ls -la --color=auto 2>/dev/null || ls -la ;;
        cd)     cd "$BLNE_HOME/${args:-.}" 2>/dev/null || echo "❌ Нет папки" ;;
        pwd)    pwd | sed "s|$BLNE_HOME|~|g" ;;
        mkdir)  mkdir -p "$BLNE_HOME/$args" ;;
        touch)  touch "$BLNE_HOME/$args" ;;
        rm)     rm -rf "$BLNE_HOME/$args" ;;
        mv)     mv "$BLNE_HOME/$1" "$BLNE_HOME/$2" 2>/dev/null || echo "❌ Ошибка" ;;
        cp)     cp -r "$BLNE_HOME/$1" "$BLNE_HOME/$2" 2>/dev/null || echo "❌ Ошибка" ;;
        cat)    cat "$BLNE_HOME/$args" 2>/dev/null || echo "❌ Файл не найден" ;;
        clear)  clear ;;
        *) echo "❌ Неизвестная команда: $cmd" ;;
    esac
done
EOF
    chmod +x "$INSTALL_DIR/autoexec.ebe"
    
    # Приложения
    cat > "$INSTALL_DIR/APPS/time.ebe" << 'EOF'
#!/bin/bash
echo -e "\033[1;36m🕒 $(date '+%H:%M:%S') | $(date '+%d.%m.%Y')\033[0m"
EOF
    
    cat > "$INSTALL_DIR/APPS/calc.ebe" << 'EOF'
#!/bin/bash
echo -e "\033[1;36m🧮 Калькулятор\033[0m"
read -p "Выражение: " expr
result=$(echo "$expr" | bc -l 2>/dev/null || echo "$((expr))" 2>/dev/null)
echo -e "\033[1;32m✅ $result\033[0m"
EOF
    
    cat > "$INSTALL_DIR/APPS/editor.ebe" << 'EOF'
#!/bin/bash
echo -e "\033[1;36m📝 Редактор\033[0m"
read -p "Имя файла: " fname
echo -e "\033[1;33mВведите текст (Ctrl+D для сохранения):\033[0m"
cat > "$BLNE_HOME/$fname"
echo -e "\033[1;32m✅ Сохранено: $fname\033[0m"
EOF
    
    cat > "$INSTALL_DIR/APPS/sysinfo.ebe" << 'EOF'
#!/bin/bash
echo -e "\033[1;36m═══════════════════════════════\033[0m"
echo -e "\033[1;35m   СИСТЕМНАЯ ИНФОРМАЦИЯ\033[0m"
echo -e "\033[1;36m═══════════════════════════════\033[0m"
echo -e "\033[1;33mПользователь:\033[0m $USER"
echo -e "\033[1;33mСистема:\033[0m BLNE-LINUX v5.0"
echo -e "\033[1;33mПамять:\033[0m $(free -m 2>/dev/null | grep Mem | awk '{print $3"/"$2" MB"}' || echo 'N/A')"
echo -e "\033[1;33mДиск:\033[0m $(df -h $BLNE_HOME 2>/dev/null | awk 'NR==2 {print $3"/"$2" ("$5")"}' || echo 'N/A')"
echo -e "\033[1;33mПроцессов:\033[0m $(ps aux 2>/dev/null | wc -l || echo 'N/A')"
echo -e "\033[1;33mДата:\033[0m $(date)"
EOF
    
    chmod +x "$INSTALL_DIR/APPS"/*.ebe 2>/dev/null
    
    # Загрузчик
    cat > "$INSTALL_DIR/start_blne.sh" << EOF
#!/bin/bash
# Загрузчик BLNE-LINUX
echo -e "\033[1;36m🚀 Запуск BLNE-LINUX...\033[0m"
echo -e "\033[1;33m📂 $INSTALL_DIR\033[0m"
exec "$INSTALL_DIR/SYSTEM/kernel.sh"
EOF
    chmod +x "$INSTALL_DIR/start_blne.sh"
    
    # Сохраняем конфиг с языком и часовым поясом
    echo "LANG=$LANG_CHOICE" > "$INSTALL_DIR/.config"
    echo "TIMEZONE=$TIMEZONE" >> "$INSTALL_DIR/.config"
    
    # Кэш
    echo "BLNE-LINUX v5.0" > "$INSTALL_DIR/.version"
    echo "Установлено: $(date)" > "$INSTALL_DIR/.install_date"
    
    # README
    cat > "$INSTALL_DIR/README.txt" << EOF
BLNE-LINUX v5.0
Установлено: $(date)
Директория: $INSTALL_DIR
Язык: $LANG_CHOICE
Часовой пояс: $TIMEZONE

Запуск: ./start_blne.sh
EOF
    
    log "Установка завершена"
    echo -e "${GREEN}✅ $MSG_DONE${NC}"
    press_enter
}

# ============================================
# ШАГ 5: ФИНИШ
# ============================================
step5_finish() {
    clear
    echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC} ${BOLD}🎉 $MSG_FINISH${NC} ${GREEN}║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BOLD}${WHITE}📊 $MSG_DISK:${NC}"
    echo -e "${BLUE}─────────────────────────────────────${NC}"
    echo -e "${CYAN}📁 $MSG_START:${NC} $INSTALL_DIR"
    echo -e "${CYAN}🚀 $MSG_START:${NC} cd \"$INSTALL_DIR\" && ./start_blne.sh"
    echo -e "${CYAN}📋 $MSG_LOG:${NC} $LOG_FILE"
    echo -e "${CYAN}🌍 Язык:${NC} $LANG_CHOICE"
    echo -e "${CYAN}🕐 Часовой пояс:${NC} $TIMEZONE"
    echo ""
    echo -e "${BOLD}${GREEN}▶ $MSG_START:${NC}"
    echo -e "  ${BOLD}cd \"$INSTALL_DIR\" && ./start_blne.sh${NC}"
    echo ""
    echo -e "${BOLD}${PURPLE}💡 $MSG_ALIAS:${NC}"
    echo -e "  ${BOLD}echo 'alias blne=\"$INSTALL_DIR/start_blne.sh\"' >> ~/.bashrc${NC}"
    echo -e "  ${BOLD}source ~/.bashrc${NC}"
    echo ""
    echo -e "${GREEN}❤️ $MSG_THANKS${NC}"
    echo ""
    log "Показан финишный экран"
    read -p "Нажмите ENTER для выхода..."
}

# ============================================
# ГЛАВНАЯ
# ============================================
main() {
    step0_language
    step0_timezone
    step1_welcome
    step2_license
    step3_disk
    step4_install
    step5_finish
}

main
