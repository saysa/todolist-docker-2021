ToDoList
========

Base du projet #8 : Améliorez un projet existant

https://openclassrooms.com/projects/ameliorer-un-projet-existant-1

To start the project:
- run `docker-compose build --no-cache`
- run `docker-compose up -d --build --remove-orphans --force-recreate`
- run `docker exec todolist_php-fpm composer install  -a -o`
- run `docker exec todolist_php-fpm composer clear-cache`
- run `docker exec todolist_php-fpm composer dump-autoload --optimize --classmap-authoritative`
- run `docker exec todolist_php-fpm rm -rf ./var/cache/*`