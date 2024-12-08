# Laravel 11 Boilerplate com Docker

Este é um boilerplate para projetos Laravel 11, configurado para rodar em um ambiente Docker com dois containers:

- **PHP-FPM**: Para rodar o servidor Laravel.
- **PostgreSQL**: Banco de dados relacional.

O objetivo deste boilerplate é fornecer uma base sólida e pronta para iniciar projetos Laravel com facilidade.

---

## Tecnologias Utilizadas

- **Laravel 11**
- **PHP 8.2**
- **PostgreSQL (imagem oficial do Docker)**

---

## Como Usar

### Pré-requisitos

Certifique-se de que você possui as seguintes ferramentas instaladas:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

### Configuração do Ambiente

1. **Clone este repositório**:
2. **Suba os containers com o script de inicialização:**
```bash
   ./start.sh
```
3. **Acesse a aplicação: Abra o navegador e vá para:** http://localhost:9002.
4. **Banco de Dados: O banco de dados PostgreSQL está acessível na porta 5432 com as seguintes credenciais:**

- `Banco`: test
- `Usuário`: test
- `Senha`: test

---
## Estrutura do Projeto

- `app/`: Código fonte do Laravel.
- `docker-compose.yml`: Configuração do ambiente Docker.
- `start.sh`: Script para iniciar os containers, instalar dependências e configurar o ambiente Laravel.
- `down.sh`: para todos os containers em execução desse projeto.

---
## Personalizando o Repositório

Como este é um boilerplate, você pode remover o histórico Git e criar o seu próprio repositório. Para isso:

1. **Remova o diretório `.git`**:
```bash
   rm -rf .git
```
2. **Inicie um novo repositório**:
```bash
   git init
```
3. **Adicione os arquivos ao novo repositório**:
```bash
   git add .
   git commit -m "Inicializando meu projeto Laravel"
```
4. **Adicione o repositório remoto**:
```bash
   git remote add origin https://github.com/seu-usuario/seu-novo-repositorio.git
```
5. **Envie os arquivos para o novo repositório**:
```bash
   git push -u origin main
```

---
## Conexão com o banco de dados pelo pgadmin ou outros
### Para conexão com frameworks como pgadmin:
- `host`: localhost
- `port`: 5432
- `senha`: test
- `user`: test
- `DB`: postgres

Ao contrário do .env onde a conexão entre containers exige o nome do container como DB_HOST, a conexão na sua máquina local deve ser "localhost"

