# Use a minimal base image for production
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files
COPY requirements.txt /app/requirements.txt
COPY app.py /app/app.py

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Create a non-root user for running the application
RUN useradd --create-home appuser
USER appuser

# Expose the port that the API will use
EXPOSE 5000

# Command to run the API
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "--workers", "4", "--timeout", "60", "--preload"]
