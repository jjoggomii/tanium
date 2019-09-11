package com.tt.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tt.member.vo.MemberVO;
import com.tt.mp.mapper.MpMapperDAO;

@Service
@Transactional
public class MpServiceImpl implements MpServiceDAO {
	
	@Autowired
	public MpMapperDAO mpMapper;
	
	@Override
	public List<MemberVO> selectMp(MemberVO membervo) {
		// TODO Auto-generated method stub
		return mpMapper.selectMp(membervo);
	}
	@Override
	public int updateMp(MemberVO membervo) {
		// TODO Auto-generated method stub
		return mpMapper.updateMp(membervo);
	}

}
