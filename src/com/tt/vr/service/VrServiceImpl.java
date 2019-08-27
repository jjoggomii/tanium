package com.tt.vr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tt.vr.mapper.VrMapperDAO;
import com.tt.vr.vo.VrVO;

@Service
@Transactional
public class VrServiceImpl implements VrServiceDAO {
	
	@Autowired
	public VrMapperDAO vrMapper;
	
	@Override
	public int insertVr(VrVO vrvo) {
		// TODO Auto-generated method stub
		return vrMapper.insertVr(vrvo);
	}

}
