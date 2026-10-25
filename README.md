# Ambiente de programação híbrido para Ubuntu/Debian com 8 GB RAM

Este repositório contém um script para configurar um ambiente de desenvolvimento leve, funcional e com IA local em máquinas com 8 GB de RAM.

Ele instala:

- Git
- Python 3 + pip + venv
- Node.js + npm
- Java 21
- Rust + Cargo
- Ferramentas de compilação
- VSCodium (VS Code sem telemetria)
- Ollama para IA local
- Xfce (opcional, leve e recomendado para máquinas mais modestas)

## Requisitos

- Ubuntu ou Debian
- Usuário com permissões de sudo
- 8 GB de RAM recomendado
- Conexão com a internet

## Como usar

1. Baixe o script:

```bash
wget https://raw.githubusercontent.com/PublioSantos/hybrid-dev-setup/main/install-hybrid-dev-env.sh
```

2. Dê permissão de execução:

```bash
chmod +x install-hybrid-dev-env.sh
```

3. Execute o script:

```bash
./install-hybrid-dev-env.sh
```

## O que o script faz

### 1. Atualiza o sistema

```bash
sudo apt update && sudo apt full-upgrade -y
```

### 2. Instala ferramentas essenciais

- git
- build-essential
- python3
- python3-pip
- python3-venv
- nodejs
- npm
- openjdk-21-jdk
- rustc
- cargo
- curl
- wget
- htop

### 3. Instala Xfce (opcional)

A interface Xfce é recomendada para máquinas com 8 GB de RAM porque é mais leve que ambientes pesados como GNOME ou KDE.

### 4. Instala VSCodium

O VSCodium é uma versão do VS Code sem a telemetria da Microsoft e é uma boa opção para quem quer um editor leve e privado.

### 5. Instala Ollama

O Ollama permite rodar modelos de IA locais em sua máquina, sem depender de serviços em nuvem.

### 6. Baixa o modelo Phi-3 Mini

O modelo `phi3:mini` foi escolhido porque costuma ser mais adequado para computadores com memória limitada.

### 7. Verifica swap

Se sua máquina não tiver swap configurado, o script informa como criá-la manualmente.

## IA local

Depois da instalação, você pode executar:

```bash
ollama run phi3:mini
```

Para parar o modelo quando não estiver em uso:

```bash
ollama stop phi3:mini
```

## Próximos passos

Após a instalação:

1. Abra o VSCodium com o comando:

```bash
codium
```

2. Instale a extensão Continue.dev apontando para:

```text
http://localhost:11434
```

3. Instale também o Codeium para autocompletar.

## Dicas de uso

- Mantenha no máximo 3 a 5 abas do navegador abertas ao mesmo tempo
- Use o Xfce se a máquina for mais básica
- Evite rodar vários programas pesados junto com o editor e o modelo de IA
- Feche o modelo de IA quando não estiver usando para liberar memória RAM

## Observações importantes

- O script foi pensado para Ubuntu/Debian
- A atualização e a instalação podem demorar alguns minutos
- O modelo do Ollama consome memória e espaço em disco
- A instalação do Xfce aumenta o uso de espaço em disco, mas melhora a leveza do sistema

## Licença

Este projeto está licenciado sob a licença MIT.

## Autor

Publio Santos

## Repositório

https://github.com/PublioSantos/hybrid-dev-setup
