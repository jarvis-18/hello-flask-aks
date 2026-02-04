# Use a small Python base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask app
COPY app.py .

# Expose the port your Flask app listens on
EXPOSE 8080

# Run the Flask app
CMD ["python", "app.py"]
