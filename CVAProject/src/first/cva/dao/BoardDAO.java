package first.cva.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import first.cva.vo.Board;

public class BoardDAO {
	/**
	 * MyBatis 사용을 위한 객체
	 */
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();

	// 소스코드 저장한 보드 db에 처리 
	public int boardSave1(Board board) {
		SqlSession ss = null;
		int result = 0;
		try {
			ss = factory.openSession();
		    result = ss.insert("mapper.insertBoard", board );
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
	
	// 보드리스트 
	public List<Board> boardList(String custid) {
		List<Board> result = null;
		SqlSession ss = null;
		try {
			ss = factory.openSession();
		    result = ss.selectList("mapper.boardList", custid );
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return result;
	}
	
	
	public List<Board> listAll(){
		System.out.println("dao listAll");
		SqlSession ss = null;
		ss = factory.openSession();
		List<Board> result =ss.selectList("mapper.listAllBoard");
		ss.commit();
		ss.close();
		return result;
	}
	


	public List<Board> searchBoard(String title) {
		System.out.println("dao searchBoard");
		SqlSession ss = null;
		ss = factory.openSession();
		List<Board> result =ss.selectList("mapper.searchBoard",title);
		ss.commit();
		ss.close();
		return result;
	}
	
	public Board javaPopLoad(int boardnum) {
		System.out.println("dao JavaPopLoad");
		SqlSession ss = null;
		ss = factory.openSession();
		Board result =ss.selectOne("mapper.popLoad",boardnum);
		ss.commit();
		ss.close();
		return result;
	}
	
	public Board csharpPopLoad(int boardnum) {
		System.out.println("dao CsharpPopLoad");
		SqlSession ss = null;
		ss = factory.openSession();
		Board result =ss.selectOne("mapper.popLoad",boardnum);
		ss.commit();
		ss.close();
		return result;
	}

	public List<Board> javaboardList(String custid) {
		List<Board> result = null;
		SqlSession ss = null;
		try {
			ss = factory.openSession();
		    result = ss.selectList("mapper.javaboardList", custid );
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return result;
	}
	
	public List<Board> cSharpboardList(String custid) {
		List<Board> result = null;
		SqlSession ss = null;
		try {
			ss = factory.openSession();
		    result = ss.selectList("mapper.cSharpboardList", custid );
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return result;
	}
	
	
}
