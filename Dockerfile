FROM node:18.17.1-buster
COPY ./ /app
WORKDIR /app
#RUN npm config set registry https://registry.npmjs.org
#RUN npm config set registry https://registry.npm.taobao.org
RUN npm config set registry https://registry.npmmirror.com
RUN npm cache clean --force
# RUN npm i node-sass --sass_binary_site=https://npm.taobao.org/mirrors/node-sass/ -D
RUN npm install
#RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build:prod
FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf

