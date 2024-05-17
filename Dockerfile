FROM node:16-slim
WORKDIR /my-app 
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]