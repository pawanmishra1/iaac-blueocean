FROM node:10-alpine
#FROM node:8.11-alpine

# Copy AppSource
COPY . /www/
#RUN cd /www; npm install
#RUN cd /www; npm run build
WORKDIR /www

# set your port
ENV PORT 4200
#EXPOSE  4200

# start command as per package.json
CMD ["/bin/sh", "-c", ". /etc/profile && npm run start-prod"]
