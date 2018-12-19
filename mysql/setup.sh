#!/bin/bash
cd /tmp && tar -xzvf db.sql.tar.gz
mysql -u root -proot db < /tmp/db.sql