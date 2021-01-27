FROM node:14 as building

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

CMD ["npm", "run", "build"]

FROM nginx
COPY --from=building /app/build /usr/share/nginx/html