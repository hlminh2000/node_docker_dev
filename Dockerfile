# e an official Python runtime as a parent image
FROM ubuntu

# Set the working directory to /app
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.9.4
RUN apt-get install -y nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get install -y npm
RUN apt-get install -y build-essential
RUN npm install -g pm2
RUN npm install -g nodemon

# install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package\*.json ./
RUN npm install

# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 8080

CMD ["npm", "run", "dev"]
