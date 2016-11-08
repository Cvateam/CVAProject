package first.cva.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

import com.opensymphony.xwork2.ActionSupport;

import first.cva.dao.BoardDAO;
import first.cva.vo.Board;

public class BoardAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private String custid;				// id 따라 보드내용 불러올때 필요 
	private Board board;				// 저장할 보드객체
	private String message;				// 저장 확인 메세지
	private Map<String, Object> session; // login중인 회원의 저장정보들 불러올때 사용할 세션
	private List<Board> boardList;		// 저장한 Board List 객체
	
	public String boardSave1() throws Exception{
		board.setCustid((String)session.get("loginId"));
		System.out.println(board.getJavaScannerInput());
		System.out.println(board.getJavaCode());
		int a = new BoardDAO().boardSave1(board);
		
		message  =  (a == 1 )? "저장되었습니다" : "저장되지않았습니다. 다시 시도하세요.";
		return SUCCESS;
	}
	public String boardList() throws Exception {
		boardList = new BoardDAO().boardList((String)session.get("loginid"));
		
		
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}


	public String getCustid() {
		return custid;
	}


	public void setCustid(String custid) {
		this.custid = custid;
	}


	public Board getBoard() {
		return board;
	}


	public void setBoard(Board board) {
		this.board = board;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public Map<String, Object> getSession() {
		return session;
	}
	public List<Board> getBoardList() {
		return boardList;
	}
	public void setBoardList(List<Board> boardList) {
		this.boardList = boardList;
	}
	
	
	
	/**
	 * getter , setter
	 * @return
	 */

}
