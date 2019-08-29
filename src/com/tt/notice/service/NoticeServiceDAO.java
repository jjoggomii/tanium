package com.tt.notice.service;

import java.util.List;

import com.tt.notice.vo.NoticeVO;

public interface NoticeServiceDAO {
	
	public List<NoticeVO> listNotice(NoticeVO ntvo);
	public int insertNotice (NoticeVO ntvo);
}
