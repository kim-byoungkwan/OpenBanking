SET DEFINE OFF;
--SERVER에 접속하기 위함임

BEGIN
    DBMS_CLOUD.CREATE_CREDENTIAL(
            credential_name => 'CRED_TENANT_USER_JIHOON2', --밑의 정보들이 여기에 저장됨 
            username => 'bg0307@ajou.ac.kr',
            password => 'PWZH1mbeLM.:X&W$Vo8C');
END;
/

create directory JIHOON2_WALLET_DIR as 'jihoon2/wallet'; --내 디렉토리에 접속하려는 상대에 관한 WALLET을 만듦


BEGIN
    DBMS_CLOUD.GET_OBJECT (
            credential_name => 'CRED_TENANT_USER_JIHOON2',
            object_uri => 'https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnv5ycwccchi/b/bucket-jh/o/cwallet.sso',
            directory_name => 'JIHOON2_WALLET_DIR');
END;
/


GRANT EXECUTE on DBMS_CLOUD_ADMIN to ADMIN;
GRANT EXECUTE on DBMS_CLOUD to ADMIN;
GRANT CREATE DATABASE LINK to ADMIN; --이거만 실행해주자~! 

--DB 
BEGIN
    DBMS_CLOUD.CREATE_CREDENTIAL(
            credential_name => 'CRED_DB_LINK2JIHOON2', --DB LINK NMAE이 필요함
            username => 'ADMIN',
            password => 'Q1w2e3r4t5y6'); -- DBMS 이름 상대방이 정해준거 써줌.  
END;
/



BEGIN
    DBMS_CLOUD_ADMIN.CREATE_DATABASE_LINK(
            db_link_name => 'JIHOON2_BANK',
            hostname => 'adb.ap-seoul-1.oraclecloud.com', --접속하련느 상대의 HOSTNAME이 필요함. 
            port => '1522',
            service_name => 'g056d9c21f74396_jhcloud_medium.adb.oraclecloud.com',
            ssl_server_cert_dn => 'CN=adb.ap-seoul-1.oraclecloud.com, OU=Oracle ADB SEOUL, O=Oracle Corporation, L=Redwood City, ST=California, C=US',
            credential_name => 'CRED_DB_LINK2JIHOON',
            directory_name => 'JIHOON2_WALLET_DIR');
END;
/

SELECT * FROM account@JIHOON2_BANK;

SELECT * FROM b_member@JIHOON2_BANK;

DELETE FROM b_member@JIHOON2_BANK WHERE NAME = '김길동';

COMMIT;

SELECT * FROM tabs@JIHOON2_BANK;

commit;

INSERT INTO b_member@JIHOON2_BANK VALUES('bg0307','1234','김병관','bg0307@ajou.ac.kr','01077106366','경기광명');
INSERT INTO b_member@JIHOON2_BANK VALUES('jaehee3679','1234','조재희','jaehee@kopo','01029523679','경기광명');

COMMIT;

INSERT INTO account@JIHOON2_BANK VALUES('01077106366', '9-123-66666','123','9', SYSDATE, 8999, '적금', 88888);
INSERT INTO account@JIHOON2_BANK VALUES('01029523679', '9-444-77777','123','9', SYSDATE, 1000, '적금', 55555);


SELECT PHONE_NUMBER, ACCOUNT_NUMBER, ACCOUNT_PASSWORD, BANK_CODE, BANK_REG_DATE, BALANCE, BANK_ALIAS, TRANSFER_LIMIT FROM ACCOUNT@JIHOON2_BANK WHERE PHONE_NUMBER = '01077106366';