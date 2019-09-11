package com.tt.notice.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tt.notice.vo.NoticeVO;

public class NoticeMapperImpl extends SqlSessionDaoSupport implements NoticeMapperDAO {

	@Override
	public List<NoticeVO> listNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("listNotice");
	}
	@Override
	public List<NoticeVO> selectNotice(String ntno) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectNotice");
	}
	@Override
	public int insertNotice(NoticeVO ntvo) {
		// TODO Auto-generated method stub
		return getSqlSession().insert("insertNotice");
	}
	
	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("listCount");
	}
	
	@Override
	public int insertFile(Map<String, Object> fileList) {
		// TODO Auto-generated method stub
		return getSqlSession().insert("insertFile");
		
	}
	@Override
	public List<NoticeVO> selectFile(String ntno) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectFile");
	}
	
	@Override
	public NoticeVO getFile(String atno) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("getFile");
	}
}
