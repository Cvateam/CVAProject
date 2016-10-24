package first.cva.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import first.cva.vo.Customer;

/**
 * 고객 정보 관련 DB 처리
 */
public class CustomerDAO {
	/**
	 * MyBatis 사용을 위한 객체
	 */
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory(); 
	
	/**
	 * 고객 정보를 DB에 저장한다.
	 * @param customer DB에 저장할 고객 정보를 담은 객체
	 */
	public void insertCustomer(Customer customer) {
		SqlSession ss = null;
		
		try {
			ss = factory.openSession();
			ss.insert("customerMapper.insertCustomer", customer);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
	}
	
	/**
	 * ID를 전달받아 해당되는 고객의 정보를 읽는다.
	 * @param custid 검색할 고객 아이디
	 * @return 검색된 고객 정보. 해당되는 ID가 없는 경우 null 리턴.
	 */
	public Customer selectCustomer(String custid) {
		SqlSession ss = null;
		Customer customer = null;
		
		try {
			ss = factory.openSession();
			customer = ss.selectOne("customerMapper.selectCustomer", custid);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		
		return customer;
	}

	/**
	 * 회원정보 수정
	 * @param customer 수정할 고객 정보를 담은 객체
	 * @return 수정된 레코드 수
	 */
	public int updateCustomer(Customer customer) {
		SqlSession ss = null;
		int result = 0;
		
		try {
			ss = factory.openSession();
			result = ss.update("customerMapper.updateCustomer", customer);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return result;
	}
	
	/**
	 * 고객의 아이디/패스워드 찾기
	 * @param customer 검색할 고객 정보의 일부를 담은 객체
	 * @return 검색된 고객 정보
	 */
	public Customer searchCustomer(Customer customer) {
		SqlSession ss = null;
 
		try {
			ss = factory.openSession();
			customer = ss.selectOne("customerMapper.searchCustomer", customer);
			System.out.println("DAO:" + customer);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}

		return customer;		
	}

}
