#Sadece Bir Animasyon / Just An Animation

clear && echo •.... && sleep 0.2 && clear && echo .•... && sleep 0.2 && clear && echo ..•.. && sleep 0.2 && clear && echo ...•. && sleep 0.2 && clear && echo ....• && sleep 0.1

#================================================================================================================================================================================

# BbP Ana Dizin Yapılandırması / Core Directory Setup
BBP_DIR="$HOME/.zsh_bbp"
mkdir -p "$BBP_DIR/plugins"

CONFIG_FILE="$BBP_DIR/lang"
SEC_FILE="$BBP_DIR/sec_files"
HISTFILE="$BBP_DIR/history"

touch "$SEC_FILE"

#====================================================================
# Dil Seçimi & Giriş Ekranı / Language & Welcome Screen

clear

if [ ! -f "$CONFIG_FILE" ]; then
    print -P "%F{39}Language / Dil Seçimi:%f"
    echo "  [E] English"
    echo "  [T] Türkçe"
    read -k 1 "user_lang?[E/T]: "
    echo ""
    case "$user_lang" in
        [Tt]*) echo "TR" > "$CONFIG_FILE" ;;
        *)     echo "ENG" > "$CONFIG_FILE" ;;
    esac
    clear
fi

# Güvenli ve optimize edilmiş dil okuma
SELECTED_LANG="ENG"
if [ -r "$CONFIG_FILE" ]; then
    SELECTED_LANG="$(<"$CONFIG_FILE")"
fi

print -P "%F{39}"
echo "  ____  _     ____  "
echo " | __ )| |__ |  _ \ "
echo " |  _ \| '_ \| |_) |  Basic"
echo " | |_) | |_) |  __/  But"
echo " |____/|____/|_|      Pretty"
print -P "%f"
print -P "%F{179}Version: 1.0 %f\n"

# Eklentiler yüklü mü kontrolü
PLUGINS_INSTALLED=0
if [ -d "$BBP_DIR/plugins/zsh-autosuggestions" ] && [ -d "$BBP_DIR/plugins/zsh-syntax-highlighting" ]; then
    PLUGINS_INSTALLED=1
fi

if [ "$SELECTED_LANG" = "TR" ]; then
    print -P "%F{39}Terminale Hoşgeldin!%f"
    print -P "%F{242}İndirilen/Kurulanları görmek için: %F{135}plugins-installed-by-bbp%f"
    if [ $PLUGINS_INSTALLED -eq 0 ]; then
        print -P "%F{242}Otomatik tamamlama ve renklendirme eklentileri için: %F{135}kur%f"
        print -P "%F{242}(Eklentisiz de sorunsuz çalışır, merak etme.)%f"
    fi
    print -P "%F{242}Özel komutlar için: %F{135}bbp spc%f"
    print -P "%F{242}Dili değiştirmek için: %F{135}lang-reset%f\n"
    print -P "%F{211}(Bu, ilk sürüm. Prompt yeri hafiften gecikmeli olabilir(belki 1-2 hata da bulabilirsiniz). Eğer ilgi görürse, C++ ile version 2.0 yapacağım ve SecFF (Security Folder & File) sistemini ayrı bir proje yapmayı planlıyorum.)%f\n"

else
    print -P "%F{39}Welcome to Terminal!%f"
    print -P "%F{242}To see downloaded/installed plugins: %F{135}plugins-installed-by-bbp%f"
    if [ $PLUGINS_INSTALLED -eq 0 ]; then
        print -P "%F{242}For auto-suggestions and syntax-highlighting plugins: %F{135}setup%f"
        print -P "%F{242}(zsh-bbp will still work without plugins, don't worry.)%f"
    fi
    print -P "%F{242}For special commands: %F{135}bbp spc%f"
    print -P "%F{242}To change language: %F{135}lang-reset%f\n"
    print -P "%F{211}(This is the first version. The prompt might be slightly delayed(maybe you can even find 1 or 2 errors). If it gets enough interest, I will build version 2.0 with C++ And I plan to develop the SecFF (Security Folder & File) system as a separate project.)%f\n"

fi

#====================================================================
# İsteğe Bağlı Eklenti Kurma & Listeleme / Plugins Setup & Inspector

