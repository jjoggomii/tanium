package com.tt.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tt.notice.service.NoticeServiceDAO;
import com.tt.notice.vo.NoticeVO;

//컨트롤러 어노테이션 선언하기
@Controller
@RequestMapping(value="/nt")
public class NoticeController {
	
	private static final String CONTEXT_PATH = "notice";
	
	@Autowired
	private NoticeServiceDAO ntService;
	
	@RequestMapping(value="/listNotice")
	public ModelAndView listNotice(@ModelAttribute NoticeVO ntvo){
		System.out.println("컨트롤러 listNotice 진입 >>");
		List<NoticeVO> list = ntService.listNotice(ntvo);
		System.out.println("list : " + list + "/n");
		System.out.println(list.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ntList",list);
		mav.setViewName(CONTEXT_PATH+"/notice_list");
		return mav;
	}
	
	
	@RequestMapping(value="/insertNotice")
	public ModelAndView insertNotice(@ModelAttribute NoticeVO ntvo){
		
		String str = "";
		int result = ntService.insertNotice(ntvo);
		
		if(result>0) str = "Notice insert 등록 성공!";
		else str = "Notice insert 등록에 문제가 있어 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",str);
		mav.setViewName("result");
		
		return mav;
	}
}
