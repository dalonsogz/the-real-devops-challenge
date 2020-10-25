FROM ubuntu

RUN mkdir /app
COPY app.py /app/app.py
COPY requirements.txt /app/requirements.txt
COPY src /app/src

RUN apt update
RUN apt-get update
RUN apt-get install python3.6 -y
RUN apt-get install python3-pip -y

RUN pip install -r /app/requirements.txt

EXPOSE 8080

WORKDIR /app

CMD ["python","app.py"]