function _install_zsh_plugins() {
    echo "📦 Eklentiler indiriliyor... (Eng: Plugins are downloading...)"
    mkdir -p "$BBP_DIR/plugins"
    [ ! -d "$BBP_DIR/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$BBP_DIR/plugins/zsh-autosuggestions"
    [ ! -d "$BBP_DIR/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$BBP_DIR/plugins/zsh-syntax-highlighting"
    echo "🎉 Kurulum tamamlandı! Yükleniyor... (Eng: Setup completed! Loading...)"
    # Oturumu üst üste bindirmemek için güvenli kaynak yüklemesi
    [ -f "$BBP_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$BBP_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    [ -f "$BBP_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$BBP_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
}

function plugins-installed-by-bbp() {
    print -P "\n%F{39}═══ 📦 BbP Eklenti Durumu / Plugin Status ═══%f\n"

    local auto_status="❌ Yüklü Değil / Not Installed"
    local syntax_status="❌ Yüklü Değil / Not Installed"

    [ -d "$BBP_DIR/plugins/zsh-autosuggestions" ] && auto_status="%F{46}✔ Yüklü / Installed%f"
    [ -d "$BBP_DIR/plugins/zsh-syntax-highlighting" ] && syntax_status="%F{46}✔ Yüklü / Installed%f"

    if [ "$SELECTED_LANG" = "TR" ]; then
        print -P "%F{214}1. zsh-autosuggestions:%f ${auto_status}"
        print -P "%F{214}2. zsh-syntax-highlighting:%f ${syntax_status}"
        print -P "\n%F{135}• Autocd kuruldu.%f %F{242}Bir klasöre başına cd yazmadan sadece ismini yazarak girebilirsiniz.%f"
        print -P "%F{135}• Geçmiş ayarları,%f %F{242}sizin yerinize otomatik olarak yapıldı.%f"
    else
        print -P "%F{214}1. zsh-autosuggestions:%f ${auto_status}"
        print -P "%F{214}2. zsh-syntax-highlighting:%f ${syntax_status}"
        print -P "\n%F{135}• Autocd installed.%f %F{242}You can enter a folder by simply typing its name without 'cd'.%f"
        print -P "%F{135}• History settings%f %F{242}have been automatically configured for you.%f"
    fi
    print -P "\n%F{24}══════════════════════════════════════════════%f\n"
}

alias kur='_install_zsh_plugins'
alias setup='_install_zsh_plugins'
alias lang-reset='rm -f "$CONFIG_FILE" && echo "Dil sıfırlandı! Terminali yeniden başlatın('zsh' yazman yeterli). / Language reset! Restart terminal(write 'zsh' to terminal)."'

# Eklentiler YÜKLÜYSE çalıştır
[ -f "$BBP_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$BBP_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "$BBP_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$BBP_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

#====================================================================
# BbP Özel Güvenlik Sistemi (sec/unsec) / Security System

function sec() {
    if [ -z "$1" ]; then
        [ "$SELECTED_LANG" = "TR" ] && echo "Kullanım: sec <dosya_adı>" || echo "Usage: sec <filename>"
        return 1
    fi

    if [ ! -e "$1" ]; then
        if [ "$SELECTED_LANG" = "TR" ]; then
            print -P "%F{196}⚠️ '$1' adında bir dosya veya klasör bulunamadı!%f"
        else
            print -P "%F{196}⚠️ File or folder '$1' not found!%f"
        fi
        return 1
    fi

    local target=$(realpath "$1")

    if ! grep -qx "$target" "$SEC_FILE"; then
        echo "$target" >> "$SEC_FILE"
        if [ "$SELECTED_LANG" = "TR" ]; then
            print -P "%F{46}🛡 '$1' başarıyla korumaya alındı!%f"
        else
            print -P "%F{46}🛡 '$1' successfully protected!%f"
        fi
    else
        if [ "$SELECTED_LANG" = "TR" ]; then
            print -P "%F{220}⚠️ '$1' zaten koruma altında.%f"
        else
            print -P "%F{220}⚠️ '$1' is already protected.%f"
        fi
    fi
}

function unsec() {
    if [ -z "$1" ]; then
        [ "$SELECTED_LANG" = "TR" ] && echo "Kullanım: unsec <dosya_adı>" || echo "Usage: unsec <filename>"
        return 1
    fi

    local target=$(realpath "$1" 2>/dev/null || echo "$1")

    if grep -qx "$target" "$SEC_FILE"; then
        grep -vxF "$target" "$SEC_FILE" > "$SEC_FILE.tmp" && command mv -f "$SEC_FILE.tmp" "$SEC_FILE" 2>/dev/null || sed -i "\|^$target$|d" "$SEC_FILE"

        if [ "$SELECTED_LANG" = "TR" ]; then
            print -P "%F{46}🔓 '$1' koruması kaldırıldı.%f"
        else
            print -P "%F{46}🔓 Protection removed for '$1'.%f"
        fi
    else
        if [ "$SELECTED_LANG" = "TR" ]; then
            print -P "%F{220}⚠️ '$1' zaten koruma altında değil.%f"
        else
            print -P "%F{220}⚠️ '$1' is not protected.%f"
        fi
    fi
}

function rm() {
    local is_protected=0
    local protected_file=""

    for arg in "$@"; do
        if [ -e "$arg" ]; then
            local full_path=$(realpath "$arg" 2>/dev/null || echo "$arg")
            if grep -qx "$full_path" "$SEC_FILE"; then
                is_protected=1
                protected_file="$arg"
                break
            fi
        fi
    done

    if [ $is_protected -eq 1 ]; then
        print -P "%F{196}⚠️ DİKKAT / WARNING:%f"
        if [ "$SELECTED_LANG" = "TR" ]; then
            echo -n "Bu dosyayı ($protected_file) güvene almayı seçmiştin. Silmek istediğine emin misin? [y/N]: "
        else
            echo -n "You chose to protect this file ($protected_file). Are you sure you want to delete it? [y/N]: "
        fi

        read ans
        case "$ans" in
            [Yy]*)
                local full_path=$(realpath "$protected_file" 2>/dev/null || echo "$protected_file")
                grep -vxF "$full_path" "$SEC_FILE" > "$SEC_FILE.tmp" && command mv -f "$SEC_FILE.tmp" "$SEC_FILE" 2>/dev/null || sed -i "\|^$full_path$|d" "$SEC_FILE"
                command rm "$@"
                ;;
            *)
                if [ "$SELECTED_LANG" = "TR" ]; then
                    print -P "%F{46}❌ İptal edildi. Dosya güvende.%f"
                else
                    print -P "%F{46}❌ Cancelled. File is safe.%f"
                fi
                return 1
                ;;
        esac
    else
        command rm "$@"
    fi
}

function mv() {
    local protected_file=""
    local old_path=""

    for arg in "$@"; do
        if [[ "$arg" != -* ]]; then
            local candidate=$(realpath "$arg" 2>/dev/null || echo "$arg")
            if grep -qx "$candidate" "$SEC_FILE"; then
                protected_file="$arg"
                old_path="$candidate"
                break
            fi
        fi
    done

    if [ -n "$old_path" ]; then
        print -P "%F{196}⚠️ DİKKAT / WARNING:%f"
        if [ "$SELECTED_LANG" = "TR" ]; then
            echo -n "Bu dosya/klasör ($protected_file) koruma altında. Taşımak/Adını değiştirmek istediğine emin misin? [y/N]: "
        else
            echo -n "This file/folder ($protected_file) is protected. Are you sure you want to move/rename it? [y/N]: "
        fi

        read ans
        case "$ans" in
            [Yy]*)
                local args=("$@")
                local dest="${args[-1]}"

                command mv "$@"
                local cmd_status=$?

                if [ $cmd_status -eq 0 ]; then
                    local new_path=""

                    if [ -d "$dest" ]; then
                        new_path=$(realpath "$dest/$(basename "$protected_file")" 2>/dev/null)
                    else
                        new_path=$(realpath "$dest" 2>/dev/null)
                    fi

                    if [ -n "$new_path" ]; then
                        grep -vxF "$old_path" "$SEC_FILE" > "$SEC_FILE.tmp" && command mv -f "$SEC_FILE.tmp" "$SEC_FILE" 2>/dev/null || sed -i "\|^$old_path$|d" "$SEC_FILE"

                        if ! grep -qx "$new_path" "$SEC_FILE"; then
                            echo "$new_path" >> "$SEC_FILE"
                        fi

                        if [ "$SELECTED_LANG" = "TR" ]; then
                            print -P "%F{46}✔ Koruma listesindeki dosya yolu güncellendi.%f"
                        else
                            print -P "%F{46}✔ Protected file path updated.%f"
                        fi
                    fi
                fi
                return $cmd_status
                ;;
            *)
                if [ "$SELECTED_LANG" = "TR" ]; then
                    print -P "%F{46}❌ İptal edildi. Taşınmadı.%f"
                else
                    print -P "%F{46}❌ Cancelled. Not moved.%f"
                fi
                return 1
                ;;
        esac
    else
        command mv "$@"
    fi
}

