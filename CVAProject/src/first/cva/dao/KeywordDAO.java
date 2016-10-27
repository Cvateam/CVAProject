package first.cva.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import first.cva.vo.KeywordVO;

public class KeywordDAO {

	SqlSession sqlSession;
	
	public List<KeywordVO> searchKeyword(int i) throws Exception {
		List<KeywordVO> list = null;
		sqlSession = MybatisConfig.getSqlSessionFactory().openSession();
		list = sqlSession.selectList("searchKeyword" , i);
		sqlSession.close();
		return list;
	}
}
