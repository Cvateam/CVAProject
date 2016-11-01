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
	private String javaCode1;
	private String javaCompileCode;
	private String javatranslatedCode;	//씨샵으로 번역된 코드
	private String scannerInput;		//스캐너이용했을때 사용자가 콘솔에서 입력하는 값

	public JavaOperationAction(){};

	public String compile1() throws Exception{
		Runtime runtime = Runtime.getRuntime();
		File directory = new File("WebJava/Request");
		directory.mkdirs();
		
		if (javaCode.indexOf("Scanner") != -1){
			/*javaCode = javaCode.replace("Console.ReadLine();", "\"" + scannerInput + "\"";*/
				System.out.println(scannerInput);
				if(javaCode.indexOf("new Scanner(System.in)") != -1){
					javaCode = javaCode.replace("new Scanner(System.in)", "new Scanner(\"" + scannerInput + "\")");
				}
		}
		if (scannerInput == null) {
			javaCompileCode = "스캐너사용시에는  input칸에 입력해주셔야합니다.";
			return ERROR;
			
		}
		
		File source  = new File(directory.getAbsolutePath()+"/Test.java");  // 첫번째 파일 
		File source2  = new File(directory.getAbsolutePath()+"/Test2.java"); // 패키지의 두번째 파일
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(source));
			out.write(javaCode); out.newLine();
			
			out.close();
			if(javaCode1 != null){
				BufferedWriter out2 = new BufferedWriter(new FileWriter(source2));
				out2.write(javaCode1); out2.newLine();
				
				out2.close();
			}
		} catch (IOException e) {
			System.err.println(e);
			System.exit(1);
		}
		//첫 라인 패키지명 읽어오기 
		String toReadPackage = javaCode.trim();
		if(toReadPackage.indexOf("package") != -1){
			int beginIndex = javaCode.indexOf("package");
			int endIndex = javaCode.indexOf(";");
			
			System.out.println(toReadPackage.substring(beginIndex, endIndex));
		}
		

