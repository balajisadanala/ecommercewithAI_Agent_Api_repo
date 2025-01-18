# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1
ENV PATH="/venv/bin:$PATH"


COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY requirements.txt /ecomWithAgentApi/requirements.txt
# Copy the rest of the application code to the working directory
COPY . /ecomWithAgentApi /ecomWithAgentApi
ARG DEV=false

WORKDIR /ecomWithAgentApi


# Create and activate a virtual environment
RUN python -m venv /venv
# Install dependencies from the requirements file
RUN /venv/bin/pip install --upgrade pip setuptools wheel
RUN /venv/bin/pip install -r /ecomWithAgentApi/requirements.txt && \
    if [ $DEV = "true" ]; \
    then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \


