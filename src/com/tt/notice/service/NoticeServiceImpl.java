package com.tt.notice.service;

import java.util.ArrayList;
import java.util.List;








import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tt.notice.mapper.NoticeMapperDAO;
import com.tt.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl  implements NoticeServiceDAO {

	@Autowired
	public NoticeMapperDAO ntMapper;
	
	@Override
	public List<NoticeVO> listNotice(NoticeVO ntvo) {
		// TODO Auto-generated method stub
		System.out.println("NoticeServiceImpl listNotice 진입 >>");
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		list = ntMapper.listNotice(ntvo);		
		return list;
	}

	@Override
	public int insertNotice(NoticeVO ntvo) {
		// TODO Auto-generated method stub
		return ntMapper.insertNotice(ntvo);
	}

}
