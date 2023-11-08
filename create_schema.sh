#!/bin/sh
cat $(ls -r server/src/db/*.sql) > schema.sql