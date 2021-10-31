#!/bin/sh
cd /tmp/test_db && mysql < employees.sql && mysql -t < test_employees_md5.sql
