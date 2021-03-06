FROM node:12

# Create app directory
WORKDIR /var/www

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Add user for application
RUN groupadd -g 6666 www
RUN useradd -u 6666 -ms /bin/bash -g www www

# Bundle app source
COPY . .

# Change current user to www
USER www

EXPOSE 80

CMD ["npm", "start"]