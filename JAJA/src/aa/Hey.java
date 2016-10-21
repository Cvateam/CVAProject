package aa;

import java.io.File;
import java.io.IOException;

import classlibrary1.GreatTest;
import net.sf.jni4net.Bridge;

public class Hey {
	public static void main(String[] args) throws IOException {
		String response = "";
		Bridge.init();
		
        File coreFile = new File("jni4net\\lib\\jni4net.n-0.8.8.0.dll");
        File dllFile = new File("ClassLibrary1.j4n.dll");

        Bridge.LoadAndRegisterAssemblyFrom(coreFile);
        Bridge.LoadAndRegisterAssemblyFrom(dllFile);
		GreatTest test = new GreatTest();
		response = "using System;namespace TEST{class Program{ static void Main(string[] args){int sum = 0;for (int i = 0; i < 1000; i++)"
	                       + "{sum += i;}Console.WriteLine(sum);}}}";
		String result = test.answer(response);
		System.out.println(result);
	}
}
