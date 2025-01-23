# Use the official Python image as a base image
FROM nginx AS builder

# Set a working directory inside the container
WORKDIR /app

# Update repository packages
RUN apt update

# Install deps
RUN apt install mkdocs -y && \
	apt install mkdocs-bootstrap -y

# Copy the project files into the container
COPY . .

# Build the project
RUN mkdocs build

FROM nginx:alpine

# Copy project build code to nginx server
COPY --from=builder /app/site /usr/share/nginx/html
