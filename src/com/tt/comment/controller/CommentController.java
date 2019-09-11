package com.tt.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tt.comment.service.CommentServiceDAO;
import com.tt.comment.vo.CommentVO;

@Controller
@RequestMapping(value = "/ct")
public class CommentController {
	
	private static final String CONTEXT_PATH = "notice";
	
	@Autowired CommentServiceDAO cmService;
	
	// 전체 댓글 조회
	@RequestMapping(value="/listComment")
	//public ModelAndView listComment(@RequestParam("ntno") String ntno) {
		public ModelAndView listComment(@ModelAttribute CommentVO cvo) {
		// System.out.println(cvo.getNtno);
		System.out.println(" CommentController.listComment() 진입 >>> : ");
		System.out.println("넘어온 ntno>>> : " + cvo.getNtno());
		
/*		CommentVO cvo = new CommentVO();*/
		//System.out.println("cvo.getNtno>>>" + cvo.getNtno());
/*		cvo.setNtno(ntno);
		String cntno = cvo.getNtno();
		System.out.println("set ntno>>>"+cntno);*/
		
		List<CommentVO> list = cmService.listComment(cvo);
		System.out.println("list >>>" + list);
		System.out.println("list.size() >>>" + list.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName(CONTEXT_PATH + "/selectAll");
	
		return mav;
	}
	
	// 댓글 인서트
	@RequestMapping(value="/insertComment")
		public ModelAndView insertComment(@ModelAttribute CommentVO cvo) {
		System.out.println(" CommentController.insertComment() 진입 >>> : ");
		System.out.println("넘어온 ntno>>> : " + cvo.getNtno());
		System.out.println("넘어온 mbno>>> : " + cvo.getMbno());
		System.out.println("넘어온 bccontent>>> : " + cvo.getBccontent());
		System.out.println("넘어온 Bcmakedate>>> : " + cvo.getBcmakedate());
		
		int result = cmService.insertComment(cvo);
		ModelAndView mav = new ModelAndView();
		
		System.out.println("result>>>" + result);
		
		if(result>0){
			mav.addObject("nCnt",result);
			mav.setViewName(CONTEXT_PATH+"/insert");
		}else{
			System.out.println("실패");
		}
		
	
		return mav;
	}
	
	//select 댓글
	@RequestMapping(value="/selectComment")
	//public ModelAndView listComment(@RequestParam("ntno") String ntno) {
		public ModelAndView selectComment(@ModelAttribute CommentVO cvo) {
		// System.out.println(cvo.getNtno);
		System.out.println(" CommentController.selectComment() 진입 >>> : ");
		System.out.println("넘어온 bcno>>> : " + cvo.getBcno());

		return null;
	}
}
