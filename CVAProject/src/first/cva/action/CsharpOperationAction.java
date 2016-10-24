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
		client = new Client();
		client.startClient();
		// 접속 끝나면. 이것이 실행될수있게 코드를 바꿔보려고 한다. 지금은 좀 야매.
		Thread.sleep(1000);
		client.send(file2 + "\n");
		System.out.println(file2);
		// send가 끝나면. 이것이 실행될수있게 코드를 바꿔보려고 한다. 지금은 좀 야매.
		Thread.sleep(2000);
		result = client.data;
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
