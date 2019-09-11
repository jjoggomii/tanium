package com.tt.comment.mapper;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tt.comment.vo.CommentVO;

public class CommentMapperImpl extends SqlSessionDaoSupport implements CommentMapperDAO {

	/*private final String PACKAGE_PATH = "com.tt.comment.mapper.CommentMapperDAO.";*/
	@Override
	public List<CommentVO> listComment(CommentVO cvo) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("listComment");
	}
	@Override
	public int insertComment(CommentVO cvo) {
		// TODO Auto-generated method stub
		return getSqlSession().insert("insertComment");
	}

}
