package com.tt.notice.service;

import java.util.ArrayList;
import java.util.List;








import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tt.common.ChaeBun;
import com.tt.member.vo.MemberVO;
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
	public int insertNotice(NoticeVO ntvo,HttpSession session) {
		// TODO Auto-generated method stub
		System.out.println("NoticeServiceImpl insertNotice() 진입 >>");
		
		
		MemberVO mvo = (MemberVO)session.getAttribute("logininfo");
		
		String mbno = mvo.getMbno();
		String ntno = ChaeBun.ntNo();
		
		ntvo.setMbno(mbno);
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
	@Override
	public int insertFile(List<Map<String, Object>> fileList) {
		// TODO Auto-generated method stub
		int result = 0;
		System.out.println("fileList.size() >>> " + fileList.size());
		for (int i = 0; i < fileList.size(); i++) {
			String atno = ChaeBun.atNo();
			
			//fileList.get(i) 리스트 첫번째 맵
			Map<String, Object> map = fileList.get(i);
			
			System.out.println("fileList.get("+i+").get(filename)>>> " +fileList.get(i).get("filename"));
			
			map.put("atno", atno);
			map.put("atfilename",map.get("filename"));
			map.put("atfilepath",map.get("filepath"));
/*			map.put("atfilename",map.get("atfilename"));*/
			 ntMapper.insertFile(map);
			 result++;
		}
		
		return  result;
	}
	
	@Override
	public List<NoticeVO> selectFile(String ntno) {
		// TODO Auto-generated method stub
	
		return ntMapper.selectFile(ntno);
	}
	
	@Override
	public NoticeVO getFile(String atno) {
		// TODO Auto-generated method stub
		return ntMapper.getFile(atno);
	}
}
