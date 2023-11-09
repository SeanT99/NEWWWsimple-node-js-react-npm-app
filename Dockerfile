FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install
CMD ["ls","-la"]
CMD ["node", "src/app.js"]
EXPOSE 3000