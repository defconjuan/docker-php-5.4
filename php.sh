#!/usr/bin/env bash

sudo docker run --rm -i -t -v $(pwd):/src simpledrupalcloud/php:5.3.28 "${@}"
