package first.cva.vo;

import java.util.ArrayList;

public class ClassVO {

	private String code;
	private String className;
	private boolean main;
	private int variableNum;
	private int generatorNum;
	private int methodNum;
	private int getterSetterNum;

	public ClassVO(String code) {
		this.code = code;
		if (code.indexOf("Main") != -1) {
			main = true;
		}

		String code1 = "";
		String[] splitCode = code.split("\n");
		ArrayList<String> keyword = new ArrayList<>();
		keyword.add("int");
		keyword.add("double");
		keyword.add("string");
		keyword.add("void");
		ArrayList<String> splitCode1 = new ArrayList<>();
		ArrayList<Integer> memberVariableStart = new ArrayList<>();
		ArrayList<String> memberVariableString = new ArrayList<>();
		ArrayList<Integer> generatorStart = new ArrayList<>();
		ArrayList<String> generatorString = new ArrayList<>();
		ArrayList<Integer> generatorEnd = new ArrayList<>();
		ArrayList<Integer> methodStart = new ArrayList<>();
		ArrayList<String> methodString = new ArrayList<>();
		ArrayList<Integer> methodEnd = new ArrayList<>();
		ArrayList<Integer> getterSetterStart = new ArrayList<>();
		ArrayList<String> getterSetterString = new ArrayList<>();
		ArrayList<Integer> getterSetterEnd = new ArrayList<>();
		ArrayList<VariableVO> memberVariableCode = new ArrayList<>();
		ArrayList<GeneratorVO> generatorCode = new ArrayList<>();
		ArrayList<MethodVO> methodCode = new ArrayList<>();
		ArrayList<GetterSetterVO> getterSetterCode = new ArrayList<>();
		int parenthesis = 0;
		
		for (int ii = 0; ii < splitCode.length; ii++) {
			splitCode1.add(splitCode[ii]);
		}

		String[] searchName = splitCode1.get(0).split("class ");
		this.className = searchName[searchName.length - 1];
		for (int ii = 0; ii < splitCode1.size(); ii++) {
			if (splitCode1.get(ii).indexOf(className) != -1) {
				generatorStart.add(ii);
				generatorString.add(splitCode1.get(ii));
				for (int jj = ii + 1; jj < splitCode1.size(); jj++) {
					generatorString.add(splitCode1.get(jj));
					if (splitCode1.get(jj).indexOf("{") != -1) { // 어디서부터 어디까지인가
						parenthesis++;
					} else if (splitCode1.get(jj).indexOf("}") != -1) {
						parenthesis--;
						if (parenthesis == 0 && ii != 0) {
							
							break;
						}
					}
				}
			}
		} // 클래스, 생성자 찾음.

		generatorStart.remove(0);
		// 쓰레기값.
		
		for (int ii = 0; ii < splitCode.length; ii++) {
			generatorString.remove(0);
		}
		
		for (int ii = 0; ii < generatorString.size(); ii++) {
			code1 += generatorString.get(ii) + "\n";
			if (generatorString.get(ii).indexOf("{") != -1) {
				parenthesis++;
			} else if (generatorString.get(ii).indexOf("}") != -1) {
				parenthesis--;
				if (parenthesis == 0 && ii != 0) {
					generatorCode.add(new GeneratorVO(code1));
					code1 = "";
				}
			}
		}

		for (int ii = 0; ii < generatorStart.get(0); ii++) {
			if ((splitCode1.get(ii).indexOf("int") != -1 || splitCode1.get(ii).indexOf("double") != -1
					|| splitCode1.get(ii).indexOf("void") != -1 || splitCode1.get(ii).indexOf("string") != -1)
					&& (splitCode1.get(ii).indexOf("(") == -1) && (splitCode1.get(ii).indexOf(";") != -1)) {
				memberVariableStart.add(ii);
				memberVariableString.add(splitCode1.get(ii));
			}
		} // 멤버변수 찾음.
		for (int ii = 0; ii < memberVariableStart.size(); ii++) {
			memberVariableCode.add(new VariableVO(memberVariableString.get(ii)));
		}

		for (int ii = 0; ii < memberVariableStart.size(); ii++) {
			int getterSetterSize = getterSetterNum;
			// 멤버변수가 private이면 멤버변수의 데이터 타입과 첫알파벳을 대문자로 한 메소드를 찾는다.
			if (memberVariableString.get(ii).indexOf("private") != -1) {
				String type = "";
				String name = "";
				String[] c = memberVariableString.get(ii).trim().split(" ");
				for (int jj = 0; jj < c.length - 1; jj++) {
					if ((c[jj].equals("int") || c[jj].equals("double") || c[jj].equals("void")
							|| c[jj].equals("string"))) {
						type = c[jj];
						name = c[jj + 1];
						name = name.replace(";", " ");
						name = name.trim();
						for (int kk = 0; kk < splitCode1.size(); kk++) {
							if ((splitCode1.get(kk).indexOf(type) != -1)
									&& (splitCode1.get(kk).indexOf(name.valueOf(name.charAt(0)).toUpperCase()) != -1)
									&& (splitCode1.get(kk).indexOf("(") == -1)) {
								getterSetterStart.add(kk);
								getterSetterString.add(splitCode1.get(kk));
								for (int hh = kk + 1; hh < splitCode1.size(); hh++) {
									getterSetterString.add(splitCode1.get(hh));
									if (splitCode1.get(hh).indexOf("{") != -1) { 
										parenthesis++;
									} else if (splitCode1.get(hh).indexOf("}") != -1) {
										parenthesis--;
										if (parenthesis == 0) {
											getterSetterSize--;
											break;
										}
									}
								}
								if (getterSetterSize == 0) {
									break;
								}
							}
						}
					}
				}
			}
		} // 게터세터 찾았다 씌벌 4중포문 4중 이프 건들지마
		
		for (int ii = 0; ii < getterSetterString.size(); ii++) {
			code1 += getterSetterString.get(ii) + "\n";
			if (getterSetterString.get(ii).indexOf("{") != -1) { // 어디서부터 어디까지인가
				parenthesis++;
			} else if (getterSetterString.get(ii).indexOf("}") != -1) {
				parenthesis--;
				if (parenthesis == 0 && ii != 0) {
					getterSetterCode.add(new GetterSetterVO(code1));
					code1 = "";
				}
			}
		}

		for (int ii = 0; ii < splitCode1.size(); ii++) {
			int methodSize = methodNum;
			if ((splitCode1.get(ii).indexOf("int") != -1 || splitCode1.get(ii).indexOf("double") != -1
					|| splitCode1.get(ii).indexOf("void") != -1 || splitCode1.get(ii).indexOf("string") != -1)
					&& (splitCode1.get(ii).indexOf("(") != -1) && (splitCode1.get(ii).indexOf(";") == -1)
					&& (ii > generatorStart.get(generatorStart.size() - 1))) {
				methodStart.add(ii);
				methodString.add(splitCode1.get(ii));
				for (int jj = ii + 1; jj < splitCode1.size(); jj++) {
					methodString.add(splitCode1.get(jj));
					if (splitCode1.get(jj).indexOf("{") != -1) { // 어디서부터 어디까지인가
						parenthesis++;
					} else if (splitCode1.get(jj).indexOf("}") != -1) {
						parenthesis--;
						if (parenthesis == 0) {
							methodSize--;
							break;
						}
					}
				}
				if (methodSize == 0) {
					break;
				}
			}
		} // 메소드 찾음
		
		for (int ii = 0; ii < methodString.size(); ii++) {
			code1 += methodString.get(ii) + "\n";
			if (methodString.get(ii).indexOf("{") != -1) { // 어디서부터 어디까지인가
				parenthesis++;
			} else if (methodString.get(ii).indexOf("}") != -1) {
				parenthesis--;
				if (parenthesis == 0 && ii != 0) {
					methodCode.add(new MethodVO(code1));
					code1 = "";
				}
			}
		}
		
		this.generatorNum = generatorStart.size();
		this.variableNum = memberVariableStart.size();
		this.methodNum = methodStart.size();
		this.getterSetterNum = getterSetterStart.size();
		
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public boolean isMain() {
		return main;
	}

	public void setMain(boolean main) {
		this.main = main;
	}

	public int getVariableNum() {
		return variableNum;
	}

	public void setVariableNum(int variableNum) {
		this.variableNum = variableNum;
	}

	public int getGeneratorNum() {
		return generatorNum;
	}

	public void setGeneratorNum(int generatorNum) {
		this.generatorNum = generatorNum;
	}

	public int getMethodNum() {
		return methodNum;
	}

	public void setMethodNum(int methodNum) {
		this.methodNum = methodNum;
	}

	@Override
	public String toString() {
		return "ClassVO [code=" + code + ", className=" + className + ", main=" + main + ", variableNum=" + variableNum
				+ ", generatorNum=" + generatorNum + ", methodNum=" + methodNum + ", getterSetterNum=" + getterSetterNum + "]";
	}

	public int getGetterSetterNum() {
		return getterSetterNum;
	}

	public void setGetterSetterNum(int getterSetterNum) {
		this.getterSetterNum = getterSetterNum;
	}

	
	
}
