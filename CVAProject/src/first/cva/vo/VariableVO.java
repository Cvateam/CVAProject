package first.cva.vo;

import java.util.ArrayList;

public class VariableVO {
	private String code;
	private boolean beingStatic;
	private boolean beingFinal;
	private String access;
	private String dataType;
	private String name;

	public VariableVO(String code) {
		this.code = code;
		code = code.trim();
		String[] splitCode = code.split(" ");
		ArrayList<String> splitCode1 = new ArrayList<>();
		for (int ii = 0; ii < splitCode.length; ii++) {
			splitCode1.add(splitCode[ii].trim());
		}

		if (splitCode1.indexOf("final") != -1) {
			beingFinal = true;
		}
		if (splitCode1.indexOf("static") != -1) {
			beingStatic = true;
		}
		if(beingFinal == true && beingStatic == true) {
			access = splitCode1.get(2);
			dataType = splitCode1.get(3);
			name = splitCode1.get(4);
			name = name.replace(";", " ");
			name = name.trim();
		} else if ((beingFinal == true && beingStatic == false) || (beingFinal == false && beingStatic == true)) {
			access = splitCode1.get(1);
			dataType = splitCode1.get(2);
			name = splitCode1.get(3);
			name = name.replace(";", " ");
			name = name.trim();
		} else {
			if(!splitCode1.get(0).equals("public")&&!splitCode1.get(0).equals("private")&&!splitCode1.get(0).equals("protected")) {
				access = "default";
				dataType = splitCode1.get(0);
				name = splitCode1.get(1);
				name = name.replace(";", " ");
				name = name.trim();
			} else {
				access = splitCode1.get(0);
				dataType = splitCode1.get(1);
				name = splitCode1.get(2);
				name = name.replace(";", " ");
				name = name.trim();
			}
		}
		
	}

	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "VariableVO [code=" + code + ", beingStatic=" + beingStatic + ", beingFinal=" + beingFinal + ", access="
				+ access + ", dataType=" + dataType + ", name=" + name + "]";
	}

}
