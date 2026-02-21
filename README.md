# Metagov Gateway

An open-source API gateway for online community governance. Connects decision-making tools to platforms where decisions are made, enabling rapid prototyping of governance systems, decision-making processes, and social workflows across forums, chat services, and blockchains.

Part of the [Metagovernance Project](https://metagov.org) -- a nonprofit research group building standards and infrastructure for digital self-governance.

## Tech Stack

- Python 3.8+
- Django 3.x / Django REST Framework
- Celery (task queue)
- RabbitMQ (message broker)
- SQLite (default) / PostgreSQL
- Swagger / ReDoc (API documentation)

## Features

- Plugin-based architecture supporting multiple platform integrations
- Supported platforms: Discord, Slack, Discourse, GitHub, Open Collective, Loomio, SourceCred, NEAR, Web Monetization, Twitter
- RESTful API with auto-generated Swagger/ReDoc documentation
- Celery-based async task processing with periodic beat scheduling
- OAuth-based community authentication flows
- Governance process lifecycle management
- Linked account identity management across platforms

## Prerequisites

- Python 3.8 or higher
- RabbitMQ (for Celery task broker)
- Git

## Installation and Setup

```bash
git clone <repository-url>
cd gateway/metagov
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
cp metagov/.env.example metagov/.env
# Edit metagov/.env with your configuration
python manage.py migrate
python manage.py createsuperuser
```

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `DJANGO_SECRET_KEY` | Django secret key for cryptographic signing | Yes |
| `DEBUG` | Enable Django debug mode | No |
| `ALLOWED_HOSTS` | Comma-separated list of allowed hostnames | Yes |
| `SERVER_URL` | Public URL of the Gateway server | Yes |
| `DATABASE_PATH` | Path to SQLite database file | No |
| `LOG_FILE` | Path to log file | No |
| `SLACK_CLIENT_ID` | Slack app client ID | No |
| `SLACK_CLIENT_SECRET` | Slack app client secret | No |
| `SLACK_SIGNING_SECRET` | Slack request signing secret | No |
| `SLACK_APP_ID` | Slack application ID | No |
| `GITHUB_APP_NAME` | GitHub App name | No |
| `GITHUB_APP_ID` | GitHub App ID | No |
| `GITHUB_PRIVATE_KEY_PATH` | Path to GitHub App private key | No |
| `TWITTER_API_KEY` | Twitter API key | No |
| `TWITTER_API_SECRET_KEY` | Twitter API secret key | No |
| `TWITTER_ACCESS_TOKEN` | Twitter access token | No |
| `TWITTER_ACCESS_TOKEN_SECRET` | Twitter access token secret | No |
| `DISCORD_CLIENT_ID` | Discord app client ID | No |
| `DISCORD_CLIENT_SECRET` | Discord app client secret | No |
| `DISCORD_BOT_TOKEN` | Discord bot token | No |
| `DISCORD_PUBLIC_KEY` | Discord public key | No |

## How to Run

### Development Server
```bash
cd metagov
python manage.py runserver
```

### Celery Worker
```bash
celery -A metagov worker -l info
```

### Celery Beat Scheduler
```bash
celery -A metagov beat -l info
```

Then visit `http://localhost:8000/swagger` for API documentation.

## Project Structure

```
gateway/
├── metagov/
│   ├── manage.py              # Django management script
│   ├── requirements.txt       # Python dependencies
│   ├── setup.py               # Package setup
│   └── metagov/
│       ├── settings.py        # Django settings with env var configuration
│       ├── urls.py            # URL routing
│       ├── celery.py          # Celery configuration
│       ├── core/              # Core models, views, handlers, middleware
│       ├── plugins/           # Platform integration plugins
│       ├── httpwrapper/       # HTTP wrapper utilities
│       ├── tests/             # Test suite
│       └── .env.example       # Environment variable template
├── docs/                      # Documentation source (ReadTheDocs)
├── Functional spec.svg        # Architecture diagram
└── LICENSE                    # MIT License
```

## Documentation

Full documentation is available at [docs.metagov.org](https://docs.metagov.org).

## License

MIT -- see [LICENSE](LICENSE) for details.
