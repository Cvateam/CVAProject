package first.cva.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import first.cva.vo.Question;


public class QuestionListDAO {
	SqlSession sqlsession = MybatisConfig.getSqlSessionFactory().openSession();
	
	public List<Question> listRead(){
		List<Question> questiontList =null;
		try {
			questiontList= sqlsession.selectList("mapper.listRead");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return questiontList;
	}
	
	public Question questiondetail(int qno){
		System.out.println("안뇽 난 dao");
		Question question = null;
		try {
			System.out.println("mapper갑니다");
			question = sqlsession.selectOne("mapper.questiondetail", qno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlsession.close();
		}
		System.out.println("퇴근한다");
		return question;
		
	}

}
