package first.cva.vo;

public class Question {
	private int qno;
	private String title;
	private String content;
	private String lv;
	private String solution;
	
	public Question() {
		super();
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	@Override
	public String toString() {
		return "Question [qno=" + qno + ", title=" + title + ", content=" + content + ", lv=" + lv + ", solution="
				+ solution + "]";
	}
	
	
}
