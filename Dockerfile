# Use an official Golang runtime as a parent image
FROM golang:1.20 AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the local directory contents into the container
COPY . .

# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Download and install the alist binary
RUN wget https://github.com/alist-org/alist/releases/download/v3.36.0/alist-linux-amd64.tar.gz \
    && tar -xzf alist-linux-amd64.tar.gz \
    && mv alist /usr/local/bin/

# Run alist server
CMD ["alist", "server"]
