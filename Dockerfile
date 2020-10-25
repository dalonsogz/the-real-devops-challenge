FROM centos as centos-app

RUN mkdir /app
COPY app.py /app/app.py
COPY requirements.txt /app/requirements.txt
COPY src /app/src 

RUN                             \ 
  yum -y install python      && \
  yum clean all

RUN curl -O https://bootstrap.pypa.io/get-pip.py  && \
    python get-pip.py

RUN pip install -r /app/requirements.txt

EXPOSE 8080

WORKDIR /app

CMD ["python","app.py"]

