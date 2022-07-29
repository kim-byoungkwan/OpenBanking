package kr.ac.kopo.account.service;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;

public class AccountService {
	
	private AccountDAO accountDao;
	
	public AccountService() {
		accountDao = new AccountDAO();
	}
	
	public void addAccount(AccountVO account, String userId) {
		
		String accountNumber = accountDao.makeAccountNumber(userId);
		
		account.setAccountNumber(accountNumber);
		
		accountDao.insertAccount(account);
	}
	
	public List<AccountVO> selectByPhoneNumber(String phonenumber){
		
		List<AccountVO> accountList = new ArrayList<>();
		accountList = accountDao.selectByPhoneNumber(phonenumber);
		
		return accountList;
		
	}
	
	//JIHOON Bank 조회
	public List<AccountVO> selectByParkBank(String phonenumber){
		
		List<AccountVO> accountList = new ArrayList<>();
		accountList = accountDao.selectByParkBank(phonenumber);
		return accountList;
				
	}
	
	//JO Bank 조회
	public List<AccountVO> selectByJoBank(String phonenumber){
		
		List<AccountVO> accountList = new ArrayList<>();
		accountList = accountDao.selectByJoBank(phonenumber);
		return accountList;
				
	}
	
	//YOON Bank 조회
	public List<AccountVO> selectByYoonBank(String phonenumber){
		
		List<AccountVO> accountList = new ArrayList<>();
		accountList = accountDao.selectByYoonBank(phonenumber);
		return accountList;
				
	}
	
	
	
	
//	public boolean checkPassword(String senderAccountNumber, String senderAccountPassword, String senderBankCode) {
//		
//		return accountDao.checkPassword(senderAccountNumber, senderAccountPassword, senderBankCode);
//		}
	
	public void transferProcess(String senderAccountNumber, String receiverAccountNumber, int transferAmount, String senderBankCode, String receiverBankCode) {
		accountDao.transferProcess(senderAccountNumber, receiverAccountNumber, transferAmount, senderBankCode, receiverBankCode);
	
	}
	
	
	
	
	
	
	
	

}
