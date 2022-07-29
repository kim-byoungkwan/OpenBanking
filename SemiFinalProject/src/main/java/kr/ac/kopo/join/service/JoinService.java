package kr.ac.kopo.join.service;

import kr.ac.kopo.board.dao.LoginDAO;
import kr.ac.kopo.login.LoginVO;

public class JoinService {
	
	private LoginDAO dao;
	
	public JoinService() {
		
		dao = new LoginDAO();
		
	}
	
	public void addMember(LoginVO loginVO) {
		
		dao.insertUser(loginVO);
	}

}
