package kr.ac.kopo.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.util.ConnectionFactory;

public class AccountDAO {
	
	public String makeAccountNumber(String userId) {
		
		int accountNum1 = 2;
		StringBuilder accountNum2 = new StringBuilder();
		int accountNum3;

		char[] id = userId.toCharArray();
		for(int i = 0; i < 2; i++) {
			int num = (int)id[i];
			accountNum2.append(num);
		}
		
		accountNum2.toString();
		
		Random random = new Random();
		
		while(true) {
	       accountNum3 = (int)random.nextInt(100000);
	       if(accountNum3>10000) {
	          break;
	       }
	    }
		
		StringBuilder stb = new StringBuilder();
		
		stb.append(accountNum1);
		stb.append("-");
		stb.append(accountNum2);
		stb.append("-");
		stb.append(accountNum3);
				
		return stb.toString(); 
		}
	
	public void insertAccount(AccountVO account) {
		
		StringBuilder sql = new StringBuilder();

		sql.append("INSERT INTO ACCOUNT(PHONE_NUMBER, ACCOUNT_NUMBER, ACCOUNT_PASSWORD, BANK_CODE, BANK_REG_DATE, BALANCE, BANK_ALIAS, TRANSFER_LIMIT) VALUES(?,?,?,'2',sysdate,?,?,?)");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			
			pstmt.setString(1, account.getPhoneNumber());
			pstmt.setString(2, account.getAccountNumber());
			pstmt.setString(3, account.getAccountPassword());
			pstmt.setInt(4, account.getBalance());
			pstmt.setString(5, account.getBankAlias());
			pstmt.setInt(6, account.getTransferLimit());
						
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public List<AccountVO> selectByParkBank(String phonenumber){
		
		List<AccountVO> accountList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT PHONE_NUMBER, ACCOUNT_NUMBER, ACCOUNT_PASSWORD, BANK_CODE, BANK_REG_DATE, BALANCE, BANK_ALIAS, TRANSFER_LIMIT FROM ACCOUNT@JIHOON2_BANK WHERE PHONE_NUMBER = ?");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
								
				) {
			
			pstmt.setString(1, phonenumber);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				
				String phoneNumber = rs.getString("PHONE_NUMBER");
				String accountNumber = rs.getString("ACCOUNT_NUMBER");
				String accountPassword = rs.getString("ACCOUNT_PASSWORD");
				String bankCode = rs.getString("BANK_CODE");
				String bankRegDate = rs.getString("BANK_REG_DATE");
				int balance = rs.getInt("BALANCE");
				String bankAlias = rs.getString("BANK_ALIAS");
				int transferLimit = rs.getInt("TRANSFER_LIMIT");
				
				AccountVO account = new AccountVO();
				
				account.setPhoneNumber(phoneNumber);
				account.setAccountNumber(accountNumber);
				account.setAccountPassword(accountPassword);
				account.setBankCode(bankCode);
				account.setBankRegDate(bankRegDate);
				account.setBalance(balance);
				account.setBankAlias(bankAlias);
				account.setTransferLimit(transferLimit);
				
				accountList.add(account);
				
			}		
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return accountList;
	
	}
	
public List<AccountVO> selectByJoBank(String phonenumber){
		
		List<AccountVO> accountList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT PHONE_NUMBER, ACCOUNT_NUMBER, ACCOUNT_PASSWORD, BANK_CODE, BANK_REG_DATE, BALANCE, BANK_ALIAS, TRANSFER_LIMIT FROM ACCOUNT@JO_LINK WHERE PHONE_NUMBER = ?");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
								
				) {
			
			pstmt.setString(1, phonenumber);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				
				String phoneNumber = rs.getString("PHONE_NUMBER");
				String accountNumber = rs.getString("ACCOUNT_NUMBER");
				String accountPassword = rs.getString("ACCOUNT_PASSWORD");
				String bankCode = rs.getString("BANK_CODE");
				String bankRegDate = rs.getString("BANK_REG_DATE");
				int balance = rs.getInt("BALANCE");
				String bankAlias = rs.getString("BANK_ALIAS");
				int transferLimit = rs.getInt("TRANSFER_LIMIT");
				
				AccountVO account = new AccountVO();
				
				account.setPhoneNumber(phoneNumber);
				account.setAccountNumber(accountNumber);
				account.setAccountPassword(accountPassword);
				account.setBankCode(bankCode);
				account.setBankRegDate(bankRegDate);
				account.setBalance(balance);
				account.setBankAlias(bankAlias);
				account.setTransferLimit(transferLimit);
				
				accountList.add(account);
				
			}		
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return accountList;
	
	}

