# Use the Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt from the images directory to the container
COPY images/requirements.txt /app/requirements.txt

# Install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the necessary port (if required)
EXPOSE 8000

# Run the application (adjust if needed)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
