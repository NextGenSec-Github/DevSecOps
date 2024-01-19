# Start with a lean base image (adjust for GPU support if needed)
FROM python:3.9-slim

# Install only essential dependencies with explicit versions
RUN pip install --no-cache-dir numpy==1.25.5 pandas==1.5.5 scikit-learn==1.2.0 tensorflow-gpu  # Add GPU support if required

# Leverage multi-stage build for a smaller final image
FROM python:3.9-slim as runtime
WORKDIR /app
COPY --from=0 /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# Copy model files, code, and data
COPY model.h5 /app/model
COPY app.py /app/app.py
COPY data /app/data

# Run as a non-root user
RUN useradd -m myuser
USER myuser

# Expose port for serving
EXPOSE 8080

# Set entrypoint
ENTRYPOINT ["python", "app.py"]

# Health checks (example for a simple check)
HEALTHCHECK CMD ["python", "-c", "import app; app.health_check()"]

# Logging
RUN pip install python-json-logger
ENV LOG_LEVEL=INFO  # Adjust as needed
ENV LOG_FORMAT="%(asctime)s - %(name)s - %(levelname)s - %(message)s"

CMD ["python", "app.py"]  # Replace with your app's command
