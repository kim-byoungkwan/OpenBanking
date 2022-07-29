CREATE TABLE ACCOUNT(
    PHONE_NUMBER VARCHAR2(50) NOT NULL,
    ACCOUNT_NUMBER VARCHAR2(50) PRIMARY KEY,
    ACCOUNT_PASSWORD VARCHAR2(30) NOT NULL,
    BANK_CODE VARCHAR2(10) NOT NULL,
    BANK_REG_DATE VARCHAR2(50) DEFAULT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'),
    BALANCE NUMBER(20) NOT NULL,
    BANK_ALIAS VARCHAR2(50) NOT NULL,
    TRANSFER_LIMIT NUMBER(10) NOT NULL
);

INSERT INTO ACCOUNT VALUES ('01011112222', '2-98103-28281', '1234', 2, SYSDATE, 10000, '적금', 1000000);

SELECT * FROM ACCOUNT;

DROP TABLE ACCOUNT;

CREATE TABLE TRANSACTION_HISTORY(
    TRAN_NUM NUMBER(10) PRIMARY KEY,
    WITHRAWAL_ACCOUNT_NUM VARCHAR2(30) NOT NULL,
    DEPOSIT_ACCOUNT_NUM VARCHAR2(30) NOT NULL,
    WITHRAWAL_NAME VARCHAR2(30) NOT NULL,
    DEPOSIT_NAME VARCHAR2(30) NOT NULL,
    WITHRAWAL_BANK_CODE VARCHAR2(20) NOT NULL,
    DEPOSIT_BANK_CODE VARCHAR2(10) NOT NULL,
    WITHRAWAL_PHONE_NUMBER VARCHAR2(30) NOT NULL,
    DEPOSIT_PHONE_NUMBER VARCHAR2(30) NOT NULL,
    TRAN_AMOUNT NUMBER(10) NOT NULL,
    TRAN_DATE VARCHAR2(50) DEFAULT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS')
);

DROP TABLE TRANSACTION_HISTORY;

INSERT INTO transaction_history 
VALUES(seq_transaction_history_no.nextval,'2-33333-11111','2-33333-22222', '김병관', '김병관', '2', '2', '01077106366','01077106366', '77777', sysdate);

commit;

SELECT * FROM transaction_history;

SELECT TRAN_NUM,
          WITHRAWAL_ACCOUNT_NUM,
          DEPOSIT_ACCOUNT_NUM,
          WITHRAWAL_NAME,
          DEPOSIT_NAME,
          WITHRAWAL_BANK_CODE,
          DEPOSIT_BANK_CODE,
          WITHRAWAL_PHONE_NUMBER,
          DEPOSIT_PHONE_NUMBER,
          TRAN_AMOUNT,
          TRAN_DATE 
FROM TRANSACTION_HISTORY
WHERE WITHRAWAL_PHONE_NUMBER = '01077106366';

SELECT TRAN_NUM, WITHRAWAL_ACCOUNT_NUM, DEPOSIT_ACCOUNT_NUM, WITHRAWAL_NAME, DEPOSIT_NAME, WITHRAWAL_BANK_CODE, DEPOSIT_BANK_CODE, WITHRAWAL_PHONE_NUMBER, DEPOSIT_PHONE_NUMBER, TRAN_AMOUNT, TRAN_DATE FROM TRANSACTION_HISTORY WHERE WITHRAWAL_PHONE_NUMBER = '01077106366';


DELETE FROM transaction_history WHERE DEPOSIT_NAME = '김병관';

commit;

------procedure--------

CREATE SEQUENCE seq_transaction_history_no nocache;

CREATE OR REPLACE PROCEDURE transaction_history_2(
    userId in varchar2,
    cusPhonenumber in varchar2,
    senderAccountNumber in varchar2,
    receiverAccountNumber in varchar2,
    senderBankCode in varchar2,
    receiverBankCode in varchar2,
    transferAmount in number
    )
AS 
    sender_balance number(20);
    receiver_balance number(20);
    sender_name varchar2(50);
    receiver_name varchar2(50);
    sender_phone_number varchar2(20);
    receiver_phone_number varchar2(20);
    
BEGIN
    IF senderBankCode ='02' and receiverBankCode ='02' THEN
        SELECT A.balance, B.cus_name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account A, BK_Bank_customer B 
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM and rownum<=1;
        
        SELECT A.balance, B.cus_name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account A, BK_Bank_customer B 
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM and rownum<=1;
    
        INSERT INTO TRANSACTION_HISTORY(
            TRAN_NUM,
            WITHRAWAL_ACCOUNT_NUM,
            DEPOSIT_ACCOUNT_NUM,
            WITHRAWAL_NAME, DEPOSIT_NAME,
            WITHRAWAL_BANK_CODE,
            DEPOSIT_BANK_CODE,
            WITHRAWAL_PHONE_NUMBER,
            DEPOSIT_PHONE_NUMBER,
            TRAN_AMOUNT, TRAN_DATE
            ) 
        VALUES(
            seq_transaction_history_no.nextval, 
            senderAccountNumber,
            receiverAccountNumber,
            sender_name,
            receiver_name,
            senderBankCode,
            receiverBankCode,
            sender_phone_number,
            receiver_phone_number,
            transferAmount,
            sysdate
            );
    end if;
end;
/
--------------------------------

SELECT A.balance, B.cus_name, A.phone_number 
FROM account A, BK_Bank_customer B
WHERE A.account_number = '2-98103-12614' and A.PHONE_NUMBER = B.CUS_PHONE_NUM;


commit;


SELECT * FROM TRANSACTION_HISTORY;

DROP TABLE TRANSACTION_HISTORY;


CREATE TABLE BK_Bank_customer(
    CUS_NUMBER VARCHAR2(30),
    CUS_NAME VARCHAR2(30),
    CUS_PHONE_NUM VARCHAR2(30),
    CUS_ID VARCHAR2(30),
    CUS_PW VARCHAR2(30),
    CUS_EMAIL_ADDRESS VARCHAR2(30),
    CUS_OCCUPATION VARCHAR2(30),
    JOIN_PATH VARCHAR2(30),
    ACCOUNT_NUMBER VARCHAR2(30)
    );


INSERT INTO BK_Bank_customer VALUES(seqCus.nextval, '김병관', '01077106366', 'bg0307', '1234', 'bg0307@ajou.ac.kr', '학생', '온라인', 'NULL');

DELETE FROM BK_Bank_customer WHERE CUS_PHONE_NUM = '01077106366';
    
DROP TABLE BK_Bank_customer;
    
SELECT * FROM BK_Bank_customer;

commit;


    
CREATE SEQUENCE seqCus;

DROP SEQUENCE  seqCus;    
    
    CREATE TABLE BANK_CODE(
    BANK_CODE VARCHAR2(50) PRIMARY KEY,
    BANK_NAME VARCHAR2(50) NOT NULL
);


CREATE TABLE BOARD(
    NO NUMBER(20),
    WRITER VARCHAR2(30),
    TITLE VARCHAR2(30),
    CONTENT VARCHAR2(30),
    WRITEDAY VARCHAR2(30),
    USERID VARCHAR2(30),
    BOARDTYPE VARCHAR2(30)
    );



            
    
