package first.cva.action;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import com.opensymphony.xwork2.ActionSupport;
import first.cva.dao.KeywordDAO;
import first.cva.vo.KeywordVO;

public class JavaOperationAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String javaCode;
	private String javaCode1; // 패키지 사용했을 때 다른 클래스
	private String javaCompileCode;
	private String javatranslatedCode; // 씨샵으로 번역된 코드
	private String scannerInput; // 스캐너이용했을때 사용자가 콘솔에서 입력하는 값

	public JavaOperationAction() {};

	public String compile1() throws Exception {
		Runtime runtime = Runtime.getRuntime();
		File directory = new File("WebJava/Request");
		directory.mkdirs(); /// 소스 저장하는 디렉토리 생성
		File classDirectory = new File("WebJava/Request/classes");
		classDirectory.mkdirs(); /// 클래스파일저장하는 폴더 생성 
		
		String mainClassName  = checkClassName(javaCode); // 하나 클래스 이름 빼왔음 
		System.out.println("mainClassName : "+mainClassName);
		///////////////////////////////////////// Scanner 파트 ///////////////////

		if (javaCode.indexOf("Scanner") != -1) {
			/*
			 * javaCode = javaCode.replace("Console.ReadLine();", "\"" +
			 * scannerInput + "\"";
			 */
			System.out.println(scannerInput);
			if (javaCode.indexOf("new Scanner(System.in)") != -1) {
				javaCode = javaCode.replace("new Scanner(System.in)", "new Scanner(\"" + scannerInput + "\")");
			}

			if (scannerInput == null) {
				javaCompileCode = "스캐너사용시에는  input칸에 입력해주셔야합니다.";
				return ERROR;

			}
		}

		//////////////////////////// package 확인////////////////////////////

		File source = null;
		File file2 = null;

		// 첫 라인 패키지명 읽어오기 //주석처리된 /* package whatever; // don't place package
		// name! */이부분읽어들임 . 나중에 처리할 부분

		String oneSentence[] = javaCode.split("\n"); // 한줄씩 읽어들임; String
		String toReadPackage = oneSentence[0].trim(); // package 첫라인이어야함

		String packageName = null;

		if(toReadPackage.indexOf("package") != -1){ 
				
				int beginIndex = javaCode.indexOf("package"); 
				int endIndex = javaCode.indexOf(";");

				packageName = toReadPackage.substring(beginIndex+8, endIndex).trim();//beginIndex+8 package+1 띄어쓰기

				String dir = directory.getAbsolutePath()+"/"+packageName; // .java파일들 놓을 위치(패키지명으로 처리) //File packagedir = new File(dir);
				new File(dir).mkdirs();
				file2 = new File(dir+"/Test2.java"); // 패키지의두번째 파일 
				source = new File(dir+"\\" + mainClassName + ".java");// 첫번째 파일 package 컴파일 main
				try {
					BufferedWriter out = new BufferedWriter(new FileWriter(source));
					out.write(javaCode); out.newLine();
	
					out.close(); 
					
					if(javaCode1 != null){ BufferedWriter out2 = new BufferedWriter(new FileWriter(file2)); 
					out2.write(javaCode1);
					out2.newLine();
	
					out2.close(); 
					} 
				}catch(IOException e){
					e.printStackTrace();
				}
		}else{// 소스코드 하나 컴파일
	
			source = new File(directory.getAbsolutePath() +"\\"+ mainClassName + ".java");
			try {
				BufferedWriter out = new BufferedWriter(new FileWriter(source));
				out.write(javaCode);
				out.newLine();
	
				out.close();
			} catch (IOException e) {
				System.err.println(e);
				System.exit(1);
			}
		}
		////////////////////////////////////// 소스코드 확인////////////////////////////////////

		/*
		 * 간단 cmd 이용 소스코드 컴파일 코드  String command = "javac -d D:/Test/classes ";
		 *  command = command + "D:/Test/src/" + className+".java";    try {    
		 *     Process processor = Runtime.getRuntime().exec(command);  }
		 */

		System.out.println("source.getParent : " + source.getParent());
		System.out.println("source.getAbsolutePath : " + source.getAbsolutePath());
		
		//System.out.println("javac -cp " + directory.getAbsolutePath() + "\\classes -d "+ directory.getAbsolutePath()+ "\\classes " + directory.getAbsolutePath()+"/"+packageName+"/"+mainClassName+".java " + directory.getAbsolutePath()+"/"+packageName+"/"+checkClassName(javaCode1)+".java");
		Process compile = null;
		System.out.println("javaCode1 : " + javaCode1.length());
		
		//System.out.println(basic);
		if(packageName != null && javaCode1.length() != 112){
			compile = runtime.exec("javac -cp " + directory.getAbsolutePath() + "\\classes -d "+ directory.getAbsolutePath()+ "\\classes " + directory.getAbsolutePath()+"/"+packageName+"/"+mainClassName+".java " + directory.getAbsolutePath()+"/"+packageName+"/"+checkClassName(javaCode1)+".java");
		}else if(packageName != null){
			compile = runtime.exec("javac -cp " + directory.getAbsolutePath() + "\\classes -d "+ directory.getAbsolutePath()+ "\\classes " + directory.getAbsolutePath()+"/"+packageName+"/"+mainClassName+".java ");
			System.out.println("패키지 컴파일 하나만 ");
		}else{
			compile = runtime.exec("javac -cp " + directory.getAbsolutePath() + "\\classes -d "+ directory.getAbsolutePath()+ "\\classes " + directory.getAbsolutePath()+"/"+mainClassName+".java ");
		}
		try {
			compile.waitFor();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		StringBuilder compileLog = new StringBuilder();
		Scanner compileScanner = new Scanner(compile.getErrorStream()); // error
		// 코드 확인

		while (compileScanner.hasNextLine()) {

			compileLog.append(compileScanner.nextLine() + "\n");
		}

		compileScanner.close();

		String compileLog1 = compileLog.toString();
		javaCompileCode = compileLog1
				.replace("C:\\SetUpFile\\eclipse\\eclipse-jee-neon-R-win32-x86_64\\eclipse\\WebJava\\Request\\", " ");
		if (compileLog1.isEmpty()) {
			
			Process java = null;
			System.out.println("run 실행 ");
			System.out.println("java -cp " + directory.getAbsolutePath() + "\\classes " +packageName+"."+mainClassName);
			if(packageName != null){
				java = runtime.exec("java -cp " + directory.getAbsolutePath() + "\\classes " +packageName+"."+mainClassName);
			}else{
				java = runtime.exec("java -cp " + directory.getAbsolutePath() + "\\classes " +mainClassName);

			}
			try {
				java.waitFor();

				StringBuilder javaLog = new StringBuilder();
				Scanner javaScanner1 = new Scanner(java.getInputStream());

				while (javaScanner1.hasNextLine()) {
					javaLog.append(javaScanner1.nextLine() + "\n");
				}

				javaScanner1.close();
				System.out.println(javaLog.toString());
				javaCompileCode = javaLog.toString();
				System.out.println("javaCompileCode : " + javaCompileCode);

				// source.delete();//java파일삭제
				// new File(source.getParent(), name +
				// ".class").delete();//class파일삭제
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} else {
			javaCompileCode = compileLog1.replace(
					"C:\\SetUpFile\\eclipse\\eclipse-jee-neon-R-win32-x86_64\\eclipse\\WebJava\\Request\\", " ");
			// source.delete();//java파일삭제
		}

		return SUCCESS;

	}// java compile

	private String checkClassName(String Code) {
		String[] sentence = Code.split("\n");
		String name = null;
		int i = 0;
		boolean flag = true;
		while (flag) {
			if (sentence[i].indexOf("class") != -1) {
				int beginIndex = sentence[i].indexOf("class ");
				if (sentence[i].indexOf("{") != -1) {
					int endIndex = sentence[i].indexOf("{");
					System.out.println(sentence[i].toString());
					name = sentence[i].substring(beginIndex + 6, endIndex).trim();
					// System.out.println(className);
					flag = false;
				}
				i++;
			} else {
				i++;
			}
		}
		// System.out.println("-"+className+"-");
		return name;
	}// 클래스 이름 뽑아내는 메소드 

	public String translate1() throws Exception {
		KeywordDAO dao = new KeywordDAO();
		List<KeywordVO> list = dao.searchKeyword(1);

		String javaForm = "import java.util.*;\nimport java.lang.*;\nimport java.io.*;";
		String csharpForm = "using System;\nusing System.Collections.Generic;\nusing System.IO;\nusing System.Text;\nusing System.Threading.Tasks;\n\nnamespace CVa\n{";
		javaCode = javaCode.replace(javaForm, csharpForm);

		// namespace / java의 패키지개념
		/*
		 * int namespacePosition = javaCode.indexOf("package"); //ex// package
		 * Test1; int packagenamelastindex = javaCode.indexOf(";"); String
		 * packagename = javaCode.substring(namespacePosition,
		 * packagenamelastindex + 1);
		 * 
		 * javaCode = javaCode.replace("package", "namespace"); // 숙제 namespace
		 * 뒤에 { 이거 붙이기
		 */
		// 네임스페이스 안주기로 함 javaCode += "\n}"; //코드마지막에 } 덧붙혀서 마무리

		javaCode = javaCode.trim();

		sysoutToConsoleWriteLine();// Console.WriteLine 변환.
		changeGetSet(); // 겟셋
		changeScanner();// 스캐너 변환

		// 키워드
		for (int ii = 0; ii < list.size(); ii++) {
			if (javaCode.indexOf(list.get(ii).getJavaKeyword()) != -1) {
				javaCode = javaCode.replace(list.get(ii).getJavaKeyword(), list.get(ii).getCsharpKeyword());
			}
		}
		javatranslatedCode = javaCode;
		javatranslatedCode += "\n}";

		return SUCCESS;
	}

	private void changeGetSet() {
		// 원래의 코드를 보존한다.
		int result = 0;
		int check = 0;
		//	String ori_j_code = javaCode;
		// 줄을 기준으로 나눠서 전체의 코드를 정리한다.
		//String[] mainArray = javaCode.split("\n");

		String[] midArray = javaCode.split("private ");
		int index = midArray.length;
		System.out.println(index);
		for (int i = 1; i < index; i++) {
			String a1 = midArray[i];
			//System.out.println("a1:" + a1);
			String[] keyArray = a1.split(" ");
			String a2 = keyArray[0];
			String a3 = keyArray[1];
			String[] keyArray1 = a3.split(";");
			a3 = keyArray1[0];
			//System.out.println("a2:" + a2);
			//System.out.println("a3:" + a3);
			// String
			String b2 = a2.toLowerCase();
			String b1 = a3.valueOf(a3.charAt(0)).toUpperCase();
			for (int j = 1; j < a3.length(); j++) {
				b1 += a3.charAt(j);
			}
			//System.out.println("b2:" + b2);
			//System.out.println("b1:" + b1);
			String[] checkArray = javaCode.split("public ");
			for (int j = 1; j < checkArray.length - 1; j++) {
				System.out.println(j);
				System.out.println(checkArray[2]);
				if (checkArray[j].indexOf(a2 + " get" + b1) != -1 || checkArray[j].indexOf(" set" + b1) != -1) {
					//System.out.println("안녕하다");
					String a4 = checkArray[j];
					a4 += "public " + checkArray[j + 1];
					//System.out.println("a4:" + a4);
					//System.out.println("나와라" + a4);

					if (a4.indexOf("get") != -1) {
						check += 1;
						result += 10;
					}
					if (a4.indexOf("set") != -1) {
						check += 1;
						result += 1;
					}
					//System.out.println("result" + result);
					String mid_mid1 = "\t\tpublic " + b2 + " " + b1 + "{\n\t\t\tget;\n\t\t\tset;\n\t\t}\n";
					String mid_mid11 = "public " + b2 + " " + b1 + "{\n\t\t\tget;\n\t\t\tset;\n\t\t}\n";
					String mid_mid2 = "\tpublic " + b2 + " " + b1 + "{\n\t\tget;\n\t}\n";
					String mid_mid3 = "\tpublic " + b2 + " " + b1 + "{\n\t\tset;\n\t}\n";
					switch (result) {

					case 11:// 둘다있다
						if (check == 2) {
							//System.out.println(mid_mid1);
							javaCode = javaCode.replace("public " + a4, mid_mid11);
							System.out.println(javaCode);
							a4 = "";
							result = 0;
							break;
						} else {
							//System.out.println(mid_mid1);
							javaCode = javaCode.replace("public " + a4, mid_mid1 + "\n\t}\n");
							System.out.println(javaCode);
							a4 = "";
							result = 0;
							break;
						}
					case 10:// get
						//System.out.println("get일함");
						javaCode = javaCode.replace("public " + a4, mid_mid2);
						a4 = "";
						result = 0;
						break;
					case 1:// set
						//System.out.println("set 일함");
						javaCode = javaCode.replace("public " + a4, mid_mid3);
						a4 = "";
						result = 0;
						break;

					default:
						//System.out.println("안녕하세요 월루입니다.");
						break;
					}
				}

			}

		}
		//System.out.println("==================");
		//System.out.println(javaCode);
	}

	private void changeScanner() {
		//System.out.println("확인하다");
		String re_javaCode = "";
		String a3 = "";
		String a5 = "";
		String a6 = "";
		String a7 =""; 
		String ori_j_code = javaCode;
		
		System.out.println("Javacode"+javaCode);
		String[] mainArray = javaCode.split("\n");
		for (int i = 0; i < mainArray.length; i++) {
			//System.out.println("돌아가는 부분 ");
			String a1 = mainArray[i];
			if (a1.indexOf("new Scanner(System.in);") != -1) {
				//System.out.println("scan가 있다 ");
				String[] cutArray = a1.trim().split(" ");
				a3 = cutArray[1];
				//System.out.println("A3"+a3);
			}else if(a1.equals("")){
				//System.out.println("뇌텅텅");
				re_javaCode += a1 + "\n";
			}else {
				//System.out.println("있긴합니다만");
				if(!a3.equals("")){//a3이 있다면
					//System.out.println("a3은"+a3);
					if (a1.indexOf(a3) != -1) {
						//System.out.println("존재합니다.");
						String a4 = mainArray[i];
						String[] cutArray2 = a4.trim().split(" ");
						a5 = cutArray2[0];
						a7 = cutArray2[1];
						a6 = a5.valueOf(a5.charAt(0)).toUpperCase();
						for (int j = 1; j < a5.length(); j++) {
							a6 += a5.charAt(j);
						}
						//System.out.println("a5"+a5);
						//System.out.println("a6"+a6);
					}
				}
				re_javaCode += a1 + "\n";
			}
		}
		//System.out.println("지구종말");
		 //int number = Int32.Parse(value); 
		String[] checkArray = re_javaCode.split("\n");
		for (int j = 0; j < checkArray.length; j++) {
			String a2 = checkArray[j];
			//System.out.println("a2"+a2);
			//System.out.println("a3"+a3);
			if (a2.indexOf(a3 + ".next") != -1) {
				if (a6.equals("String")) {
					re_javaCode = re_javaCode.replace(a3 + ".next()", "Console.ReadLine()");
				} else {
					System.out.println("a6"+a6);
					if(a2.matches(".*int.*")){
						//System.out.println("끝이나는 소리가 들린다.");
						re_javaCode = re_javaCode.replace(a6.toLowerCase()+" "+a7,"String valus");
					}
					re_javaCode = re_javaCode.replace("prStringln","println");
					re_javaCode = re_javaCode.replace(a3 + ".next" + a6 + "();", "Console.ReadLine();\n\t\t" +"int "+a7 + " = Int32.Parse(valus);");
					
				}
			}
		}
		javaCode = re_javaCode; 
		//System.out.println(javaCode);

	}

	private void sysoutToConsoleWriteLine() {
		//String x;
		//String y;
		String z = "\"+";
		String a = "{0}\",";
		String so = ".*System.out.println.*";
		String so2 = "System.out.println";
		//String xxx = "\"";

		// 1) 주어진 String에 matches를 이용하여 원하는 "sysout"이 있는지 확인
		if(javaCode.indexOf(so2)!=-1){
			//System.out.println("있다");
			// 2)있는게 확인되면 "sysout"을 기준으로 자르기
			String[] array = javaCode.split(so2);
			// 3) 잘라진 array의 length을 기준으로 length-1번 일하기
			int index = array.length;
			for (int i = 0; i < index; i++) {
				javaCode = javaCode.replace(z, a);
			}
		}

	}

	//////////////////// get , set ////////////////////////////////////
	public String getJavaCode() {
		return javaCode;
	}

	public String getJavaCompileCode() {
		return javaCompileCode;
	}

	public void setJavaCompileCode(String javaCompileCode) {
		this.javaCompileCode = javaCompileCode;
	}

	public void setJavaCode(String javaCode) {
		this.javaCode = javaCode;
	}

	public String getScannerInput() {
		return scannerInput;
	}

	public void setScannerInput(String scannerInput) {
		this.scannerInput = scannerInput;
	}

	public String getJavatranslatedCode() {
		return javatranslatedCode;
	}

	public void setJavatranslatedCode(String javatranslatedCode) {
		this.javatranslatedCode = javatranslatedCode;
	}

	public String getJavaCode1() {
		return javaCode1;
	}

	public void setJavaCode1(String javaCode1) {
		this.javaCode1 = javaCode1;
	}

}