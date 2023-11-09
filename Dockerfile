FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "src/app.js"]
EXPOSE 3000