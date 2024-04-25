#!/bin/bash

if [[ $(/etc/init.d/php8.2-fpm status) ]]
then
  echo "fpm is running."
  exit 0
else
  echo "fpm is not running."
  exit 1
fi