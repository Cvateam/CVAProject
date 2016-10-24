package first.cva.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import first.cva.dao.CustomerDAO;
import first.cva.vo.Customer;


/**
 * 고객 정보 관련 액션 클래스
 */
public class CustomerAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	Customer customer;		/** 고객 정보 */
	String custid;			/** 고객 아이디 */
	String password;		/** 고객 비밀번호 */
	boolean duplicated;		/** 아이디 중복 여부 */
	
	CustomerDAO dao = new CustomerDAO();	/** 고객 정보 DAO 객체 */
	Map<String, Object> session;		/** 세션 정보 */
	
	/**
	 * SessionAware의 메서드 오버라이딩. 세션 정보를 Map 타입으로 전달받음.
	 */
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;		
	}
	
	/** 
	 * 고객 가입 처리
	 */
	public String insertCustomer() {
		dao.insertCustomer(customer);
		return SUCCESS;
	}

	/**
	 * ID 중복 검사
	 */
	public String idCheck() {
		customer = dao.selectCustomer(custid);
		duplicated = customer != null;		//해당 ID가 있으면 사용 불가능
		return SUCCESS;
	}
	
	
	/** 
	 * 로그인 처리
	 */
	public String login() {
		customer = dao.selectCustomer(custid);
		
		//ID가 없거나 비밀번호가 다르면 로그인 실패
		if (customer == null) {
			return INPUT;
		}
		if (!password.equals(customer.getPassword())) {
			return INPUT;
		}
		//로그인 성공하는 경우 세션에 로그인 정보 저장
		session.put("loginId", custid);
		
		//"admin" 아이디로 로그인한 경우 세션에 관리자 여부 저장
		if (custid.equals("admin")) {
			session.put("isAdmin", true);
			return "admin";
		}
		
		return SUCCESS;	
	}
	
	/**
	 * 로그아웃 처리
	 */
	public String logout() {
		session.clear();
		return SUCCESS;
	}
	
	/**
	 * 고객정보 수정 폼을 보여준다. 
	 */
	public String updateCustomerForm() {
		custid = (String) session.get("loginId");
		customer = dao.selectCustomer(custid);
		return SUCCESS;
	}
	
	/**
	 * 고객 정보 수정
	 */
	public String updateCustomer() {
		custid = (String) session.get("loginId");
		customer.setCustid(custid);
		dao.updateCustomer(customer);
		return SUCCESS;
	}

	/**
	 * 고객의 아이디 / 패스워드 찾기
	 */
	public String searchCustomer() {
		System.out.println(customer);
		customer = dao.searchCustomer(customer);
		return SUCCESS;
	}
	
	
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isDuplicated() {
		return duplicated;
	}

	public void setDuplicated(boolean duplicated) {
		this.duplicated = duplicated;
	}

	public CustomerDAO getDao() {
		return dao;
	}

	public void setDao(CustomerDAO dao) {
		this.dao = dao;
	}
	
}
