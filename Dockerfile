FROM httpd:2.4-alpine

RUN apk update && \
    apk upgrade && \
    apk add make && \
    apk add npm && \
    mkdir /composerize-website

COPY packages/composerize-website /composerize-website

RUN cd /composerize-website && \
    npm install yarn@1.19.1 -g && \
    yarn add composerize && \
    make build && \
    cp -r /composerize-website/build/. /usr/local/apache2/htdocs/ && \
    rm -rf /composerize-website

WORKDIR /usr/local/apache2/htdocs/

EXPOSE 80
