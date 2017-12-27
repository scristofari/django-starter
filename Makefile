init:
	docker-compose up -d
	# wait the postgres to boot.
	sleep 3
	docker exec djangostarter_web_1 bash -c "python manage.py migrate"
	docker exec -it djangostarter_web_1 bash -c "python manage.py createsuperuser"

boot: init run

run: build
	docker-compose up -d

build:
	docker build -t django-starter:latest .

stop:
	docker-compose stop

ssh:
	docker exec -it djangostarter_web_1 bash

destroy:
	docker-compose down