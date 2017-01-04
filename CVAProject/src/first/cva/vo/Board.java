package first.cva.vo;

public class Board {
	private String javaCode; 	// 저장하려는 java 소스코드
	private String cSharpCode;  // 저장하려는 cSharp 소스코드
	private String javaScannerInput; // 자바 사용자 스캐너사용했을 때 입력한 값
	private String cShrapScannerInput; // cSharp사용자 스캐너사용했을 때 입력한 값
	private String boardTitlejava; //java 
	private String boardTitlecsharp;// cSharp
	private String custid;		// 저장하려는 사용자의 아이디
	private String boardMemo;	// Board에 들어가서 사용자가 메모한다면 관련내용 저장 
	private int boardnum;		// 보드에 메모 남길때 필요한 primary key
	private String outputjava;
	private String outputcharp;
	private String inputdate;
	
	
	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public Board(){}

	public String getJavaCode() {
		return javaCode;
	}

	public void setJavaCode(String javaCode) {
		this.javaCode = javaCode;
	}

	public String getcSharpCode() {
		return cSharpCode;
	}

	public void setcSharpCode(String cSharpCode) {
		this.cSharpCode = cSharpCode;
	}

	public String getJavaScannerInput() {
		return javaScannerInput;
	}

	public void setJavaScannerInput(String javaScannerInput) {
		this.javaScannerInput = javaScannerInput;
	}

	public String getcShrapScannerInput() {
		return cShrapScannerInput;
	}

	public void setcShrapScannerInput(String cShrapScannerInput) {
		this.cShrapScannerInput = cShrapScannerInput;
	}

	public String getBoardTitlejava() {
		return boardTitlejava;
	}

	public void setBoardTitlejava(String boardTitle1) {
		this.boardTitlejava = boardTitle1;
	}

	public String getBoardTitlecsharp() {
		return boardTitlecsharp;
	}

	public void setBoardTitlecsharp(String boardTitle2) {
		this.boardTitlecsharp = boardTitle2;
	}

	public String getBoardMemo() {
		return boardMemo;
	}

	public void setBoardMemo(String boardMemo) {
		this.boardMemo = boardMemo;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getOutputjava() {
		return outputjava;
	}

	public void setOutputjava(String outputjava) {
		this.outputjava = outputjava;
	}

	public String getOutputcharp() {
		return outputcharp;
	}

	public void setOutputcharp(String outputcharp) {
		this.outputcharp = outputcharp;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	
	
	
	
}
