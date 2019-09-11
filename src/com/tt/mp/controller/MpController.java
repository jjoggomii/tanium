package com.tt.mp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tt.member.vo.MemberVO;
import com.tt.mp.service.MpServiceDAO;

@Controller
@RequestMapping(value="/mp")
public class MpController {
	
	private static final String CONTEXT_PATH = "mypage";
	
	@Autowired 
	private MpServiceDAO mpService;
	
	@RequestMapping(value="/selectMp")
	public ModelAndView selectMp (@ModelAttribute MemberVO membervo,HttpSession session){
		System.out.println("MpController selectMp() 진입 >>>> ");
		membervo = (MemberVO)session.getAttribute("logininfo");
		
		String mbno = membervo.getMbno();
		membervo.setMbno(mbno);
		
		List<MemberVO> list = mpService.selectMp(membervo);
		
		System.out.println("list >>>>" + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName(CONTEXT_PATH+"/mypage_select");
		
		return mav;
	}
	
	@RequestMapping(value="/updateMp")
	public ModelAndView updateMp (@ModelAttribute MemberVO membervo){
		System.out.println("MpController updateMp() 진입 >>>> ");
		System.out.println("membervo.getMbname"+membervo.getMbname());
		System.out.println("membervo.getMbno"+membervo.getMbno());
		System.out.println("membervo.getMbtel"+membervo.getMbtel());
		System.out.println("membervo.getMbaddr"+membervo.getMbaddr());
		System.out.println("membervo.getMbhobby"+membervo.getMbhobby());
		System.out.println("membervo.getMbmarry"+membervo.getMbmarry());		
		
		int result = mpService.updateMp(membervo);
		
		System.out.println("updateMp result >>>>" + result);
		
		ModelAndView mav = new ModelAndView();
		String mbno = membervo.getMbno();
		
		if(result>0){
			mav.addObject("mbno", mbno);
			mav.setViewName(CONTEXT_PATH + "/goSelectPage");

		}
		
		return mav;
	}
	

}
