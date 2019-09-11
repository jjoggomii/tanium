package com.tt.comment.service;

import java.util.List;

import com.tt.comment.vo.CommentVO;

public interface CommentServiceDAO {
	
	public List<CommentVO> listComment(CommentVO cvo);
	public int insertComment(CommentVO cvo);
}
