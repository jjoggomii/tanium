package com.tt.login.mapper;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;



import com.tt.member.vo.MemberVO;


// 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class LoginMapperDAOImpl extends SqlSessionDaoSupport implements LoginMapperDAO {
	//SqlSession 객체를 스프링에서 생성하여 주입
	//의존관계 주입 (Dependency Injection), 느슨한 결합
	private final String PACKAGE_PATH = "com.tt.login.mapper.LoginSqlMap.";
	@Autowired
	private SqlSession sqlSession;//mybatis 실행 객체
	
	//회원 로그인 체크
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		//System.out.println("mapper loginCheck() in >>> ");
		//int result = 0;
		//String name = getSqlSession().selectOne(PACKAGE_PATH + "loginCheck",vo);
		MemberVO mVo = getSqlSession().selectOne(PACKAGE_PATH + "loginCheck",vo);
		//String name = mVo.getMbname();
		//MemberVO mVo = new MemberVO();
		//String name = String.valueOf(getSqlSession().selectOne(PACKAGE_PATH + "loginCheck"));
		//mVo.setMbname(name);
		
		return mVo;
	}
	//회원 로그인 정보
	@Override
	public MemberVO viewMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return (MemberVO)sqlSession.selectOne(PACKAGE_PATH + "viewMember", vo);
	}
	//회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub

	}

}
