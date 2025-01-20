# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1
ENV PATH="/py/bin:$PATH"


COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY requirements.txt /tmp/requirements.txt
# Copy the rest of the application code to the working directory
COPY . /ecomWithAgentApi /ecom_with_agen_api
ARG DEV=false

WORKDIR /ecom_with_agen_api


RUN python -m venv /py

RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client \
    libpq-dev \
    build-essential \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
# Create and activate a virtual environment
# Install dependencies from the requirements file


RUN /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \

    adduser \
        --disabled-password \
        --no-create-home \
        django-user




