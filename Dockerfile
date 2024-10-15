FROM node:lts-buster

# Install dependencies
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the package.json
COPY package.json .

# Install Node.js dependencies with legacy-peer-deps to avoid conflicts
RUN npm install --legacy-peer-deps && npm install qrcode-terminal --legacy-peer-deps

# Expose the necessary port
EXPOSE 5000

# Define the command to start your application
CMD ["npm", "start"]
