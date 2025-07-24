# MULTI-STAGE DOCKERFILE
# Build Stage
FROM node:24-alpine3.21 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
 
# Production Stage
FROM nginx:1.29.0 AS production
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


# BASIC DOCKERFILE
# # Use the latest LTS version of Node.js
# FROM node:24-alpine3.21
 
# # Set the working directory inside the container
# WORKDIR /app
 
# # Copy package.json and package-lock.json
# COPY package*.json ./
 
# # Install dependencies
# RUN npm install
 
# # Copy the rest of your application files
# COPY . .
 
# # Expose the port your app runs on
# EXPOSE 3000
 
# # Define the command to run your app
# CMD ["npm", "start"]

