package first.cva.vo;

import java.util.ArrayList;

public class GetterSetterVO {

	private String code;
	private boolean beingGet;
	private boolean beingSet;
	private String access;
	private String dataType;
	private String name;
	private String getContents;
	private String setContents;

	public GetterSetterVO(String code) {
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

		if (code.indexOf("get") != -1) {
			beingGet = true;
		}

		if (code.indexOf("set") != -1) {
			beingSet = true;
		}

		if (!splitCode3.get(0).equals("public") && !splitCode3.get(0).equals("private")
				&& !splitCode3.get(0).equals("protected")) {
			access = "default";
		} else {
			access = splitCode3.get(0);
		}

		dataType = splitCode3.get(1);
		name = splitCode3.get(2);
		if (beingGet == true && beingSet == true) {
			getContents = "return " + name.valueOf(name.charAt(0)).toLowerCase() + ";";
			setContents = "this." + name.valueOf(name.charAt(0)).toLowerCase() + " = "
					+ name.valueOf(name.charAt(0)).toLowerCase() + ";";
		} else if (beingGet == false && beingSet == true) {
			getContents = null;
			setContents = "this." + name.valueOf(name.charAt(0)).toLowerCase() + " = "
					+ name.valueOf(name.charAt(0)).toLowerCase() + ";";
		} else if (beingGet == true && beingSet == false) {
			getContents = "return " + name.valueOf(name.charAt(0)).toLowerCase() + ";";
			setContents = null;
		} else {
			getContents = null;
			setContents = null;
		}
		
		System.out.println(toString());
		
	}
	
	public boolean isBeingGet() {
		return beingGet;
	}

	public void setBeingGet(boolean beingGet) {
		this.beingGet = beingGet;
	}

	public boolean isBeingSet() {
		return beingSet;
	}

	public void setBeingSet(boolean beingSet) {
		this.beingSet = beingSet;
	}

	public String getGetContents() {
		return getContents;
	}

	public void setGetContents(String getContents) {
		this.getContents = getContents;
	}

	public String getSetContents() {
		return setContents;
	}

	public void setSetContents(String setContents) {
		this.setContents = setContents;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "GetterSetterVO [code=" + code + ", beingGet=" + beingGet + ", beingSet=" + beingSet + ", access="
				+ access + ", dataType=" + dataType + ", name=" + name + ", getContents=" + getContents
				+ ", setContents=" + setContents + "]";
	}

}
