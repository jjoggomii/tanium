package com.tt.login.service;

import javax.servlet.http.HttpSession;

import com.tt.member.vo.MemberVO;

public interface LoginServiceDAO {
	//회원 로그인 체크
	public boolean loginCheck(MemberVO vo, HttpSession session);
	//회원 로그인 정보
	public MemberVO viewMember(MemberVO vo);
	//회원 로그아웃
	public void logout(HttpSession session);
}
