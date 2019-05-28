#!/bin/bash

nginx -p $(pwd) -c nginx.conf -g 'daemon off;'