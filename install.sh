#!/bin/bash

# Função para verificar a instalação de pacotes
verifica_instalacao() {
    local pacote="$1"
    if command -v "$pacote" &> /dev/null; then
        echo "$pacote já está instalado!"
    else
        echo "$pacote não encontrado."
    fi
}

# Atualiza o sistema
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instala Node.js e npm
echo "Instalando Node.js e npm..."
sudo apt install -y nodejs npm
verifica_instalacao "node"
verifica_instalacao "npm"

# Instalar fontes da Microsoft
echo "Instalando fontes da Microsoft..."
sudo apt install -y ttf-mscorefonts-installer
echo "Fontes da Microsoft instaladas com sucesso!"

# Instalar aplicativos em Flatpak
echo "Instalando aplicativos em Flatpak..."
flatpak install -y \
  com.discordapp.Discord \
  com.github.KRTirtho.Spotube \
  com.obsproject.Studio \
  com.spotify.Client \
  com.todoist.Todoist \
  com.tomjwatson.Emote \
  io.github.zen_browser.zen \
  it.mijorus.gearlever \
  md.obsidian.Obsidian \
  net.mkiol.SpeechNote \
  net.mkiol.SpeechNote.Addon.amd \
  net.xmind.XMind \
  org.telegram.desktop \
  org.upscayl.Upscayl \
  page.codeberg.libre_menu_editor.LibreMenuEditor
echo "Aplicativos Flatpak instalados com sucesso!"

# Baixar e instalar pacotes .deb
echo "Iniciando instalação de aplicativos .deb..."
declare -A pacotes=(
    ["Microsoft Edge"]="https://go.microsoft.com/fwlink?linkid=2149051&brand=M102"
    ["Slack"]="https://slack.com/downloads/instructions/linux?ddl=1&build=deb"
    ["Zoom Meeting"]="https://zoom.us/client/6.2.5.2440/zoom_amd64.deb"
    ["Insync"]="https://cdn.insynchq.com/builds/linux/3.9.4.60020/insync_3.9.4.60020-noble_amd64.deb"
    ["Figma Linux"]="https://github.com/Figma-Linux/figma-linux/releases/download/v0.11.5/figma-linux_0.11.5_linux_amd64.deb"
    ["Firefox Progressive Apps"]="https://github.com/filips123/PWAsForFirefox/releases/download/v2.12.5/firefoxpwa_2.12.5_amd64.deb"
)

for nome in "${!pacotes[@]}"; do
    url="${pacotes[$nome]}"
    arquivo="${nome// /_}.deb"

    echo "Baixando $nome..."
    wget -q "$url" -O "$arquivo" && {
        echo "Instalando $nome..."
        sudo apt install -y "./$arquivo"
        echo "$nome instalado com sucesso!"
        rm "$arquivo"
    } || {
        echo "Falha ao baixar $nome. Verifique a URL."
    }
done

# Instalar AnythingLLM
echo "Instalando AnythingLLM..."
curl -fsSL https://s3.us-west-1.amazonaws.com/public.useanything.com/latest/installer.sh | sh

# Instalar tema e ícones
echo "Instalando tema e ícones..."
git clone https://github.com/vinceliuice/Graphite-gtk-theme
cd Graphite-gtk-theme/ || exit
./install.sh -t --theme blue -c --color dark -s --size standard -l --libadwaita --tweaks black rimless normal
cd ..

git clone https://github.com/vinceliuice/Colloid-icon-theme
cd Colloid-icon-theme/ || exit
./install.sh

# Mensagens de sucesso
echo "Temas e ícones instalados e aplicados com sucesso!"
echo "Fim do Ubuntu Automate"
