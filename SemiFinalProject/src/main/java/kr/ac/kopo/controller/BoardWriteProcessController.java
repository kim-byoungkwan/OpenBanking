package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardWriteProcessController implements Controller {
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String writer = request.getParameter("writer");
		String userId = request.getParameter("userId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String boardType = request.getParameter("boardType");
		
		BoardVO board = new BoardVO();
		
		board.setWriter(writer);
		board.setUserId(userId);
		board.setTitle(title);
		board.setContent(content);
		board.setBoardType(boardType);
		
		BoardService service = new BoardService();
		
		service.addBoard(board);
		
		return "redirect:/board/list.do";
		
		
		
	}

}
