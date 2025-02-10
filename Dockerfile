FROM node:lts AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

ENV HOST=127.0.0.1
ENV PORT=4321
EXPOSE 4321
CMD node ./dist/server/entry.mjs

# FROM httpd:2.4 AS runtime
# COPY --from=build /app/dist /usr/local/apache2/htdocs/
# EXPOSE 80