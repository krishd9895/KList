# Use an official Golang runtime as a parent image
FROM golang:1.20 AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the local directory contents into the container
COPY klist /app/klist

# Install any needed packages
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Make the alist binary executable
RUN chmod +x /app/klist/alist

# Set the working directory to where alist is located
WORKDIR /app/klist

# Run alist server
CMD ["./alist", "server"]
