.PHONY: install run migrate test clean celery celery-beat

install:
	cd metagov && python3 -m venv env && . env/bin/activate && pip install -r requirements.txt

run:
	cd metagov && . env/bin/activate && python manage.py runserver

migrate:
	cd metagov && . env/bin/activate && python manage.py migrate

test:
	cd metagov && . env/bin/activate && python manage.py test

celery:
	cd metagov && . env/bin/activate && celery -A metagov worker -l info

celery-beat:
	cd metagov && . env/bin/activate && celery -A metagov beat -l info

clean:
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	rm -rf metagov/env metagov/db.sqlite3 metagov/*.log
