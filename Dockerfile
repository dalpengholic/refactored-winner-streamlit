# Use the python image version 3.9-slim-bullseye as the base image for this Docker image.
FROM python:3.9-slim-bullseye

# Set the working directory inside the container to "/app".
WORKDIR /app

# Copy the Pipfile and Pipfile.lock files from the host to the working directory in the container.
COPY Pipfile* ./

# Install pipenv and use it to install the dependencies listed in the Pipfile.lock file.
RUN pip install pipenv && pipenv install --system

# Copy the "app.py" file from the host to the working directory in the container.
#COPY app.py .

# Set the command to run when the container is launched. This will start the Streamlit app using the "app.py" file.
CMD streamlit run project/app.py
