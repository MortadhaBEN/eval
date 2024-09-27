# Use the official Python image from the Docker Hub
FROM python:3.8-slim

# Set environment variables to prevent Python from writing .pyc files
# and to ensure output is flushed immediately
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port that the app runs on
EXPOSE 5000

# Command to run the application
CMD ["uvicorn", "mini-groq:app", "--host", "0.0.0.0", "--port", "5000", "--reload"]
