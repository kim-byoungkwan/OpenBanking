package kr.ac.kopo.transaction.service;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.transaction.dao.TransactionDAO;
import kr.ac.kopo.transaction.vo.TransactionVO;

public class TransactionService {
	
	private TransactionDAO transactionDao;
	
	public TransactionService() {	
		transactionDao = new TransactionDAO();
	}
	
	public void insertTransaction(String userId, String cusPhonenumber, String senderAccountNumber, String receiverAccountNumber, String senderBankCode, String receiverBankCode, int transferAmount) {
		
		transactionDao.insertTransaction(userId, cusPhonenumber, senderAccountNumber, receiverAccountNumber, senderBankCode, receiverBankCode, transferAmount);
		
	}
	
	public List<TransactionVO> selectTransactionList(String phonenumber){
		
		List<TransactionVO> transactionList = new ArrayList<>();
		transactionList = transactionDao.selectTransactionList(phonenumber);
		
		return transactionList;
		
	}
	
}
