# Use node 16
FROM node:16

WORKDIR /usr/src/app

# Copy files
COPY --chown=node:node . .

# Install packages
RUN npm install

# Start backend
CMD npm start
