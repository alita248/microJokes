# create image for flask application
# expose port 5000 in container

FROM python:3.7.3
EXPOSE  5000
WORKDIR /app
COPY requirements.txt

RUN pip install -r requirements.txt

# copy project to container to folder /app
COPY . /app 

CMD [ "flask", "run", "--host", "0.0.0.0" ]

# create an image
# docker build -t py_rest_api .

# run the container expose port 5000 on local computer 127.0.0.1 
# expose port 5000 on local computer 127.0.0.1:5000, map to container prot 0.0.0.0:5000
# docker run -dp 5000:5000 py_rest_api

# run in mode with volume... always restart app when code /app is changed
### docker run -dp 5000:5000 -w /app -v '($pwd):/app' image_name_app