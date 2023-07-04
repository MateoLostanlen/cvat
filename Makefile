run:
	export CVAT_HOST=$(hostname -I | head -n1 | cut -d " " -f1)
	export ACME_EMAIL=mateo@pyronear.org
	docker compose up -d
	docker exec -it cvat_server bash -ic 'python3 ~/manage.py createsuperuser'


clean:
	docker compose down
	docker system prune -af
	docker volume rm $(docker volume ls -q)
