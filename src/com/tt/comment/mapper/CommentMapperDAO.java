package com.tt.comment.mapper;

import java.util.List;

import com.tt.comment.vo.CommentVO;

public interface CommentMapperDAO {
	public List<CommentVO> listComment(CommentVO cvo);
	public int insertComment(CommentVO cvo);
}
