package com.tt.mp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tt.member.vo.MemberVO;
import com.tt.mp.service.MpServiceDAO;
import com.tt.notice.vo.NoticeVO;

@Controller
@RequestMapping(value="/mp")
public class MpController {
	
	private static final String CONTEXT_PATH = "mypage";
	
	@Autowired 
	private MpServiceDAO mpService;
	
	@RequestMapping(value="/selectMp")
	public ModelAndView selectMp (@ModelAttribute MemberVO membervo){
		System.out.println("MpController selectMp() 진입 >>>> ");
		
		String mbno = "T2019001";
		membervo.setMbno(mbno);
		
		List<MemberVO> list = mpService.selectMp(membervo);
		
		System.out.println("list >>>>" + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName(CONTEXT_PATH+"/mypage_select");
		
		return mav;
	}
	

}
