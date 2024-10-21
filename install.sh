#!/bin/bash

# Instalar o RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Instalar o GNOME Tweaks para configurar o botão de minimizar
sudo dnf install gnome-tweaks -y

# Instalar o Node.js
sudo dnf clean all -y
sudo dnf clean all -y
sudo dnf install nodejs -y

# Instalar o Zen Browser
flatpak install flathub io.github.zen_browser.zen -y

# Instalar as fontes da Microsoft
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# Instalar aplicativos em flatpak
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub org.localsend.localsend_app -y
flatpak install flathub com.rtosta.zapzap -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub com.todoist.Todoist -y
flatpak install flathub io.github.pwr_solaar.solaar -y
flatpak install flathub net.xmind.XMind -y
flatpak install flathub org.upscayl.Upscayl -y
flatpak install flathub com.termius.Termius -y
flatpak install flathub it.mijorus.gearlever -y

# Instalar as fontes que estão na pasta: Fontes
# Aplicativos para instalar depois manualmente:

# Instalar o Microsoft Edge:
#https://go.microsoft.com/fwlink?linkid=2149137&brand=M102

# Instalar o Slack:
# https://slack.com/downloads/instructions/linux?ddl=1&build=rpm

# Instalar o Zoom:
# https://zoom.us/client/6.2.3.2056/zoom_x86_64.rpm

# Instalar o Insync:
# https://cdn.insynchq.com/builds/linux/3.9.4.60020/insync-3.9.4.60020-fc40.x86_64.rpm

# Instalar o AnythingLLM Desktop:
# curl -fsSL https://s3.us-west-1.amazonaws.com/public.useanything.com/latest/installer.sh | sh

# Instalar o Figma Desktop:
# https://github.com/Figma-Linux/figma-linux/releases/download/v0.11.5/figma-linux_0.11.5_linux_x86_64.rpm

# Instalar Docker Desktop 
# sudo dnf install ./docker-desktop-<arch>.rpm -y

# O que adicionar como webapp depois: Notion
