package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TransferFormController implements Controller{
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String senderAccountNumber = request.getParameter("accountNumber");
		String senderBankCode = request.getParameter("senderBankCode");
		String cusName = request.getParameter("cusName");
		
		request.setAttribute("senderAccountNumber", senderAccountNumber);
		request.setAttribute("senderBankCode", senderBankCode);
		request.setAttribute("cusName", cusName);
		
		return "/jsp/account/transferForm.jsp?senderAccountNumber="+senderAccountNumber+"&senderBankCode="+senderBankCode+"&cusName="+cusName;
				
	}
	
}
