# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file to the working directory
COPY requirements.txt /app/

# Output the contents of requirements.txt for debugging
RUN cat /app/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . /app/

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose the port that the app will run on
EXPOSE 8000

# Define the command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "StreaminApp.wsgi:application"]
