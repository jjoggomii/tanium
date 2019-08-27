package com.tt.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.tt.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")


public class MemberActionController {

	
	@RequestMapping(value = "/start.do",method = RequestMethod.POST)
	public ModelAndView memberMenu(@RequestParam ("management")String management){
		System.out.println("메뉴 컨트롤러 시작 >>> : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/menu");
		return mav;
	}
	
	@RequestMapping(value = "/join.do",method = RequestMethod.POST)
	public ModelAndView memberJoin(@RequestParam ("mbno")String mbno){
		System.out.println("사원등록 팝업 시작 >>> : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/memberjoin_pop");
		return mav;
	}
	@RequestMapping(value ="/insert.do",method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO param){
		
		System.out.println("사원등록 시작 >>> : ");
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	@RequestMapping(value = "/select.do",method = RequestMethod.POST)
	public ModelAndView memberSelect(@RequestParam ("mbno")String mbno){
		System.out.println("사원조회 시작 >>> : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/selectform");
		
		return mav;
	}
}
