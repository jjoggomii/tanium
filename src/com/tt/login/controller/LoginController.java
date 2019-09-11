package com.tt.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import com.tt.login.service.LoginServiceDAO;
import com.tt.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/loginStart")
public class LoginController {
	
	private static final String CONTEXT_PATH = "login";
	
	@Autowired
	private LoginServiceDAO loginService;
	
	@RequestMapping(value = "/start")
	public String mianView(){
		System.out.println("메인 화면 전환 >>> : ");
		String view = "main";
		return view;
	}
	
	@RequestMapping(value = "/loginForm")
	public ModelAndView login(@ModelAttribute MemberVO param){
		System.out.println("로그인 뷰 함수 시작 >>> : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/loginForm");
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logoutCheck(HttpSession session){
		System.out.println("logoutCheck() in >>> ");
		System.out.println("session >>> : " + session);
		
		if (session != null) {
			 session.invalidate();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/loginForm");
		return mav;
	}
	
	
	@RequestMapping(value = "/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session){
		System.out.println("id >>> " + vo.getMbno());
		System.out.println("pw >>> " + vo.getMbpw());
		boolean result = loginService.loginCheck(vo, session);
		System.out.println("22 >>> " + result);
		ModelAndView mav = new ModelAndView();
		
		String r = "";
		
		if(result==true){// 로그인 성공
			mav.addObject("msg", "success");
			
			mav.setViewName("/main");
			
		}else{// 로그인 실패
			//다시 로그인 페이지로 이동
			r = "n";
			mav.addObject("r",r);
			mav.setViewName(CONTEXT_PATH+"/loginForm");
			System.out.println("login fail");
		}
		
		return mav;
	}
	
	
	
}