#====================================================================
# BbP Özel Komutlar Rehberi / Special Commands Guide

function bbp() {
    if [ "$1" = "spc" ]; then
        print -P "\n%F{39}═══ 🚀 BbP Özel Komutlar / Special Commands ═══%f\n"
        if [ "$SELECTED_LANG" = "TR" ]; then
            print -P "%F{135}  sec <dosya>%f                : Dosyayı özel koruma altına alır."
            print -P "%F{135}  unsec <dosya>%f              : Dosyanın korumasını kaldırır."
            print -P "%F{135}  kur%f                        : Otomatik tamamlama & renklendirme eklentilerini kurar."
            print -P "%F{135}  plugins-installed-by-bbp%f   : İndirilen/Kurulan eklenti durumunu gösterir."
            print -P "%F{135}  lang-reset%f                 : Dil seçim ekranını tekrar açar."
            print -P "%F{135}  sf%f                        : Dosya ve klasörleri düzenli sütunlar halinde gösterir."
            print -P "%F{242}                                 (Büyük dizinlerde 'ls', home (~) gibi yerlerde 'sf' önerilir.)%f"
            print -P "%F{135}  bbp spc%f                    : Bu özel komutlar listesini gösterir."
        else
            print -P "%F{135}  sec <file>%f                 : Protects the specified file from deletion."
            print -P "%F{135}  unsec <file>%f               : Removes protection from the file."
            print -P "%F{135}  setup%f                      : Installs auto-suggestions & syntax highlighting."
            print -P "%F{135}  plugins-installed-by-bbp%f   : Shows status of downloaded/installed plugins."
            print -P "%F{135}  lang-reset%f                 : Resets language selection."
            print -P "%F{135}  sf%f                        : Displays files and folders in clean columns."
            print -P "%F{242}                                 (Use 'ls' for large directories, 'sf' for home (~).)%f"
            print -P "%F{135}  bbp spc%f                    : Displays this special commands list."
        fi
        print -P "\n%F{24}══════════════════════════════════════════════%f\n"
    else
        if [ "$SELECTED_LANG" = "TR" ]; then
            print -P "%F{242}Özel komutları görmek için: %F{135}bbp spc%f"
        else
            print -P "%F{242}To see special commands: %F{135}bbp spc%f"
        fi
    fi
}

