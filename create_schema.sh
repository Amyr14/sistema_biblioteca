#!/bin/sh
echo juntando arquivos SQL...
cat $(ls -r server/src/db/*.sql) > schema.sql
echo feito!