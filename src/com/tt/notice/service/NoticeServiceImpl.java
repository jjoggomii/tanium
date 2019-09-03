package com.tt.notice.service;

import java.util.ArrayList;
import java.util.List;








import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tt.common.ChaeBun;
import com.tt.notice.mapper.NoticeMapperDAO;
import com.tt.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl  implements NoticeServiceDAO {

	@Autowired
	public NoticeMapperDAO ntMapper;
	
	@Override
	public List<NoticeVO> listNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("NoticeServiceImpl listNotice 진입 >>");
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		list = ntMapper.listNotice(map);		
		return list;
	}
	@Override
	public List<NoticeVO> selectNotice(String ntno) {
		// TODO Auto-generated method stub
		return ntMapper.selectNotice(ntno);
	}

	@Override
	public int insertNotice(NoticeVO ntvo) {
		// TODO Auto-generated method stub
		System.out.println("NoticeServiceImpl insertNotice() 진입 >>");
		String mbno = "T2019001";
		String ntno = ChaeBun.ntNo();
		
		ntvo.setMbno(mbno);
//		System.out.println("  ChaeBun.ntNo()  >>>>"+ChaeBun.ntNo());	
		ntvo.setNtno(ntno);
		//ntvo.setGname("사원");
		ntvo.setNtviews(0);
		
		int result = ntMapper.insertNotice(ntvo);
		
		return result;
	}
	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return ntMapper.listCount();
	}
}
