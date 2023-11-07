# Use the official Python image. python:3.9.18-alpine3.18
FROM python@sha256:688a9a5e303ff1ef6f2e85229677754e00aff1f5e6637c2964a9699868b184a8

# Set the working directory to /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt

# Install dbt using pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Install dbt dependencies
RUN dbt deps