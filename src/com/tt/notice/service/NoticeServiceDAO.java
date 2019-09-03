package com.tt.notice.service;

import java.util.List;
import java.util.Map;

import com.tt.notice.vo.NoticeVO;

public interface NoticeServiceDAO {
	
	public List<NoticeVO> listNotice(Map<String, Object> map);
	public List<NoticeVO>	selectNotice(String ntno);
	public int insertNotice (NoticeVO ntvo);
	public int listCount();
}