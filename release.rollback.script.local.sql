--  *********************************************************************
--  SQL to roll back currently unexecuted changes
--  *********************************************************************
--  Change Log: ../sql/liquibase.changeLogFile.xml
--  Ran at: 4/8/16 10:05 PM
--  Against: root@localhost@jdbc:mysql://localhost:3306/testRelease?useUnicode=true&characterEncoding=utf8&connectTimeout=10000&socketTimeout=1800000&jdbcCompliantTruncation=false
--  Liquibase version: 3.4.0
--  *********************************************************************

--  Create Database Lock Table
CREATE TABLE DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

--  Initialize Database Lock Table
DELETE FROM DATABASECHANGELOGLOCK;

INSERT INTO DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

--  Lock Database
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'vlasiuk (10.24.64.91)', LOCKGRANTED = '2016-04-08 22:05:51.739' WHERE ID = 1 AND LOCKED = 0;

--  Create Database Change Log Table
CREATE TABLE DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL);

--  Rolling Back ChangeSet: ../sql/liquibase.changeLogFile.xml::2::nvoxland
ALTER TABLE department DROP COLUMN username;

DELETE FROM DATABASECHANGELOG WHERE ID = '2' AND AUTHOR = 'nvoxland' AND FILENAME = '../sql/liquibase.changeLogFile.xml';

--  Rolling Back ChangeSet: ../sql/liquibase.changeLogFile.xml::1::wa
DROP TABLE department;

DELETE FROM DATABASECHANGELOG WHERE ID = '1' AND AUTHOR = 'wa' AND FILENAME = '../sql/liquibase.changeLogFile.xml';

--  Release Database Lock
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

