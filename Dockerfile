FROM python:3.9.12-slim-buster

WORKDIR /usr/src/app

COPY src/requirements.txt .

RUN python -m pip install -r requirements.txt

COPY src /usr/src/app

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers=2", "-c", "config.py", "app:app"]