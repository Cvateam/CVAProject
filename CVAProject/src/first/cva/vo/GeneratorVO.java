package first.cva.vo;

import java.util.ArrayList;

public class GeneratorVO {
	private String code;
	private String access;
	private int parameterNum;
	
	public GeneratorVO(String code) {
		this.code = code;
		
		String[] splitCode = code.split("\n");
		ArrayList<String> splitCode1 = new ArrayList<>();
		for (int ii = 0; ii < splitCode.length; ii++) {
			splitCode1.add(splitCode[ii].trim());
		}
		
		if(!splitCode1.get(0).equals("public")&&!splitCode1.get(0).equals("private")&&!splitCode1.get(0).equals("protected")) {
			access = "default";
		} else {
			access = splitCode1.get(0);
		}
		String param = splitCode1.get(0).substring(splitCode1.get(0).indexOf("("));
		param = param.replace("(", " ");
		param = param.replace(")", " ");
		param = param.trim();

		if(param.length() == 0) {
			parameterNum = 0;
		} else {
			String[] parameter = param.split(",");
			parameterNum = parameter.length;
		}
	}

	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public int getParameterNum() {
		return parameterNum;
	}

	public void setParameterNum(int parameterNum) {
		this.parameterNum = parameterNum;
	}
	
	@Override
	public String toString() {
		return "GeneratorVO [code=" + code + ", access=" + access + ", parameterNum=" + parameterNum + "]";
	}

}
