package com.tt.mp.mapper;

import java.util.List;

import com.tt.member.vo.MemberVO;

public interface MpMapperDAO {
	
	public List<MemberVO> selectMp(MemberVO membervo);
	public int updateMp(MemberVO membervo);
}
