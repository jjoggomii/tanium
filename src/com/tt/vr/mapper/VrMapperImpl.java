package com.tt.vr.mapper;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tt.vr.vo.VrVO;


public class VrMapperImpl extends SqlSessionDaoSupport implements VrMapperDAO {
		
		private final String PACKAGE_PATH="com.tt.vr.mapper.VrSqlMap.";
	
	
	@Override
	public int insertVr(VrVO vrvo) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().insert(PACKAGE_PATH+"VrSqlMap");
	}

}
