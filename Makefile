# container run
up:
	docker compose -f docker-compose.yml up -d

build:
	docker compose -f docker-compose.yml up -d --build

down:
	docker compose -f docker-compose.yml down

# container join
php:
	docker compose -f docker-compose.yml exec php sh;

nginx:
	docker compose -f docker-compose.yml exec nginx sh;

node:
	docker compose -f docker-compose.yml exec node sh;

init\:env:
	make up
	docker compose -f docker-compose.yml exec php composer install
	docker compose -f docker-compose.yml exec php php artisan key:generate
	docker compose -f docker-compose.yml exec php php artisan migrate

# code clean
phpstan:
	docker compose -f docker-compose.yml exec php vendor/bin/phpstan analyse -c config/phpstan.neon --memory-limit 2048M

csfix:
	docker compose -f docker-compose.yml exec php vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php

fix:
	make csfix
	make phpstan
