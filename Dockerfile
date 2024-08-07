# Use an official Golang runtime as a parent image
FROM golang:bookworm

# Set the Current Working Directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Download and extract the alist binary
RUN wget https://github.com/alist-org/alist/releases/download/v3.36.0/alist-linux-amd64.tar.gz \
    && tar -xzf alist-linux-amd64.tar.gz \
    && mv alist /app/klist/alist \
    && chmod +x /app/klist/alist

# Copy the local directory contents into the container
COPY klist/data /app/klist/data

# Set the working directory to where alist is located
WORKDIR /app/klist

# Run alist server
CMD ["./alist", "server"]
