package com.tt.bt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/start")

public class btcontroller {

	
	@RequestMapping(value="/bt.tan")
	public ModelAndView main(){
		System.out.println("enter");
		ModelAndView mav =new ModelAndView();
		mav.setViewName("/btwriter");
		return mav;
	}
}
