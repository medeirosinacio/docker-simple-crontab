#!/usr/bin/env bash

SCRIPT_FILENAME=cron_file.php \
  REQUEST_METHOD=GET \
  cgi-fcgi -bind -connect =php-fpm:=9000

#  SCRIPT_FILENAME=${PHP_FILE} \
#       REQUEST_METHOD=GET \
#       cgi-fcgi -bind -connect =${PHPFPM_HOST}:=${PHPFPM-PORT}