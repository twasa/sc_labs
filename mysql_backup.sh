#!/bin/bash
mysql_cmd="/usr/bin/mysql"
mysqldump_cmd="/usr/bin/mysqldump"
date_time_pattern="%Y%m%d%H"
file_name_pattern="mysql-DTFORMAT-DBNAME.sql.gz"
exclude_db_list=(information_schema performance_schema sys)
DB_HOST=mysql
DB_PORT=3306
backup_to="/opt/mysql_backup"

if ! [[ -f $mysqldump_cmd ]]; then
    echo "mysqldump command not found"
    exit 1
fi

backup_dbs() {
    db_list_string=$($mysql_cmd -e 'show databases\G;' | grep Database | awk '{print $2}')
    db_list=($db_list_string)
    dt_format=$(date +"${date_time_pattern}")
    echo "DB backup starting..."
    for db in "${db_list[@]}"
        do
            if [[ ! "${exclude_db_list[@]}" =~ "${db}" ]]; then
                filename=$(echo $file_name_pattern | sed "s/DTFORMAT-DBNAME/$dt_format-$db/g")
                echo "backup DB: $db ..."
                $mysqldump_cmd --databases $db | gzip -c > "$backup_to/$filename"
            fi
        done
    echo "DB backup completed"
}

remove_archive_file() {
    find $backup_to -name "*.sql.gz" -ctime +10 -type f -delete
}

remove_archive_file
backup_dbs
