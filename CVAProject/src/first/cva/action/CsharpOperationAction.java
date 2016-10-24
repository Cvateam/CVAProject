package first.cva.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import first.cva.dao.KeywordDAO;
import first.cva.thread.Client;
import first.cva.vo.KeywordVO;

@SuppressWarnings("serial")
public class CsharpOperationAction extends ActionSupport implements SessionAware {

	private String file2;
	private String input2;
	private String originalFile2;
	private String compileOutput2;
	private String translateOutput2;
	private Client client;
	Map<String, Object> session;

	public String index() throws Exception {

		return SUCCESS;
	}

	public String compile2() throws Exception {
		client = new Client();
		client.startClient();
		// 접속 끝나면. 이것이 실행될수있게 코드를 바꿔보려고 한다. 지금은 좀 야매.
		Thread.sleep(1000);
		originalFile2 = file2;
		client.send(file2 + "\n");
		// send가 끝나면. 이것이 실행될수있게 코드를 바꿔보려고 한다. 지금은 좀 야매.
		Thread.sleep(2000);
		compileOutput2 = client.data;
		client.stopClient();
		return SUCCESS;
	}

	public String translate2() throws Exception {
		KeywordDAO dao = new KeywordDAO();
		List<KeywordVO> list = dao.searchKeyword();
		//바꾼다 맨위 import <-> using
		String javaForm = "import java.util.*;\nimport java.lang.*;\nimport java.io.*;";
		String csharpForm = "using System;\nusing System.Collections.Generic;\nusing System.IO;\nusing System.Text;\nusing System.Threading.Tasks;\n";
		file2 = file2.replace(csharpForm, javaForm);
		
		//namespace를 찾아 없앤다.
		int namespacePosition1 = file2.indexOf("namespace");
		int namespacePosition2 = file2.indexOf("{");
		String cut = file2.substring(namespacePosition1, namespacePosition2 + 1);
		file2 = file2.replace(cut, "");
		int fin = file2.lastIndexOf("}");
		file2 = file2.substring(0, fin);
		//앞뒤 빈칸자른다
		file2 = file2.trim();
		for (int ii = 0; ii < list.size(); ii++) {
			if (file2.indexOf(list.get(ii).getCsharpKeyword()) != -1) {
				file2 = file2.replace(list.get(ii).getCsharpKeyword(), list.get(ii).getJavaKeyword());
			}
		}
		translateOutput2 = file2;
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getCompileOutput2() {
		return compileOutput2;
	}

	public void setCompileOutput2(String CompileOutput2) {
		this.compileOutput2 = CompileOutput2;
	}

	public String getInput2() {
		return input2;
	}

	public void setInput2(String input2) {
		this.input2 = input2;
	}

	public String getTranslateOutput2() {
		return translateOutput2;
	}

	public void setTranslateOutput2(String translateOutput2) {
		this.translateOutput2 = translateOutput2;
	}

}
