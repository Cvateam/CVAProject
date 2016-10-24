package first.cva.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import first.cva.vo.KeywordVO;

public class KeywordDAO {

	SqlSession sqlSession;
	
	public List<KeywordVO> searchKeyword() throws Exception {
		List<KeywordVO> list = null;
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		list = sqlSession.selectList("searchKeyword");
		sqlSession.close();
		return list;
	}
}
