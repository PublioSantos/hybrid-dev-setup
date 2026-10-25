#!/bin/bash
set -e

echo "=== 🚀 Instalando ambiente de programação híbrido grátis para 8 GB RAM ==="

# 1. Atualizar sistema
echo "--- Atualizando pacotes ---"
sudo apt update && sudo apt full-upgrade -y

# 2. Instalar ferramentas essenciais
echo "--- Instalando ferramentas base ---"
sudo apt install -y git build-essential python3 python3-pip python3-venv \
  nodejs npm openjdk-21-jdk rustc cargo curl wget htop

# 3. Instalar Xfce (interface leve — opcional, recomendado para 8 GB)
read -p "Instalar interface Xfce (mais leve, economiza ~1 GB RAM)? [S/n] " resp
if [[ ! "$resp" =~ ^[Nn]$ ]]; then
  echo "--- Instalando Xfce ---"
  sudo apt install -y xubuntu-desktop
  echo "✅ Xfce instalado. Escolha 'Xfce Session' na tela de login na próxima reinicialização."
fi

# 4. Instalar VSCodium (VS Code sem telemetria)
echo "--- Instalando VSCodium ---"
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
  | gpg --dearmor | sudo tee /usr/share/keyrings/vscodium-archive-keyring.gpg > /dev/null
echo 'deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
  | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install -y vscodium

# 5. Instalar Ollama (IA local)
echo "--- Instalando Ollama ---"
curl -fsSL https://ollama.com/install.sh | sh

# 6. Baixar modelo ideal para 8 GB RAM
echo "--- Baixando phi3:mini (~4 GB RAM) ---"
ollama pull phi3:mini

# 7. Verificar swap
echo "--- Verificando swap ---"
swapon --show
echo "✅ Se não aparecer swap, crie com: sudo fallocate -l 4G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile"

# 8. Configurações finais
echo "--- Configurando ---"
pip3 install --upgrade pip
git config --global init.defaultBranch main

echo ""
echo "✅ INSTALAÇÃO CONCLUÍDA!"
echo ""
echo "📝 Próximos passos:"
echo "  1. Abra o VSCodium digitando: codium"
echo "  2. Instale a extensão: Continue.dev → apontar para http://localhost:11434"
echo "  3. Instale também: Codeium (autocompletar grátis)"
echo "  4. Para usar a IA no terminal: ollama run phi3:mini"
echo "  5. Parar IA quando não usar (libera RAM): ollama stop phi3:mini"
echo ""
echo "💡 Dica: mantenha no máximo 3-5 abas do navegador abertas junto com o editor!"
