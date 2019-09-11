package com.tt.notice.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.tt.notice.vo.NoticeVO;

public interface NoticeServiceDAO {
	
	public List<NoticeVO> listNotice(Map<String, Object> map);
	public List<NoticeVO>	selectNotice(String ntno);
	public int insertNotice (NoticeVO ntvo,HttpSession session);
	public int listCount();
	public int insertFile(List<Map<String, Object>> fileList);
	public List<NoticeVO> selectFile(String ntno);
	public NoticeVO getFile(String atno);
}
