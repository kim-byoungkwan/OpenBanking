package kr.ac.kopo.account.vo;

public class AccountVO {
	
	private String phoneNumber;
	private String accountNumber;
	private String accountPassword;
	private String bankCode;
	private String bankRegDate;
	private int balance;
	private String bankAlias;
	private int transferLimit;
	
	public AccountVO(String phoneNumber, String accountNumber, String accountPassword, String bankCode,
			String bankRegDate, int balance, String bankAlias, int transferLimit) {
		super();
		this.phoneNumber = phoneNumber;
		this.accountNumber = accountNumber;
		this.accountPassword = accountPassword;
		this.bankCode = bankCode;
		this.bankRegDate = bankRegDate;
		this.balance = balance;
		this.bankAlias = bankAlias;
		this.transferLimit = transferLimit;
	}
	
	@Override
	public String toString() {
		return "AccountVO [phoneNumber=" + phoneNumber + ", accountNumber=" + accountNumber + ", accountPassword="
				+ accountPassword + ", bankCode=" + bankCode + ", bankRegDate=" + bankRegDate + ", balance=" + balance
				+ ", bankAlias=" + bankAlias + ", transferLimit=" + transferLimit + "]";
	}
	
	public AccountVO() {
		super();
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountPassword() {
		return accountPassword;
	}
	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankRegDate() {
		return bankRegDate;
	}
	public void setBankRegDate(String bankRegDate) {
		this.bankRegDate = bankRegDate;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getBankAlias() {
		return bankAlias;
	}
	public void setBankAlias(String bankAlias) {
		this.bankAlias = bankAlias;
	}
	public int getTransferLimit() {
		return transferLimit;
	}
	public void setTransferLimit(int transferLimit) {
		this.transferLimit = transferLimit;
	}
	
	
	
}
