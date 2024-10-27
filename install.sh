#!/bin/bash

# Atualiza o sistema
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instala o Node.js e npm
echo "Instalando Node.js e npm..."
sudo apt install -y nodejs npm

# Verifica se o Node.js e npm foram instalados corretamente
node_version=$(node -v)
npm_version=$(npm -v)
echo "Node.js versão: $node_version"
echo "npm versão: $npm_version"

echo "Node.js e npm instalados com sucesso!"

# Instalar as fontes da Microsoft
echo "Instalando fontes da Microsoft..."
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer -y

echo "Fonte da Microsoft instaladas com sucesso!"

# Instalar aplicativos em flatpak
echo "Instalando aplicativo em Flatpak..."
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

echo "Pacotes Flatpak instalados com sucesso!"

# Pacotes a serem baixados e instalados
echo "Instalando aplicativo em .deb..."

pacotes=(
  "Microsoft Edge" "https://go.microsoft.com/fwlink?linkid=2149051&brand=M102" "microsoft-edge.deb"
  "Slack" "https://slack.com/downloads/instructions/linux?ddl=1&build=deb" "slack.deb"
  "Zoom Meeting" "https://zoom.us/client/6.2.5.2440/zoom_amd64.deb" "zoom.deb"
  "Insync" "https://cdn.insynchq.com/builds/linux/3.9.4.60020/insync_3.9.4.60020-noble_amd64.deb" "insync.deb"
  "Figma Linux" "https://github.com/Figma-Linux/figma-linux/releases/download/v0.11.5/figma-linux_0.11.5_linux_amd64.deb" "figma-linux.deb"
  "Firefox Progressive Apps Extension" "https://github.com/filips123/PWAsForFirefox/releases/download/v2.12.5/firefoxpwa_2.12.5_amd64.deb" "firefoxpwa.deb"
)

# Baixar e instalar os pacotes
for pacote in "${pacotes[@]}"; do
  nome=$(echo "$pacote" | cut -d'"' -f2)
  url=$(echo "$pacote" | cut -d'"' -f4)
  arquivo=$(echo "$pacote" | cut -d'"' -f6)
  
  echo "Baixando $nome..."
  wget -q "$url" -O "$arquivo"
  
  echo "Instalando $nome..."
  sudo apt install ./$(basename "$arquivo")
  
  echo "Limpando..."
  rm "$arquivo"
done

# Instalar o AnythingLLM
curl -fsSL https://s3.us-west-1.amazonaws.com/public.useanything.com/latest/installer.sh | sh

echo "Pacotes .deb instalados com sucesso!"

# Instalar tema
echo "Insalando tema e ícones..."

git clone https://github.com/vinceliuice/Graphite-gtk-theme
cd Graphite-gtk-theme/
./install.sh -t --theme blue -c --color dark -s --size standard -l --libadwaita --tweaks black rimless normal

# Instalar os ícones
git clone https://github.com/vinceliuice/Colloid-icon-theme
cd Colloid-icon-theme/
./install.sh

# Instalar manualmente: Docker e Fontes.

echo "Temas e ícones instalados e aplicados com sucesso!"

echo "Fim do Ubuntu Automate"
