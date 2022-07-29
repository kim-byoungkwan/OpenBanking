package kr.ac.kopo.transaction.vo;

public class TransactionVO {
	
	private int tranNum;
	private String depositAccountNum;
	private String withrawalAccountNum;
	private String depositName;
	private String withrawalName;
	private String depositBankCode;
	private String withrawalBankCode;
	private int tranAmount;
	private String tranDate;
	private String withrawalPhoneNum;
	private String depositPhoneNum;
	
	
	@Override
	public String toString() {
		return "TransactionVO [tranNum=" + tranNum + ", depositAccountNum=" + depositAccountNum
				+ ", withrawalAccountNum=" + withrawalAccountNum + ", depositName=" + depositName + ", withrawalName="
				+ withrawalName + ", depositBankCode=" + depositBankCode + ", withrawalBankCode=" + withrawalBankCode
				+ ", tranAmount=" + tranAmount + ", tranDate=" + tranDate + ", withrawalPhoneNum=" + withrawalPhoneNum
				+ ", depositPhoneNum=" + depositPhoneNum + "]";
	}
	public TransactionVO() {
		super();
	}
	public int getTranNum() {
		return tranNum;
	}
	public void setTranNum(int tranNum) {
		this.tranNum = tranNum;
	}
	public String getDepositAccountNum() {
		return depositAccountNum;
	}
	public void setDepositAccountNum(String depositAccountNum) {
		this.depositAccountNum = depositAccountNum;
	}
	public String getWithrawalAccountNum() {
		return withrawalAccountNum;
	}
	public void setWithrawalAccountNum(String withrawalAccountNum) {
		this.withrawalAccountNum = withrawalAccountNum;
	}
	public String getDepositName() {
		return depositName;
	}
	public void setDepositName(String depositName) {
		this.depositName = depositName;
	}
	public String getWithrawalName() {
		return withrawalName;
	}
	public void setWithrawalName(String withrawalName) {
		this.withrawalName = withrawalName;
	}
	public String getDepositBankCode() {
		return depositBankCode;
	}
	public void setDepositBankCode(String depositBankCode) {
		this.depositBankCode = depositBankCode;
	}
	public String getWithrawalBankCode() {
		return withrawalBankCode;
	}
	public void setWithrawalBankCode(String withrawalBankCode) {
		this.withrawalBankCode = withrawalBankCode;
	}
	public int getTranAmount() {
		return tranAmount;
	}
	public void setTranAmount(int tranAmount) {
		this.tranAmount = tranAmount;
	}
	public String getTranDate() {
		return tranDate;
	}
	public void setTranDate(String tranDate) {
		this.tranDate = tranDate;
	}
	public String getWithrawalPhoneNum() {
		return withrawalPhoneNum;
	}
	public void setWithrawalPhoneNum(String withrawalPhoneNum) {
		this.withrawalPhoneNum = withrawalPhoneNum;
	}
	public String getDepositPhoneNum() {
		return depositPhoneNum;
	}
	public void setDepositPhoneNum(String depositPhoneNum) {
		this.depositPhoneNum = depositPhoneNum;
	}
	
	
		
	

}