#====================================================================
# Geçmiş & Terminal Ayarları / History & Terminal Settings

HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt autocd
setopt PROMPT_SUBST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

#====================================================================
# Komut Süresi Hesaplama (Ultra-Fast Built-in Zsh Datetime)

zmodload zsh/datetime
typeset -g _cmd_start_time=0
typeset -g _last_elapsed_str=""

function preexec() {
    _cmd_start_time=$SECONDS
}

function precmd() {
    if [ $_cmd_start_time -gt 0 ]; then
        local elapsed=$(( SECONDS - _cmd_start_time ))
        _cmd_start_time=0

        if [ $elapsed -ge 1 ]; then
            local h=$(( elapsed / 3600 ))
            local m=$(( (elapsed % 3600) / 60 ))
            local s=$(( elapsed % 60 ))

            local t_str=""
            if [ $h -gt 0 ]; then
                t_str="${h}s ${m}d ${s}sn"
            elif [ $m -gt 0 ]; then
                t_str="${m}d ${s}sn"
            else
                t_str="${s}sn"
            fi

            _last_elapsed_str=" %F{24}│%F{135} ⏱ ${t_str}%f"
        else
            _last_elapsed_str=""
        fi
    fi
}

#====================================================================
# Git Göstergesi (Optimized Async/Quick check) / Git Branch Display

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{24}│%F{214} 🌿 %b%f'
zstyle ':vcs_info:git:*' check-for-changes false
zstyle ':vcs_info:git:*' get-revision false

precmd_vcs_info() {
    if [[ -d .git || -e .git ]]; then
        vcs_info
    else
        local d="$PWD"
        local found=0
        while [[ "$d" != "/" && -n "$d" ]]; do
            if [[ -e "$d/.git" ]]; then
                found=1
                break
            fi
            d="${d%/*}"
        done

        if [ $found -eq 1 ]; then
            vcs_info
        else
            vcs_info_msg_0_=""
        fi
    fi
}
precmd_functions+=(precmd_vcs_info)

