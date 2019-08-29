package com.tt.notice.mapper;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tt.notice.vo.NoticeVO;

public class NoticeMapperImpl extends SqlSessionDaoSupport implements NoticeMapperDAO {

	@Override
	public List<NoticeVO> listNotice(NoticeVO ntvo) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("listNotice");
	}

	@Override
	public int insertNotice(NoticeVO ntvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
