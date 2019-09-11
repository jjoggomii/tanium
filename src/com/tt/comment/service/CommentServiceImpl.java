package com.tt.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tt.comment.mapper.CommentMapperDAO;
import com.tt.comment.vo.CommentVO;
import com.tt.common.ChaeBun;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
@Transactional
public class CommentServiceImpl implements CommentServiceDAO {
	
	@Autowired CommentMapperDAO cmMapper;
	
	@Override
	public List<CommentVO> listComment(CommentVO cvo) {
		// TODO Auto-generated method stub
		
		return cmMapper.listComment(cvo);
	}
	
	@Override
	public int insertComment(CommentVO cvo) {
		// TODO Auto-generated method stub
		
		String bcno = ChaeBun.bcNo();
		
		cvo.setBcno(bcno);
		
		int result = cmMapper.insertComment(cvo);
		
		return result;
	}

}
