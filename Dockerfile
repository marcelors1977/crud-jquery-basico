FROM php:7.4-alpine

RUN addgroup phpgroup && adduser -D -G phpgroup php

WORKDIR /home/php/myapp

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apk add --no-cache bash && docker-php-ext-install pdo pdo_mysql

# COPY . /usr/src/myapp
COPY . /home/php/myapp

# CMD [ "tail", "-f", "/dev/null" ]
# CMD [ "php","-S","0.0.0.0:8000","-t","public","public/index.php" ]

USER php