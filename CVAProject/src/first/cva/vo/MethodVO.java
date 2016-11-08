package first.cva.vo;

import java.util.ArrayList;

public class MethodVO {
	
	private boolean beingStatic;
	private boolean beingFinal;
	private String code;
	private String access;
	private String dataType;
	private String name;
	private int parameterNum;
	
	public MethodVO(String code) {
		this.code = code;
		
		String[] splitCode = code.split("\n");
		ArrayList<String> splitCode1 = new ArrayList<>();
		
		for (int ii = 0; ii < splitCode.length; ii++) {
			splitCode1.add(splitCode[ii].trim());
		}
		String[] splitCode2 = splitCode1.get(0).split(" ");
		ArrayList<String> splitCode3 = new ArrayList<>();
		
		for (int ii = 0; ii < splitCode2.length; ii++) {
			splitCode3.add(splitCode2[ii].trim());
		}
		
		
		if (splitCode3.indexOf("final") != -1) {
			beingFinal = true;
		}
		if (splitCode3.indexOf("static") != -1) {
			beingStatic = true;
		}
		
		if(beingFinal == true && beingStatic == true) {
			access = splitCode3.get(2);
			dataType = splitCode3.get(3);
			name = splitCode3.get(4);
			name = name.substring(0, name.indexOf("("));
			name = name.trim();
		} else if ((beingFinal == true && beingStatic == false) || (beingFinal == false && beingStatic == true)) {
			access = splitCode3.get(1);
			dataType = splitCode3.get(2);
			name = splitCode3.get(3);
			name = name.substring(0, name.indexOf("("));
			name = name.trim();
		} else {
			if(!splitCode3.get(0).equals("public")&&!splitCode3.get(0).equals("private")&&!splitCode3.get(0).equals("protected")) {
				access = "default";
				dataType = splitCode3.get(0);
				name = splitCode3.get(1);
				name = name.substring(0, name.indexOf("("));
				name = name.trim();
			} else {
				access = splitCode3.get(0);
				dataType = splitCode3.get(1);
				name = splitCode3.get(2);
				name = name.substring(0, name.indexOf("("));
				name = name.trim();
			}
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

	public boolean isBeingStatic() {
		return beingStatic;
	}

	public void setBeingStatic(boolean beingStatic) {
		this.beingStatic = beingStatic;
	}

	public boolean isBeingFinal() {
		return beingFinal;
	}

	public void setBeingFinal(boolean beingFinal) {
		this.beingFinal = beingFinal;
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

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public int getParameterNum() {
		return parameterNum;
	}

	public void setParameterNum(int parameterNum) {
		this.parameterNum = parameterNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MethodVO [beingStatic=" + beingStatic + ", beingFinal=" + beingFinal + ", code=" + code + ", access="
				+ access + ", dataType=" + dataType + ", name=" + name + ", parameterNum=" + parameterNum + "]";
	}

	

}