#====================================================================
# PROMPT

PROMPT=$'%F{24}┌─【%F{39}%~%f${_last_elapsed_str}${vcs_info_msg_0_}%F{196}%(?.. %F{24}│%F{196} ✘ %?)%(1j. %F{24}│%F{220} ⚙ %j%f.)%F{24}】%F{242} %D{%H:%M}%f\n%F{24}└─%(?:%F{46}:%F{196})❯%f '

#====================================================================
# Özel Düzenli Liste Komutu / Custom Folder & File Lister (Optimized)

function lsa() {
    setopt localoptions nullglob

    local dirs=()
    local files=()
    local item

    for item in .* *; do
        [[ "$item" == "." || "$item" == ".." ]] && continue
        if [ -d "$item" ]; then
            dirs+=("$item")
        elif [ -e "$item" ]; then
            files+=("$item")
        fi
    done

    if [ ${#dirs[@]} -eq 0 ] && [ ${#files[@]} -eq 0 ]; then
        return 0
    fi

    local max_len=${#dirs[@]}
    [ ${#files[@]} -gt $max_len ] && max_len=${#files[@]}

    local dir_label="[K]"
    local file_label="[D]"
    local dir_title="📂 KLASÖRLER"
    local file_title="📄 DOSYALAR"

    if [ "$SELECTED_LANG" != "TR" ]; then
        dir_label="[Fo]"
        file_label="[Fi]"
        dir_title="📂 FOLDERS"
        file_title="📄 FILES"
    fi

    print -P "%F{39}${dir_title} ${dir_label}%f\t\t\t%F{214}${file_title} ${file_label}%f"
    print -P "%F{24}═══════════════════════════\t═══════════════════════════%f"

    local i
    for (( i=1; i<=max_len; i++ )); do
        local d_out=""
        local f_out=""

        if [ $i -le ${#dirs[@]} ]; then
            local name="${dirs[$i]}"
            local display_name="${name:0:20}"
            local mark=" "
            [[ "$name" == .* ]] && mark="*"

            local padded_name="${(r:20:)display_name}"

            if [[ "$mark" == "*" ]]; then
                d_out="%F{39}${dir_label}%F{196}*%F{39}${padded_name}%f"
            else
                d_out="%F{39}${dir_label} ${padded_name}%f"
            fi
        else
            d_out="                        "
        fi

        if [ $i -le ${#files[@]} ]; then
            local name="${files[$i]}"
            local display_name="${name:0:20}"
            local mark=" "
            [[ "$name" == .* ]] && mark="*"

            local color="214"
            [ -x "$name" ] && color="207"

            if [[ "$mark" == "*" ]]; then
                f_out="%F{${color}}${file_label}%F{196}*%F{${color}}${display_name}%f"
            else
                f_out="%F{${color}}${file_label} ${display_name}%f"
            fi
        fi

        print -P "${d_out}\t${f_out}"
    done
}

alias sf='lsa'

function bbp_start() {
    # Doğrudan bulunduğumuz klasördeki bbp.sh dosyasına bakıyoruz
    if [ -f "bbp.sh" ]; then
        # 1. Kodları .zshrc'ye kopyala
        echo "" >> "$HOME/.zshrc"
        echo "# === BbP Başlangıç ===" >> "$HOME/.zshrc"
        cat "bbp.sh" >> "$HOME/.zshrc"
        echo "# === BbP Bitiş ===" >> "$HOME/.zshrc"

        # 2. Kurulum fonksiyonunun kendisini .zshrc içinden temizle
        sed -i '' '/^function bbp_start()/,/^}/d' "$HOME/.zshrc" 2>/dev/null || sed -i '/^function bbp_start()/,/^}/d' "$HOME/.zshrc"

        echo "✨ BbP başarıyla kuruldu ve temizlendi!"

        # 3. Terminali tazeleyiver
        source "$HOME/.zshrc"
    else
        echo "❌ Hata: Bulunduğun klasörde 'bbp.sh' dosyası bulunamadı!"
        echo "💡 İpucu: Lütfen 'cd zsh-bbp' ile proje klasörünün içinde olduğundan emin ol."
    fi
}