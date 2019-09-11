package com.tt.login.mapper;

import javax.servlet.http.HttpSession;

import com.tt.member.vo.MemberVO;

public interface LoginMapperDAO {
	//login check
	public MemberVO loginCheck(MemberVO vo);
	//login information
	public MemberVO viewMember(MemberVO vo);
	// logout
	public void logout(HttpSession session);
}
