FROM node:alpine3.20

WORKDIR /app

# Copy package files and install dependencies for the root project
COPY package.json ./
RUN npm install

# # Copy the environment file
# COPY .env .env

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Copy environment files to the correct locations
# RUN cp .env .medusa/server/.env.production && \
#     cp .env .medusa/server/.env

# Expose the port the app will run on
EXPOSE 9005

#Export production environment
ENV NODE_ENV=production

# Start the application using the specified command
CMD ["sh", "-c", "npm run start"]
