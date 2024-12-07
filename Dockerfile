# Use the official Python image as a base image
FROM python:3.9-slim

# Set a working directory inside the container
WORKDIR /app

# Copy requirements (if any) to install dependencies first (better caching)
COPY requirements.txt .

# Install MkDocs and Material for MkDocs
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY . .

# Expose the MkDocs development server port
EXPOSE 8000

# Default command to serve the documentation
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
