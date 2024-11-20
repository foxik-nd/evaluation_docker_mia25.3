FROM node:18
WORKDIR /usr/src/app
COPY src/ .
COPY src/package.json ./
COPY src/.env .
RUN npm install
EXPOSE 4743
CMD ["npm", "start"]