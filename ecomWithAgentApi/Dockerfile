# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1
ENV PATH="/venv/bin:$PATH"

# Create and activate a virtual environment
RUN python -m venv /venv

# Upgrade pip and install necessary packages for virtual environment
RUN /venv/bin/pip install --upgrade pip setuptools wheel

# Set the working directory in the container
WORKDIR /ecomWithAgentApi

# Install system dependencies required for some Python packages


# Add the requirements file to the working directory
COPY requirements.txt /ecomWithAgentApi/requirements.txt

# Install dependencies from the requirements file
RUN /venv/bin/pip install -r /ecomWithAgentApi/requirements.txt

# Copy the rest of the application code to the working directory
COPY . /ecomWithAgentApi/

# Expose the application port
EXPOSE 8006

# Run application
CMD ["gunicorn", "ecomWithAgentApi.wsgi:application", "--bind", "0.0.0.0:8006", "--workers", "3"]