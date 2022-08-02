BEGIN
    DBMS_CLOUD.CREATE_CREDENTIAL(
            credential_name => 'CRED_TENANT_USER_YOONJB',
            username => 'binifia@gmail.com',
            password => '7OjJew(.2ltIPipv2uUt');
END;
/

create directory YOONJB_WALLET_DIR as 'yoonjb/wallet';

BEGIN
    DBMS_CLOUD.GET_OBJECT (
            credential_name => 'CRED_TENANT_USER_YOONJB',
            object_uri => 'https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnjqvwkk4m2b/b/bucket-2260341014/o/cwallet.sso',
            directory_name => 'YOONJB_WALLET_DIR');
END;
/

GRANT EXECUTE on DBMS_CLOUD_ADMIN to ADMIN;
GRANT EXECUTE on DBMS_CLOUD to ADMIN;
GRANT CREATE DATABASE LINK to ADMIN;


BEGIN
    DBMS_CLOUD.CREATE_CREDENTIAL(
            credential_name => 'CRED_DB_LINK2YOONJB',
            username => 'ADMIN',
            password => 'Wjdqls2260341014');
END;
/


BEGIN
    DBMS_CLOUD_ADMIN.CREATE_DATABASE_LINK(
            db_link_name => 'YOONJB_LINK',
            hostname => 'adb.ap-seoul-1.oraclecloud.com',
            port => '1522',
            service_name => 'gc663c50f7bb642_jbdb_medium.adb.oraclecloud.com',
            ssl_server_cert_dn => 'CN=adb.ap-seoul-1.oraclecloud.com, OU=Oracle ADB SEOUL, O=Oracle Corporation, L=Redwood City, ST=California, C=US',
            credential_name => 'CRED_DB_LINK2YOONJB',
            directory_name => 'YOONJB_WALLET_DIR');
END;
/


INSERT INTO ACCOUNT@YOONJB_LINK VALUES ('01077106366', '2-12232-23322', '1234', '14', SYSDATE, 1000, '식비', 'BK BANK', 100000, '김병관', 'bg0307');

DELETE FROM ACCOUNT@YOONJB_LINK WHERE PHONE_NUMBER = '01077106366';

select * from member@YOONJB_LINK;

desc member@yoonjb_link;

INSERT INTO member@YOONJB_LINK VALUES('00002','K','bg0307','1234','김병관','01077106366','bg0307@ajou.ac.kr',NULL,NULL,sysdate, '오픈', NULL);
commit;

select * from tabs@YOONJB_LINK;

commit;

