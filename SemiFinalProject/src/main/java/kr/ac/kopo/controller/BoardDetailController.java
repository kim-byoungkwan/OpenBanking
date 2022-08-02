package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.reply.service.BoardReplyService;
import kr.ac.kopo.board.reply.vo.BoardReplyVO;
import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardDetailController implements Controller{
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardService service = new BoardService();
		BoardReplyService reService = new BoardReplyService();
		
		List<BoardReplyVO> boardReplyList = new ArrayList<>();
		
		BoardVO board = service.detailBoard(no);
		boardReplyList = reService.showBoardReply(no);
		
		request.setAttribute("board", board);
		request.setAttribute("boardReplyList", boardReplyList);

		return "/jsp/board/boardDetail.jsp?no="+no;

	}

}
