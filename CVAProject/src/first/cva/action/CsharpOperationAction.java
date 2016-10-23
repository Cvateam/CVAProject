package first.cva.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import first.cva.thread.Client;

@SuppressWarnings("serial")
public class CsharpOperationAction extends ActionSupport implements SessionAware {

	private String file2;
	private String output2;
	private String result;
	private Client client;
	Map<String, Object> session;

	public String index() throws Exception {

		return SUCCESS;
	}

	public String compile2() throws Exception {
		// 클라이언트를 만들고
		client = new Client();
		// 시작하고
		client.startClient();
		// 코드를 보내고
		client.send(file2 + "\n");
		// send가 끝나면. 이것이 실행될수있게 코드를 바꿔보려고 한다. 지금은 좀 야매.
		Thread.sleep(5000);
		// 데이터 가져오고
		result = client.data;
		// 데이터를 멈춘다.

		// 임시
		output2 = result;
		client.stopClient();
		return SUCCESS;
	}

	public String splitLetter() throws Exception {

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

	public String getOutput2() {
		return output2;
	}

	public void setOutput2(String output2) {
		this.output2 = output2;
	}

}
