FROM python:3.6.15-alpine

WORKDIR /app

COPY requirements.txt requirements-test.txt ./

RUN pip install -r requirements.txt -r requirements-test.txt

COPY . .

ENV MONGO mongodb
ENV MONGO_PORT 27017
ENV FLASK_APP ui.py

EXPOSE 8000

CMD ["gunicorn", "ui.ui:app", "-b", "0.0.0.0"]
