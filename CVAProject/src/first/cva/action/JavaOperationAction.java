package first.cva.action;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import com.opensymphony.xwork2.ActionSupport;

public class JavaOperationAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String javaCode;
	private String javaCompileCode;
	
public JavaOperationAction(){};

public String compile1() throws Exception{
	  Runtime runtime = Runtime.getRuntime();
        File directory = new File("WebJava/Request");
        directory.mkdirs();

        File source  = new File(directory.getAbsolutePath()+"/Test.java");
        System.out.println(directory.getAbsolutePath());
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(source));
            out.write(javaCode); out.newLine();
            
            out.close();
          } catch (IOException e) {
              System.err.println(e);
              System.exit(1);
          }
/*	         String command = "javac -d D:/Test/classes ";
         command = command + "D:/Test/src/" + className+".java";        
         try {
                Process processor = Runtime.getRuntime().exec(command);
         }*/
        System.out.println("javac -sourcepath " +source.getParent() +  " "+ source.getAbsolutePath() + " ");
        Process compile = runtime.exec("javac -sourcepath " +source.getParent() +  " "+ source.getAbsolutePath() + " ");
        try{
            compile.waitFor();
        }catch (InterruptedException e){
            e.printStackTrace();
        }

        StringBuilder compileLog = new StringBuilder();
        Scanner compileScanner= new Scanner(compile.getErrorStream());

        while (compileScanner.hasNextLine()){
            compileLog.append(compileScanner.nextLine());
        }

        compileScanner.close();

        String compileLog1 = compileLog.toString();
        System.out.println("compileLog1: " + compileLog1);
        javaCompileCode =   compileLog1.toString();

        if (compileLog1.isEmpty()){
            String name = source.getName();
            System.out.println(source.getName());
            Process java = runtime.exec("java -cp " + source.getParent() + " " + name.substring(0, name.lastIndexOf(".")) + " ");
            	System.out.println("java -cp " + source.getParent() + " " + name.substring(0, name.lastIndexOf(".")) + " ");
            try{
                java.waitFor();
                
                StringBuilder javaLog = new StringBuilder();
                Scanner javaScanner1 = new Scanner(java.getInputStream());
                
                while (javaScanner1.hasNextLine()){
                    javaLog.append(javaScanner1.nextLine());
                }

                javaScanner1.close();
                System.out.println(javaLog.toString());
                javaCompileCode =   javaLog.toString();
          	  	
                source.delete();//java파일삭제
          	  	new File(source.getParent(), name + ".class").delete();//class파일삭제
            }catch (InterruptedException e){
                e.printStackTrace();
            }
        }else{
            javaCompileCode =  compileLog1;
            
        }
		return SUCCESS;
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
}


