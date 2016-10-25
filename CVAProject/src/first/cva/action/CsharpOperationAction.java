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
		// 바꾼다 맨위 import <-> using
		String javaForm = "import java.util.*;\nimport java.lang.*;\nimport java.io.*;";
		String csharpForm = "using System;\nusing System.Collections.Generic;\nusing System.IO;\nusing System.Text;\nusing System.Threading.Tasks;\n";
		file2 = file2.replace(csharpForm, javaForm);

		// namespace를 찾아 없앤다.
		int namespacePosition1 = file2.indexOf("namespace");
		int namespacePosition2 = file2.indexOf("{");
		String cut = file2.substring(namespacePosition1, namespacePosition2 + 1);
		file2 = file2.replace(cut, "");
		int fin = file2.lastIndexOf("}");
		file2 = file2.substring(0, fin);
		// 앞뒤 빈칸자른다
		file2 = file2.trim();
		// Console.WriteLine 변환.
		consoleWriteLineToSysout();
		
		// get set 변환.
		String so = "private";
		int index = 0;
		String a1 = "";
		String a2 = "";
		String a3 = "";
		String a4 = "";
		/*c_code = "using System; namespace ConsoleApplocation1{private String name =\"durina\";public String Name"
				+ "{get;set;}private int age = \"25\";public int Age{get;set;}}";*/
		// 1) private이 있는지 확인하기
		if (file2.indexOf(so) != -1) {
			String[] array = file2.split("private");
			index = array.length;
			System.out.println(index);
	        System.out.println(file2);

			// 3) 잘라진 만큼 돌리고
			for (int i = 1; i < index; i++) {
				a1 = array[i];
				System.out.println(a1);
				String[] array2 = a1.split(" ");
				// 타입명저장
				a2 = array2[1];
				// 변수명 저장
				
				a3 = array2[2];
				System.out.println(a1);
				// public 잘라주기
				String[] array3 = a1.split("public ");
				a4 = array3[1];
				// 변수의 첫글자를 대문자로 바꿔 저장한다.
				String b1 = a3.valueOf(a3.charAt(0)).toUpperCase();
				for (int j = 1; j < a3.length(); j++) {
					b1 += a3.charAt(j);
				}
				// get을 찾기위한
				String so1 = b1 + "{get;";
				// 치환해야할 부분을 찾기위해
				// 4) get이 있으면
				if (file2.indexOf("get") != -1) {
					// 5) get 부분 치환
					file2 = file2.replace(so1, "get" + b1 + "{return " + a3 + ";}");
				}
				String so2 = "}\npublic void " + "set" + b1 + "{this." + a3 + " = " + a3 + ";";
				// 6) set이 있으면
				if (file2.indexOf("set") != -1) {
					// 8) set 부분 치환
					file2 = file2.replace("}set;", so2);
					System.out.println(file2);
				}
			}
		}
		
		
		// 키워드
		for (int ii = 0; ii < list.size(); ii++) {
			if (file2.indexOf(list.get(ii).getCsharpKeyword()) != -1) {
				file2 = file2.replace(list.get(ii).getCsharpKeyword(), list.get(ii).getJavaKeyword());
			}
		}

		translateOutput2 = file2;
		System.out.println(translateOutput2);
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

	public void consoleWriteLineToSysout() {
		String a1 = "";
		String a2 = "";
		String a3 = "";
		String a = ".*{0}.*";
		String so = "Console.WriteLine";
		/*
		 * String c_code =
		 * "using System; namespace test{ class MainApp{ static void Main(String[] args){"
		 * +
		 * "int x =1; int y =2; Console.WriteLine(\"x:{0}\",x)}Console.WriteLine(\"y:{0}\",y)}"
		 * + "Console.WriteLine(\"x+y:{0}\",x+y)}}";
		 */
		// 1)주어진 String에 maches를 이용하여 원하는 "Console"을 찾는다.
		if (file2.indexOf(so) != -1) {
			// 2)있는게 확인되면 "Console"을 기준으로 자른다.
			String[] array = file2.split("Console.WriteLine");
			int index = array.length;
			// 3)잘라진 array의 length를 기준으로 length-1 일하기
			// 1부터 시작하는 이유는 0으로 하면 그전에 쓸데없는 값들이 들어가서 인덱스 오류남
			for (int i = 1; i < index; i++) {
				// "" 안에 들어간 문자열을 저장한다 : a1
				String[] array4 = array[i].split("\"");
				a1 = array4[1];
				// ""안의 글자 중 앞에 쓰인 글자만을 자른다.
				if (a1.matches(a) == true) {
					// {0} 앞까지 자른다.
					String[] array2 = a1.split("\\{");
					a2 = array2[0];
					// 보통의 표기 : 앞을 자른다.
					String[] array3 = a2.split(":");
					a3 = array3[0];
					// a1을 a2로 치환한다.
					file2 = file2.replace(a1, a2);
					// 순수하게 잘라진 변수명을 이용하여 넣어준다.
					String b = "," + a3;
					String f = "+" + a3;
					file2 = file2.replace(b, f);
				}
			}
		}
	}

}
