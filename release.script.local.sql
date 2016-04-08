--  *********************************************************************
--  Update Database Script
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
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'vlasiuk (10.24.64.91)', LOCKGRANTED = '2016-04-08 22:05:50.815' WHERE ID = 1 AND LOCKED = 0;

--  Create Database Change Log Table
CREATE TABLE DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL);

--  Changeset ../sql/liquibase.changeLogFile.xml::1::wa
CREATE TABLE department (id INT NOT NULL, name VARCHAR(50) NOT NULL, active BIT(1) DEFAULT 1 NULL, CONSTRAINT PK_DEPARTMENT PRIMARY KEY (id));

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('1', 'wa', '../sql/liquibase.changeLogFile.xml', NOW(), 1, '7:17a94fcdd73aa8852c1f53e4d06ee651', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

--  Changeset ../sql/liquibase.changeLogFile.xml::2::nvoxland
ALTER TABLE department ADD username VARCHAR(8) NULL;

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('2', 'nvoxland', '../sql/liquibase.changeLogFile.xml', NOW(), 2, '7:d65681245f004b8599083a2b5658bfe0', 'addColumn', '', 'EXECUTED', NULL, NULL, '3.4.0');

--  Release Database Lock
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

