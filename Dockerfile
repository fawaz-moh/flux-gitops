# our base image
FROM alpine:3.9

# Install python and pip
RUN apk add --update python3

# upgrade pip
RUN pip3 install --upgrade pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# run the application
CMD ["python3", "/usr/src/app/app.py"]
