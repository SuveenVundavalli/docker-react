FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN ["yarn", "build"] 

# this above config will generate the build files into /app/build/

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
