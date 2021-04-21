# # Name the node stage "builder"
# FROM node:10 AS builder
# # Set working directory
# WORKDIR /app
# # Copy all files from current directory to working dir in image
# COPY . .
# # install node modules and build assets
# RUN yarn install && yarn build

FROM node:lts-alpine

RUN mkdir /app

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

# Copy static assets from builder stage
#COPY --from=builder /app/dist .

# make the 'app' folder the current working directory
#WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
#COPY package*.json ./

# install project dependencies
#RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
#COPY . .

# build app for production with minification
#RUN npm run build

EXPOSE 8080
#CMD [ "http-server", "dist" ]

CMD [ "npm", "run", "dev" ]
