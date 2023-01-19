#Use node:16 image to build the frontend
FROM node:16 AS build-stage

WORKDIR /usr/src/app

# Copy frontend directory to the container
COPY . .

# Install only the production packages 
RUN npm ci

# Build the frontend
RUN npm run build

# Use nginx to serve the compiled html
# nginx will start at internal port 80
FROM nginx:1.23.2

# Copy only the built frontend to the new container.
COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html
