package com.tt.mp.service;

import java.util.List;

import com.tt.member.vo.MemberVO;

public interface MpServiceDAO {

	public List<MemberVO> selectMp(MemberVO membervo);
	
}
