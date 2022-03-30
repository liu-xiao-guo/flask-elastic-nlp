FROM python:3.9.10

RUN apt-get update && rm -rf /var/lib/apt/lists/*

WORKDIR /nlp-app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY app .
COPY .env .
COPY .flaskenv .
COPY flask-elastic-nlp.py .
COPY config.py .
COPY LICENSE .

#CMD [ "python"]
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0" ]