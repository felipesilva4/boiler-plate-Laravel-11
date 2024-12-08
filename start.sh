#!/bin/bash

echo "Iniciando containers..."
docker compose up -d --build

echo "Aguardando o PostgreSQL iniciar..."
sleep 10

echo "Instalando dependências com Composer..."
docker exec -it laravel-app composer install

echo "Criando diretórios necessários..."
docker exec -u root -it laravel-app chmod -R 777 /var/www/storage /var/www/bootstrap/cache


echo "Configurando permissões..."
docker exec  -u root -it laravel-app chmod -R 777 /var/www/storage /var/www/bootstrap/cache

echo "Aplicando configurações do Laravel..."
docker exec -u root -it laravel-app cp .env.example .env
docker exec -u root -it laravel-app php artisan key:generate

echo "Executando migrations e seeders..."
docker exec -u root -it laravel-app php artisan migrate --seed

docker exec -d laravel-app php artisan serve --host=0.0.0.0 --port=8000


echo "Pronto! O projeto está rodando na porta 9002."