public List<AccountVO> selectByYoonBank(String phonenumber){
	
	List<AccountVO> accountList = new ArrayList<>();
	
	StringBuilder sql = new StringBuilder();
	
	sql.append("SELECT PHONE_NUMBER, ACCOUNT_NUMBER, ACCOUNT_PASSWORD, BANK_CODE, BANK_REG_DATE, BALANCE, BANK_ALIAS, TRANSFER_LIMIT FROM ACCOUNT@YOONJB_LINK WHERE PHONE_NUMBER = ?");
	
	try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
							
			) {
		
		pstmt.setString(1, phonenumber);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			
			String phoneNumber = rs.getString("PHONE_NUMBER");
			String accountNumber = rs.getString("ACCOUNT_NUMBER");
			String accountPassword = rs.getString("ACCOUNT_PASSWORD");
			String bankCode = rs.getString("BANK_CODE");
			String bankRegDate = rs.getString("BANK_REG_DATE");
			int balance = rs.getInt("BALANCE");
			String bankAlias = rs.getString("BANK_ALIAS");
			int transferLimit = rs.getInt("TRANSFER_LIMIT");
			
			AccountVO account = new AccountVO();
			
			account.setPhoneNumber(phoneNumber);
			account.setAccountNumber(accountNumber);
			account.setAccountPassword(accountPassword);
			account.setBankCode(bankCode);
			account.setBankRegDate(bankRegDate);
			account.setBalance(balance);
			account.setBankAlias(bankAlias);
			account.setTransferLimit(transferLimit);
			
			accountList.add(account);
			
		}		
	} catch (Exception e) {
		
		e.printStackTrace();
		
	}
	
	return accountList;

}

	
	public List<AccountVO> selectByPhoneNumber(String phonenumber){
		
		List<AccountVO> accountList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT PHONE_NUMBER, ACCOUNT_NUMBER, ACCOUNT_PASSWORD, BANK_CODE, BANK_REG_DATE, BALANCE, BANK_ALIAS, TRANSFER_LIMIT FROM ACCOUNT WHERE PHONE_NUMBER = ?");
				
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				) {
			
			pstmt.setString(1, phonenumber);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				
				String phoneNumber = rs.getString("PHONE_NUMBER");
				String accountNumber = rs.getString("ACCOUNT_NUMBER");
				String accountPassword = rs.getString("ACCOUNT_PASSWORD");
				String bankCode = rs.getString("BANK_CODE");
				String bankRegDate = rs.getString("BANK_REG_DATE");
				int balance = rs.getInt("BALANCE");
				String bankAlias= rs.getString("BANK_ALIAS");
				int transferLimit = rs.getInt("TRANSFER_LIMIT");
				
				AccountVO account = new AccountVO();
			
				account.setPhoneNumber(phoneNumber);
				account.setAccountNumber(accountNumber);
				account.setAccountPassword(accountPassword);
				account.setBankCode(bankCode);
				account.setBankRegDate(bankRegDate);
				account.setBalance(balance);
				account.setBankAlias(bankAlias);
				account.setTransferLimit(transferLimit);
		
				accountList.add(account);
				
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			return accountList;
			
		}
	
