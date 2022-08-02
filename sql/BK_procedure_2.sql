CREATE SEQUENCE seq_transaction_history_no nocache;

--park to all 
CREATE OR REPLACE PROCEDURE transaction_history_park(
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

IF senderBankCode ='9' and receiverBankCode ='2' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@JIHOON2_BANK A, b_member@JIHOON2_BANK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE;
        
        SELECT A.balance, B.cus_name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account A, BK_Bank_customer B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM;
    
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
            commit;
    end if;
    IF senderBankCode ='9' and receiverBankCode ='9' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@JIHOON2_BANK A, b_member@JIHOON2_BANK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@JIHOON2_BANK A, b_member@JIHOON2_BANK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE;
    
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
    commit;
    end if;
    
    IF senderBankCode ='9' and receiverBankCode ='14' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@JIHOON2_BANK A, b_member@JIHOON2_BANK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@YOONJB_LINK A, member@YOONJB_LINK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE_NO;
    
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
    commit;
    end if;

    IF senderBankCode ='9' and receiverBankCode ='20' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@JIHOON2_BANK A, b_member@JIHOON2_BANK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@JO_LINK A, customer@JO_LINK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE_NUMBER;
    
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
    commit;
    end if;
    
    commit;
end;
/

--yoon to all
CREATE OR REPLACE PROCEDURE transaction_history_yoon_2(
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

    IF senderBankCode ='14' and receiverBankCode ='2' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@YOONJB_LINK A, member@YOONJB_LINK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE_NO;
        
        SELECT A.balance, B.cus_name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account A, BK_Bank_customer B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM;
    
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
        commit;    
    end if;
    IF senderBankCode ='14' and receiverBankCode ='9' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@YOONJB_LINK A, member@YOONJB_LINK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE_NO;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@JIHOON2_BANK A, b_member@JIHOON2_BANK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE;
  
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
        commit;
    end if;
    IF senderBankCode ='14' and receiverBankCode ='14' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@YOONJB_LINK A, member@YOONJB_LINK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE_NO;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@YOONJB_LINK A, member@YOONJB_LINK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE_NO;
  
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
        commit;
    end if;
    IF senderBankCode ='14' and receiverBankCode ='20' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@YOONJB_LINK A, member@YOONJB_LINK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE_NO;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@JO_LINK A, customer@JO_LINK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE_NUMBER;
  
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
        commit;
    end if;
    commit;
end;
/

--jo to all
CREATE OR REPLACE PROCEDURE transaction_history_jo_3(
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

        IF senderBankCode ='20' and receiverBankCode ='2' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@JO_LINK A, customer@JO_LINK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE_NUMBER;
        
        SELECT A.balance, B.cus_name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account A, BK_Bank_customer B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM;
  
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
        commit;
    end if;
    IF senderBankCode ='20' and receiverBankCode ='9' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@JO_LINK A, customer@JO_LINK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE_NUMBER;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@JIHOON2_BANK A, b_member@JIHOON2_BANK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE;
  
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
        commit;
    end if;
    IF senderBankCode ='20' and receiverBankCode ='14' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@JO_LINK A, customer@JO_LINK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE_NUMBER;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@YOONJB_LINK A, member@YOONJB_LINK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE_NO;
  
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
        commit;
    end if;
    IF senderBankCode ='20' and receiverBankCode ='20' THEN
        SELECT A.balance, B.name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account@JO_LINK A, customer@JO_LINK B
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.PHONE_NUMBER;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@JO_LINK A, customer@JO_LINK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE_NUMBER;
  
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
        commit;
    end if;
    commit;
end;
/

--bk to all

CREATE OR REPLACE PROCEDURE transaction_history_bk_7(
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
--2 TO ALL
    IF senderBankCode ='2' and receiverBankCode ='2' THEN
        SELECT A.balance, B.cus_name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account A, BK_Bank_customer B 
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM;
        
        SELECT A.balance, B.cus_name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account A, BK_Bank_customer B 
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM;
    
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
    IF senderBankCode ='2' and receiverBankCode ='9' THEN
        SELECT A.balance, B.cus_name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account A, BK_Bank_customer B 
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@JIHOON2_BANK A, b_member@JIHOON2_BANK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE;
    
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
    IF senderBankCode ='2' and receiverBankCode ='14' THEN
    SELECT A.balance, B.cus_name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
    FROM account A, BK_Bank_customer B 
    WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM;
    
    SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
    FROM account@YOONJB_LINK A, member@YOONJB_LINK B
    WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE_NO;
    
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
    IF senderBankCode ='2' and receiverBankCode ='20' THEN
        SELECT A.balance, B.cus_name, A.phone_number INTO sender_balance, sender_name, sender_phone_number 
        FROM account A, BK_Bank_customer B 
        WHERE A.account_number = senderAccountNumber and A.PHONE_NUMBER = B.CUS_PHONE_NUM;
        
        SELECT A.balance, B.name, A.phone_number INTO receiver_balance, receiver_name, receiver_phone_number 
        FROM account@JO_LINK A, customer@JO_LINK B
        WHERE A.account_number = receiverAccountNumber and A.PHONE_NUMBER = B.PHONE_NUMBER;
    
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
    commit;
end;
/

