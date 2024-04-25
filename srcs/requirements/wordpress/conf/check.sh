#!/bin/bash

if [ -f /var/www/http/wp-config.php ]
then
  echo "wordpress is installed"
  exit 0
else
  echo "wordpress is not installed"
  exit 1
fi