FROM node:lts-buster

# Install necessary dependencies
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy package.json and other project files into the container
COPY package.json .
COPY . .

# Install Node.js dependencies
RUN npm install --legacy-peer-deps && npm install qrcode-terminal --legacy-peer-deps

# Expose the port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
