# Use a small, secure base
FROM python:3.11-slim

# Ensure no prompts during install
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Install security updates & runtime deps
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

# Create app dir
WORKDIR /app

# Install deps first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY app.py .

# Non-root user for security
RUN useradd -m appuser
USER appuser

# App listens on 8080
EXPOSE 8080

# Use gunicorn for production
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]