//	public boolean checkPassword(String senderAccountNumber, String senderAccountPassword, String senderBankCode) {
//		
//		StringBuilder sql = new StringBuilder();
//		
//		switch(senderBankCode) {
//		
//		case "2":
//			sql.append("select phone_number, account_number, account_password, bank_code, bank_reg_date, balance, bank_alias, transfer_limit from account where account_number = ? and account_password = ?");
//			break;
//		
//		case "9":
//			sql.append("select phone_number, account_number, account_password, bank_code, bank_reg_date, balance, bank_alias, transfer_limit from account@pjh_link where account_number = ? and account_password = ?");
//			break;
//			
//		case "14":
//			sql.append("select phone_number, account_number, account_password, bank_code, bank_reg_date, balance, bank_alias, transfer_limit from account@yjb_link where account_number = ? and account_password = ?");
//			break;
//			
//		case "20":
//			sql.append("select phone_number, account_number, account_password, bank_code, bank_reg_date, balance, bank_alias, transfer_limit from account@jjh_link where account_number = ? and account_password = ?");
//			break;
//			
//		default:
//			break;
//		}
//		
//		try(
//				Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//				
//				) {
//				 pstmt.setString(1, senderAccountNumber);
//				 pstmt.setString(2, senderAccountPassword);
//				 ResultSet rs = pstmt.executeQuery();
//				 
//				 if(rs.next()) {
//					 return true;
//				 }
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return false;
//		
//	}
	
	public void transferProcess(String senderAccountNumber, String receiverAccountNumber, int transferAmount, String senderBankCode, String receiverBankCode) {
		
		StringBuilder sql1 = new StringBuilder();
		StringBuilder sql2 = new StringBuilder();
		
		// 당행 이체
		
		if(senderBankCode.equals("2") && receiverBankCode.equals("2")) {
			
			sql1.append("update account set balance = balance-? where account_number=?");
			sql2.append("update account set balance = balance+? where account_number=?");
		
		// 2(BK) to all
		}
		if(senderBankCode.equals("2") && receiverBankCode.equals("9")) {
			
			sql1.append("update account set balance = balance-? where account_number=?");
			sql2.append("update account@JIHOON2_BANK set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("2") && receiverBankCode.equals("14")) {
			
			sql1.append("update account set balance = balance-? where account_number=?");
			sql2.append("update account@YOONJB_LINK set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("2") && receiverBankCode.equals("20")) {
			
			sql1.append("update account set balance = balance-? where account_number=?");
			sql2.append("update account@JO_LINK set balance = balance+? where account_number=?");
			
		}
		
		// 9(pjh) to all
		if(senderBankCode.equals("9") && receiverBankCode.equals("9")) {
			
			sql1.append("update account@JIHOON2_BANK set balance = balance-? where account_number=?");
			sql2.append("update account@JIHOON2_BANK set balance = balance+? where account_number=?");
			
		}		
		if(senderBankCode.equals("9") && receiverBankCode.equals("2")) {
			
			sql1.append("update account@JIHOON2_BANK set balance = balance-? where account_number=?");
			sql2.append("update account set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("9") && receiverBankCode.equals("14")) {
			
			sql1.append("update account@JIHOON2_BANK set balance = balance-? where account_number=?");
			sql2.append("update account@YOONJB_LINK set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("9") && receiverBankCode.equals("20")) {
			
			sql1.append("update account@JIHOON2_BANK set balance = balance-? where account_number=?");
			sql2.append("update account@JO_LINK set balance = balance+? where account_number=?");
			
		}
		//14(yjb) to all
		if(senderBankCode.equals("14") && receiverBankCode.equals("14")) {
			
			sql1.append("update account@YOONJB_LINK set balance = balance-? where account_number=?");
			sql2.append("update account@YOONJB_LINK set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("14") && receiverBankCode.equals("2")) {
			
			sql1.append("update account@YOONJB_LINK set balance = balance-? where account_number=?");
			sql2.append("update account set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("14") && receiverBankCode.equals("9")) {
			
			sql1.append("update account@YOONJB_LINK set balance = balance-? where account_number=?");
			sql2.append("update account@JIHOON2_BANK set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("14") && receiverBankCode.equals("20")) {
			
			sql1.append("update account@YOONJB_LINK set balance = balance-? where account_number=?");
			sql2.append("update account@JO_LINK set balance = balance+? where account_number=?");
			
		}
		//20(jjh) to all
		if(senderBankCode.equals("20") && receiverBankCode.equals("20")) {
			
			sql1.append("update account@JO_LINK set balance = balance-? where account_number=?");
			sql2.append("update account@JO_LINK set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("20") && receiverBankCode.equals("2")) {
			
			sql1.append("update account@JO_LINK set balance = balance-? where account_number=?");
			sql2.append("update account set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("20") && receiverBankCode.equals("9")) {
			
			sql1.append("update account@JO_LINK set balance = balance-? where account_number=?");
			sql2.append("update account@JIHOON2_BANK set balance = balance+? where account_number=?");
			
		}
		if(senderBankCode.equals("20") && receiverBankCode.equals("14")) {
			
			sql1.append("update account@JO_LINK set balance = balance-? where account_number=?");
			sql2.append("update account@YOONJB_LINK set balance = balance+? where account_number=?");
			
		}
		
		try(
				Connection conn1 = new ConnectionFactory().getConnection();
				Connection conn2 = new ConnectionFactory().getConnection();
				
				PreparedStatement pstmt1= conn1.prepareStatement(sql1.toString());
				PreparedStatement pstmt2= conn2.prepareStatement(sql2.toString());
				
				) {
			
			pstmt1.setInt(1, transferAmount);
			pstmt1.setString(2, senderAccountNumber);
			
			pstmt2.setInt(1, transferAmount);
			pstmt2.setString(2, receiverAccountNumber);
			
			pstmt1.executeUpdate();
			pstmt2.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}



