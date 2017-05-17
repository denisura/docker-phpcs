FROM denisura/composer
MAINTAINER Denis Uraganov <github@uraganov.net>

RUN echo "phar.readonly = 0" >> /usr/local/etc/php/php.ini
RUN composer self-update
RUN composer create-project --no-dev "squizlabs/php_codesniffer=3.0.*@dev"
RUN php php_codesniffer/scripts/build-phar.php
RUN chmod +x *.phar

RUN mv phpcbf.phar  /usr/local/bin/phpcbf
RUN mv phpcs.phar   /usr/local/bin/phpcs

RUN rm -rf php_codesniffer
RUN rm -rf /usr/local/bin/composer

ENTRYPOINT [""]
CMD ["phpcbf"]
CMD ["phpcs"]
