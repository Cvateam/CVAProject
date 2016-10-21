package first.cva.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import first.cva.thread.Client;

@SuppressWarnings("serial")
public class CsharpOperationAction extends ActionSupport implements SessionAware{
	
	private String response;
	private String response1;
	private String result;
	private Client client;
	Map<String, Object> session;

	public String index() throws Exception {
		
		return SUCCESS;
	}

	public String test() throws Exception {
		client = new Client();
		session.put("client", client);
		client.startClient();
		client = (Client) session.get("client");
		client.send(response + "\n");
		// send가 끝나면. 이것이 실행될수있게 코드를 바꿔보려고 한다. 지금은 좀 야매.
		Thread.sleep(3000);
		result = client.data;
		client.stopClient();
		return SUCCESS;
	}

	public String splitLetter() throws Exception {
//		response.replace(oldChar, newChar);
		return SUCCESS;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public String getResponse1() {
		return response1;
	}

	public void setResponse1(String response1) {
		this.response1 = response1;
	}
}
