#!/usr/bin/env bash

set -ex

mkdir -p source
curl -L https://wordpress.org/latest.tar.gz -o source/latest.tgz
tar zxvf source/latest.tgz -C source/
rm -fr source/wordpress/wp-content/

# Build dictionary files

## Action hooks dictionary
find source/wordpress -name "*.php" | xargs grep "do_action" \
| sed "s/^.*do_action/do_action/g"| sed "s/);.*/);/g" \
| sed "s/ //g" | sed "s/\"/\'/g" | sed "s/do_action(\'//g" \
| sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | tr -d ' ' | sed "/^$/d" | sort | uniq > ./data/action-hooks.dict

## Filter hooks dictionary
find source/wordpress -name "*.php" | xargs grep "apply_filters" \
| sed "s/^.*apply_filters/apply_filters/g"| sed "s/);.*/);/g" \
| sed "s/ //g" | sed "s/\"/\'/g" | sed "s/apply_filters(\'//g" \
| sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | tr -d ' ' | sed "/^$/d" | sort | uniq > ./data/filter-hooks.dict

## Functions dictionary
find source/wordpress -name "*.php" -exec egrep '^function ' {} \; \
| sed -e "s/function \(.*\)(.*/\1/g" | sed -e "s/^&//g" \
| sed -e "s/(.*$//g" | tr -d ' ' | sed "/^$/d" | sort | uniq > ./data/functions.dict

## Class dictionary
find source/wordpress -name "*.php" | xargs grep "^class" \
| sed "s/.*\:class //g" \
| sed "s/ .*//g" | tr -d ' ' | sed "/^$/d" | sort | uniq > ./data/classes.dict
