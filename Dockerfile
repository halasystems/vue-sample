FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

COPY package.json ./
COPY yarn.lock .

RUN yarn install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app with minification
RUN yarn build

EXPOSE 8080
CMD [ "http-server", "." ]

