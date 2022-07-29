package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.login.LoginVO;

public class AccountListController implements Controller{
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		LoginVO user= (LoginVO)session.getAttribute("userVO");
		
		String userId = user.getCusId();
		String cusPhonenumber = user.getCusPhoneNum();
		
		AccountService service = new AccountService();
				
		List<AccountVO> accountList = new ArrayList<>();
		accountList = service.selectByPhoneNumber(cusPhonenumber);
		request.setAttribute("accountList", accountList);
		
		List<AccountVO> jihoonAccountList = new ArrayList<>();
		jihoonAccountList = service.selectByParkBank(cusPhonenumber);
		request.setAttribute("jihoonAccountList", jihoonAccountList);
		
		List<AccountVO> joAccountList = new ArrayList<>();
		joAccountList = service.selectByJoBank(cusPhonenumber);
		request.setAttribute("joAccountList", joAccountList);
		
		List<AccountVO> yoonAccountList = new ArrayList<>();
		yoonAccountList = service.selectByYoonBank(cusPhonenumber);
		request.setAttribute("yoonAccountList", yoonAccountList);
		
		return "/jsp/account/list.jsp";
				
	}
	
}
