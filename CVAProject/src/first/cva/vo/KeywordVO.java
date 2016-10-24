package first.cva.vo;

public class KeywordVO {
	private int num;
	private String csharpKeyword;
	private String javaKeyword;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCsharpKeyword() {
		return csharpKeyword;
	}
	public void setCsharpKeyword(String csharpKeyword) {
		this.csharpKeyword = csharpKeyword;
	}
	public String getJavaKeyword() {
		return javaKeyword;
	}
	public void setJavaKeyword(String javaKeyword) {
		this.javaKeyword = javaKeyword;
	}
	@Override
	public String toString() {
		return "KeywordVO [num=" + num + ", csharpKeyword=" + csharpKeyword + ", javaKeyword=" + javaKeyword + "]";
	}
	
	
}
