package com.tt.mp.mapper;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tt.member.vo.MemberVO;

public class MpMapperImpl extends SqlSessionDaoSupport implements MpMapperDAO {

	@Override
	public List<MemberVO> selectMp(MemberVO membervo) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectMp");
	}
	
	@Override
	public int updateMp(MemberVO membervo) {
		// TODO Auto-generated method stub
		return getSqlSession().update("updateMp");
	}
}
