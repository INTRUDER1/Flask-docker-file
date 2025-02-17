# Use official Python image
FROM python:3.9

# Set working directory inside the container
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose Flask port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
