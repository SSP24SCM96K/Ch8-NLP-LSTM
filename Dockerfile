# # Docker file for simple NLP app
# # Author: Dattaraj J Rao
# # For Book: Keras2Kubernetes

# # Start with latest Ubuntu image
# FROM python:3.8

# ENV PORT 8080
# ENV HOSTDIR 0.0.0.0

# EXPOSE 8080

# # Install latest updates
# RUN apt-get update -y

# # Install Python and build libraries
# RUN apt-get install -y python3-pip python-dev build-essential

# # Copy files from current folder (.) to the Container's default folder (.)
# COPY . .

# # Set working directory as Container's default folder (.)
# WORKDIR .

# # Install the dependencies specified in requirements file
# RUN pip install -r requirements.txt

# # Define the command to start when Container starts
# ENTRYPOINT [ "python" ]

# # Pass the file as parameter to the entry command to start your App
# CMD [ "app.py" ]
FROM python:3.8

ENV PORT 80 
ENV HOSTDIR 0.0.0.0

EXPOSE 80

RUN apt-get update -y && \
    apt-get install -y python3-pip

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . .


ENTRYPOINT ["python", "app.py"]

