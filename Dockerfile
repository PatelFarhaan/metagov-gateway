FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY metagov/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY metagov/ .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
