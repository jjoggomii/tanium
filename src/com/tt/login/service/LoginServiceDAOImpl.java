package com.tt.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tt.login.mapper.LoginMapperDAO;
import com.tt.member.vo.MemberVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
@Transactional
public class LoginServiceDAOImpl implements LoginServiceDAO {
	
	@Autowired
	private LoginMapperDAO loginMapperDAO; 
	
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		System.out.println("44>>> service in >>> ");
		System.out.println("mbno >>> " + vo.getMbno());
		System.out.println("mbpw >>> " + vo.getMbpw());
		//int result = 0;
		boolean boo = false;
		MemberVO mVo = loginMapperDAO.loginCheck(vo);
		System.out.println("777 >>> " + mVo);
		if(mVo != null){//true일 경우 세션에 등록
			boo = true;
			MemberVO vo2 = viewMember(vo);
			//세션변수등록
//			session.setAttribute("mbno", vo2.getMbno());
//			session.setAttribute("mbname", vo2.getMbname());
//			session.setAttribute("mbpw", vo2.getMbpw());
//			session.setAttribute("mbgender", vo2.getMbgender());
//			session.setAttribute("mbtel", vo2.getMbtel());
//			session.setAttribute("mbbirth", vo2.getMbbirth());
//			session.setAttribute("mbemail", vo2.getMbemail());
//			session.setAttribute("mbaddr", vo2.getMbaddr());
//			session.setAttribute("mbpostcode", vo2.getMbpostcode());
//			session.setAttribute("mbhobby", vo2.getMbhobby());
//			session.setAttribute("mbjoindate", vo2.getMbjoindate());
//			session.setAttribute("dname", vo2.getDname());
//			session.setAttribute("gname", vo2.getGname());
//			session.setAttribute("pname", vo2.getPname());
//			session.setAttribute("rname", vo2.getRname());
//			session.setAttribute("tname", vo2.getTname());
//			session.setAttribute("mbpicture", vo2.getMbpicture().substring(98));
//			session.setAttribute("mbstamp", vo2.getMbstamp().substring(98));
//			
			session.setAttribute("logininfo", vo2);
			
		}else{System.out.println("555 >>> ");}
		return boo;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return loginMapperDAO.viewMember(vo);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub

	}

}
