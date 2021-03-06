CREATE DATABASE sampleapp;
CREATE USER 'sampleapp'@'%' IDENTIFIED BY 'Zs}qAPTBJ}tQr';
GRANT ALL PRIVILEGES ON sampleapp.* TO 'sampleapp'@'%';

CREATE USER 'mysqlbackup'@'%' IDENTIFIED BY '_d{NJ4i281Pp1';
GRANT SELECT, LOCK TABLES ON *.* TO 'mysqlbackup'@'%';
GRANT SELECT, BACKUP_ADMIN, RELOAD, PROCESS, SUPER, REPLICATION CLIENT ON *.* TO 'mysqlbackup'@'%';
GRANT CREATE, INSERT, DROP, UPDATE ON mysql.backup_progress TO 'mysqlbackup'@'%'; 
GRANT CREATE, INSERT, DROP, UPDATE, SELECT, ALTER ON mysql.backup_history TO 'mysqlbackup'@'%';

FLUSH PRIVILEGES;
