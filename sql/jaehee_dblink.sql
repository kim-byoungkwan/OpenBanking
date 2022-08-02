BEGIN
    DBMS_CLOUD.CREATE_CREDENTIAL(
            credential_name => 'CRED_TENANT_USER_JO',
            username => 'jaehee3679@daum.net',
            password => 'o5ihl0_6ayNYohc#SpTT');
END;
/


create directory JO_WALLET_DIR as 'JO/wallet';


BEGIN
    DBMS_CLOUD.GET_OBJECT (
            credential_name => 'CRED_TENANT_USER_JO',
            object_uri => 'https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnmhjui8zwom/b/OpenBanking/o/cwallet.sso',
            directory_name => 'JO_WALLET_DIR');
END;
/


GRANT EXECUTE on DBMS_CLOUD_ADMIN to ADMIN;
GRANT EXECUTE on DBMS_CLOUD to ADMIN;
GRANT CREATE DATABASE LINK to ADMIN;

BEGIN
    DBMS_CLOUD.CREATE_CREDENTIAL(
            credential_name => 'CRED_DB_LINK2JO',
            username => 'ADMIN',
            password => 'Wogml2260341020');
END;
/

BEGIN
    DBMS_CLOUD_ADMIN.CREATE_DATABASE_LINK(
            db_link_name => 'JO_LINK',
            hostname => 'adb.ap-seoul-1.oraclecloud.com',
            port => '1522',
            service_name => 'gc0e4237866b5c2_jaehee3679_medium.adb.oraclecloud.com',
            ssl_server_cert_dn => 'CN=adb.ap-seoul-1.oraclecloud.com, OU=Oracle ADB SEOUL, O=Oracle Corporation, L=Redwood City, ST=California, C=US',
            credential_name => 'CRED_DB_LINK2JO',
            directory_name => 'JO_WALLET_DIR');
END;
/

select * from account@JO_LINK;

select * from customer@JO_LINK;

INSERT INTO ACCOUNT@JO_LINK VALUES('01077106366', '33232-50-12212', '1234', '20', SYSDATE, 119119, '식비', 229229);
INSERT INTO ACCOUNT@JO_LINK VALUES('01011112222', '9-12222-32144', '1234', '20', SYSDATE, 444544, '학원', 1000000);

INSERT INTO customer@JO_LINK VALUES('윤정빈','990912212121','kakao81073','1234',sysdate,'F','01040487112','구미시', 'yoon','U','13322','Y');
INSERT INTO customer@JO_LINK VALUES('박지훈','930912212121','liam1993@naver.com','1234',sysdate,'M','01011112222','이천시', 'park','U','134722','Y');

commit;