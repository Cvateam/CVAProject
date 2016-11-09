package first.cva.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import first.cva.dao.QuestionListDAO;
import first.cva.vo.Question;

public class QuestionAction extends ActionSupport {
	Question question;
	List<Question> questiontList;
	String searchFiled;// 검색 분류
	String searchText; // 검색명
	int qno;
	
	

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String questionListRead() throws Exception {
		QuestionListDAO dao = new QuestionListDAO();
		questiontList = dao.listRead();
		return SUCCESS;

	}

	public String questiondetail() throws Exception {
		QuestionListDAO dao = new QuestionListDAO();
		question = dao.questiondetail(qno);
		return SUCCESS;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public List<Question> getQuestiontList() {
		return questiontList;
	}

	public void setQuestiontList(List<Question> questiontList) {
		this.questiontList = questiontList;
	}

	public String getSearchFiled() {
		return searchFiled;
	}

	public void setSearchFiled(String searchFiled) {
		this.searchFiled = searchFiled;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

}
