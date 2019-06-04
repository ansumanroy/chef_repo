#!/bin/sh
# Sample shell script to read and act on properties
  
# source the properties:
. ./dotproperty.properties
  
# Then reference then:
echo "My name is $name and I'm $age years old."
