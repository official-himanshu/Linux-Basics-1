#!/bin/bash

var= df -h | grep 'sda2' | awk '{ print $5,$1}'

echo $var
