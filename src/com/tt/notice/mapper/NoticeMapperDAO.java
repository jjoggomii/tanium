package com.tt.notice.mapper;

import java.util.List;

import com.tt.notice.vo.NoticeVO;

public interface NoticeMapperDAO {

	public List<NoticeVO> listNotice(NoticeVO ntvo);
	public int insertNotice (NoticeVO ntvo);
}