/*		  String zipFilePath = "C:\\excelfile\\realxlsx";//압축할 디렉토리 경로
		  String zipFileName = "C:\\excelfile\\downloadXlsx";//압축할 파일명  
		  //압축 메서드 
		  CompressSource.zipDirectory(zipFilePath, zipFileName + ".zip");*/
		
		
		/*	         String command = "javac -d D:/Test/classes ";
         command = command + "D:/Test/src/" + className+".java";        
         try {
                Process processor = Runtime.getRuntime().exec(command);
         }*/
		Process compile = runtime.exec("javac -sourcepath " +source.getParent() +  " "+ source.getAbsolutePath() + " ");
		try{
			compile.waitFor();
		}catch (InterruptedException e){
			e.printStackTrace();
		}

		StringBuilder compileLog = new StringBuilder();
		Scanner compileScanner= new Scanner(compile.getErrorStream()); // error 코드 확인 

		while (compileScanner.hasNextLine()){
		
			compileLog.append(compileScanner.nextLine()+ "\n");
		}

		compileScanner.close();
		
		
		String compileLog1 = compileLog.toString();
		javaCompileCode =   compileLog1.replace( "C:\\SetUpFile\\eclipse\\eclipse-jee-neon-R-win32-x86_64\\eclipse\\WebJava\\Request\\", " ");
		
		if (compileLog1.isEmpty()){
			String name = source.getName();
			Process java = runtime.exec("java -cp " + source.getParent() + " " + name.substring(0, name.lastIndexOf(".")) + " ");
			try{
				java.waitFor();

				StringBuilder javaLog = new StringBuilder();
				Scanner javaScanner1 = new Scanner(java.getInputStream());

				while (javaScanner1.hasNextLine()){
					javaLog.append(javaScanner1.nextLine()+"\n");
				}

				javaScanner1.close();
				System.out.println(javaLog.toString());
				javaCompileCode =   javaLog.toString();
				System.out.println("javaCompileCode"+ javaCompileCode);

				source.delete();//java파일삭제
				new File(source.getParent(), name + ".class").delete();//class파일삭제
			}catch (InterruptedException e){
				e.printStackTrace();
			}
		}else{
			javaCompileCode =   compileLog1.replace( "C:\\SetUpFile\\eclipse\\eclipse-jee-neon-R-win32-x86_64\\eclipse\\WebJava\\Request\\", " ");

		}
		return SUCCESS;
	}//java compile
	
	
	public String translate1() throws Exception{
		KeywordDAO dao = new KeywordDAO();
		List<KeywordVO> list = dao.searchKeyword(1);

		String javaForm = "import java.util.*;\nimport java.lang.*;\nimport java.io.*;";
		String csharpForm = "using System;\nusing System.Collections.Generic;\nusing System.IO;\nusing System.Text;\nusing System.Threading.Tasks;\n\nnamespace CVa\n{";
		javaCode = javaCode.replace(javaForm, csharpForm);

		// namespace / java의 패키지개념
		/*		int namespacePosition = javaCode.indexOf("package"); //ex// package Test1;
		int packagenamelastindex  = javaCode.indexOf(";");
		String packagename = javaCode.substring(namespacePosition, packagenamelastindex + 1);

		 		javaCode = javaCode.replace("package", "namespace"); // 숙제 namespace 뒤에 { 이거 붙이기  */
		//네임스페이스 안주기로 함  javaCode += "\n}"; //코드마지막에 } 덧붙혀서 마무리		

		 javaCode = javaCode.trim();

		 sysoutToConsoleWriteLine();// Console.WriteLine 변환.
		 changeGetSet(); // 겟셋

		 // 키워드
		 for (int ii = 0; ii < list.size(); ii++) {
			 if (javaCode.indexOf(list.get(ii).getJavaKeyword()) != -1) {
				 javaCode = javaCode.replace(list.get(ii).getJavaKeyword() , list.get(ii).getCsharpKeyword());
			 }
		 }
		 javatranslatedCode= javaCode;
		 javatranslatedCode += "\n}";
		 
		 return SUCCESS;
	}

	private void changeGetSet() {
		// 원래의 코드를 보존한다.
		int result = 0;
		int check = 0;
		String ori_j_code = javaCode;
		// 줄을 기준으로 나눠서 전체의 코드를 정리한다.
		String[] mainArray = javaCode.split("\n");

		String[] midArray = javaCode.split("private ");
		int index = midArray.length;
		System.out.println(index);
		for (int i = 1; i < index; i++) {
			String a1 = midArray[i];
			System.out.println("a1:" + a1);
			String[] keyArray = a1.split(" ");
			String a2 = keyArray[0];
			String a3 = keyArray[1];
			String[] keyArray1 = a3.split(";");
			a3 = keyArray1[0];
			System.out.println("a2:" + a2);
			System.out.println("a3:" + a3);
			// String
			String b2 = a2.toLowerCase();
			String b1 = a3.valueOf(a3.charAt(0)).toUpperCase();
			for (int j = 1; j < a3.length(); j++) {
				b1 += a3.charAt(j);
			}
			System.out.println("b2:" + b2);
			System.out.println("b1:" + b1);
			String[] checkArray = javaCode.split("public ");
			for (int j = 1; j < checkArray.length-1; j++) {
				System.out.println(j);
				System.out.println(checkArray[2]);
				if (checkArray[j].indexOf(a2 + " get" + b1) != -1 || checkArray[j].indexOf(" set" + b1) != -1) {
					System.out.println("안녕하다");
					String a4 = checkArray[j];
					a4+= "public "+checkArray[j+1];
					System.out.println("a4:"+a4);
					System.out.println("나와라" + a4);

					if (a4.indexOf("get") != -1) {
						check += 1;
						result += 10;
					}
					if (a4.indexOf("set") != -1) {
						check += 1;
						result += 1;
					}
					System.out.println("result"+result);
					String mid_mid1 = "\t\tpublic " + b2 + " " + b1 + "{\n\t\t\tget;\n\t\t\tset;\n\t\t}\n";
					String mid_mid11 = "public " + b2 + " " + b1 + "{\n\t\t\tget;\n\t\t\tset;\n\t\t}\n";
					String mid_mid2 = "\tpublic " + b2 + " " + b1 + "{\n\t\tget;\n\t}\n";
					String mid_mid3 = "\tpublic " + b2 + " " + b1 + "{\n\t\tset;\n\t}\n";
					switch (result) {

					case 11:// 둘다있다
						if(check==2){
		                     System.out.println(mid_mid1);
		                     javaCode = javaCode.replace("public " + a4, mid_mid11);
		                     System.out.println(javaCode);
		                     a4 = "";
		                     result = 0;
		                     break;
		                  }else{
		                     System.out.println(mid_mid1);
		                     javaCode = javaCode.replace("public " + a4, mid_mid1+"\n\t}\n");
		                     System.out.println(javaCode);
		                     a4 = "";
		                     result = 0;
		                     break;
		                  }
					case 10:// get
						System.out.println("get일함");
						javaCode = javaCode.replace("public " + a4, mid_mid2);
						a4 = "";
						result = 0;
						break;
					case 1:// set
						System.out.println("set 일함");
						javaCode = javaCode.replace("public " + a4, mid_mid3);
						a4 = "";
						result = 0;
						break;

					default:
						System.out.println("안녕하세요 월루입니다.");
						break;
					}
				}

			}

		}
		System.out.println("==================");
		System.out.println(javaCode);
	}

	private void sysoutToConsoleWriteLine() {
		   String x;
		   String y;
		   String z="\"+";
		   String a="{0}\",";
		   String so = ".*System.out.println.*";
		   String so2 = "System.out.println";
		   String xxx = "\""; 
		       
		      //1) 주어진 String에 matches를 이용하여 원하는 "sysout"이 있는지 확인
		      if(javaCode.matches(so)==true){
		         System.out.println("있다");
		         // 2)있는게 확인되면  "sysout"을 기준으로 자르기
		         String[] array = javaCode.split(so2);
		         // 3) 잘라진 array의 length을 기준으로  length-1번 일하기
		          int index =array.length;
		          for(int i = 0;i<index;i++){
		             javaCode = javaCode.replace(z, a);    
		          }
		      }

	}

	////////////////////get , set ////////////////////////////////////
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