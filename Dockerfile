#Build phase
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

#we do not need volume definition here because in production we do not need immediate code changeds

RUN npm run build

#Run phase

FROM nginx

COPY --from=builder /app/build  /user/share/ngnix/html

