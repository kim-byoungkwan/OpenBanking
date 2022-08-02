package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

public class BoardDAO {
	
	public void insertBoard(BoardVO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			conn = new ConnectionFactory().getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO BOARD(NO, WRITER, USERID, TITLE, CONTENT, BOARDTYPE) VALUES(?, ?, ? ,?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			
			int loc = 1;
			
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getUserId());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getContent());
			pstmt.setString(loc++, board.getBoardType());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}
	
	public int selectBoardNo() {
		
		String sql = "select seqBoard.nextval from dual";
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<BoardVO> selectAll(){
		
		List<BoardVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT NO, WRITER, USERID, TITLE, CONTENT, TO_CHAR(WRITEDATE,'YYYY-MM-DD') AS WRITEDATE, BOARDTYPE FROM BOARD ORDER BY NO");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					int no = rs.getInt("no");
					String writer = rs.getString("writer");
					String userId = rs.getString("userid");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String writeDate = rs.getString("writedate");
					String boardType = rs.getString("boardtype");
					
					BoardVO board = new BoardVO();
					board.setNo(no);
					board.setWriter(writer);
					board.setUserId(userId);
					board.setTitle(title);
					board.setContent(content);
					board.setWriteDate(writeDate);
					board.setBoardType(boardType);
					
					list.add(board);
				}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return list;
		}
	
	public BoardVO selectByNo(int no) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no,writer,userId,title,content,to_char(writeDate,'YYYY-MM-DD') as writeDate from board where no = ?");
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				int boardNo = rs.getInt("no");
				String writer = rs.getString("writer");
				String userId = rs.getString("userid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeDate = rs.getString("writeDate");
				
				BoardVO board = new BoardVO(boardNo, writer, userId, title, content, writeDate);
				return board;
			
			}
		} catch(Exception e) {
			e.printStackTrace();	
		}
		return null;
	}
	
	
	
	
	
	
	}
	