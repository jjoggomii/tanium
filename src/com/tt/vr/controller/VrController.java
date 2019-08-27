package com.tt.vr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tt.vr.service.VrServiceDAO;
import com.tt.vr.vo.VrVO;

//컨트롤러 어노테이션 선언
@Controller
@RequestMapping(value="/vr")
public class VrController {
	
	private static final String CONTEXT_PATH = "vr";
	private static final String CONTEXT_PATH2 = "Yang1";
	private static final String CONTEXT_PATH2 = "Yang22";
	
	@Autowired
	private VrServiceDAO vrService;
	
	@RequestMapping("/insertVr")
	public ModelAndView vrInsert(@ModelAttribute VrVO vrvo){
		
		String resultStr="";
		int result = vrService.insertVr(vrvo);
		
		if(result>0) resultStr = "insert 성공!";
		else resultStr = "insert 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultStr );
		mav.setViewName("result");
		return mav;
	}
	
}
