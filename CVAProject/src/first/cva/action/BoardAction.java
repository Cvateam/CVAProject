package first.cva.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

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
	private List<Board> javaboardList;		// 저장한 Board List 객체
	private List<Board> cSharpboardList;		// 저장한 Board List 객체
	private int boardnum;
	private String boardTitle1; //java 
	private String boardTitle2;// cSharp
	private String searchField;//검색대상 필드.. null일 수도 있다.
	private String searchText;//검색어
	private String javaCode;
	

	public String boardSave1() throws Exception{
		board.setCustid((String)session.get("loginId"));
		//System.out.println("board.getOutputjava() : "+board.getOutputjava());
		//System.out.println(board.getJavaScannerInput());
		//System.out.println(board.getJavaCode());
		int a = new BoardDAO().boardSave1(board);
		
		message  =  (a == 1 )? "저장되었습니다" : "저장되지않았습니다. 다시 시도하세요.";
		return SUCCESS;
	}
	public String boardList() throws Exception {
		BoardDAO dao = new BoardDAO();
		boardList = dao.boardList((String)session.get("loginid"));
		javaboardList = dao.javaboardList((String)session.get("loginid")); 
		cSharpboardList = dao.cSharpboardList((String)session.get("loginid"));
		return SUCCESS;
	}
	public String boardRead() throws Exception {
		BoardDAO dao = new BoardDAO();
		boardList = dao.boardList((String)session.get("loginid"));
		board = dao.boardRead(boardTitle1); 
	
		return SUCCESS;
	}
	
	
	public String listBoard() throws Exception{
		System.out.println("start boardList");
		if(session.get("loginId") != null){
			BoardDAO dao=new BoardDAO();
			boardList=dao.listAll();
		}
		else{
			boardList= null;
		}
		System.out.println("boardList2");
		System.out.println(boardList.toString());
		
	/*	for(Board board : boardList){
			System.out.println(board);
			
		}*/
		return SUCCESS;		
	}
	

	
	public String searchBoard(){
		System.out.println("start SearchBoard");
		System.out.println(searchText);
		BoardDAO dao=new BoardDAO();
		boardList=dao.searchBoard(searchText);
		System.out.println("serachBoard2");
		System.out.println(boardList.toString());
		
		return SUCCESS;
	}
	
	public String javaPopLoad(){
		System.out.println("javaPopLoad");
		System.out.println(boardnum);
		BoardDAO dao=new BoardDAO();
		board=dao.javaPopLoad(boardnum);
		System.out.println(board.toString());
		System.out.println("javaPopLoad2");
		return SUCCESS;
	}
	
	public String csharpPopLoad(){
		System.out.println("csharpPopLoad");
		System.out.println(boardnum);
		BoardDAO dao=new BoardDAO();
		board=dao.csharpPopLoad(boardnum);
		System.out.println(board.toString());
		System.out.println("csharpPopLoad2");
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
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getBoardTitle1() {
		return boardTitle1;
	}
	public void setBoardTitle1(String boardTitle1) {
		this.boardTitle1 = boardTitle1;
	}
	public String getBoardTitle2() {
		return boardTitle2;
	}
	public void setBoardTitle2(String boardTitle2) {
		this.boardTitle2 = boardTitle2;
	}
	public String getSearchField() {
		return searchField;
	}
	public List<Board> getJavaboardList() {
		return javaboardList;
	}
	public void setJavaboardList(List<Board> javaboardList) {
		this.javaboardList = javaboardList;
	}
	public List<Board> getcSharpboardList() {
		return cSharpboardList;
	}
	public void setcSharpboardList(List<Board> cSharpboardList) {
		this.cSharpboardList = cSharpboardList;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	public String getSearchText() {
		return searchText;
	}
	public String getJavaCode() {
		return javaCode;
	}
	public void setJavaCode(String javaCode) {
		this.javaCode = javaCode;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	/**
	 * getter , setter
	 * @return
	 */

}
