package com.tt.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tt.common.ChaeBun;
import com.tt.notice.service.NoticeServiceDAO;
import com.tt.notice.vo.NoticeVO;

//컨트롤러 어노테이션 선언하기
@Controller
@RequestMapping(value="/nt")
public class NoticeController {
	
	private static final String CONTEXT_PATH = "notice";
	
	@Autowired
	private NoticeServiceDAO ntService;
	
	@RequestMapping(value="/listNotice")			//String -> key(test) Object ->value(10)
	public ModelAndView listNotice(@RequestParam Map<String, Object> map){
		System.out.println("컨트롤러 listNotice 진입 >>");
		
		//페이지 구하기
		int nCnt = ntService.listCount(); //게시글 총 갯수
		System.out.println("nCnt >>> " + nCnt);
		int page = 10; // 한 페이지에 보여줄 게시글 갯수
	
		//Maht.ceil() --> 올림처리 
		//페이징 될 수
		double paging = Math.ceil((float)nCnt/(float)page);
		System.out.println("paging >>> " + paging);
		//end of 페이지 구하기
		
		//map에 담아 있는 것 중에서 하나를 뽑아오려면 .get()으로 가져오는데
		// .get() 안에는 "key명"
		//(int)로 형변환 한 이유는 value에 Object로 받아왔기 때문에 int로 쓰기 위해서 형변환 한 것.
		//처음  조회되면 1페이지니까 1이라고 초기화
		int pResult =1;
		//map.get() 안에 있는 pResult-->jsp에 있는 hidden 
		if(map.get("pResult") != null && map.get("pResult") != "") {
			pResult = Integer.parseInt((String) map.get("pResult")) ;
		}
		
		int endNum = page * pResult;
		int startNum = endNum-page+1;
		
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		//현재 페이지의 시작 번호
		int index = nCnt-(page*(pResult-1));
		
		List<NoticeVO> list = ntService.listNotice(map);
		System.out.println("list : " + list + "\n");
		System.out.println(list.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ntList",list);
		mav.addObject("index",index);
		mav.addObject("paging",paging);
		mav.setViewName(CONTEXT_PATH+"/notice_list");
		
		return mav;
	}
	@RequestMapping(value="/selectNotice")			
	public ModelAndView selectNotice(@RequestParam("listntno") String ntno){
		System.out.println("selectNotice() >>>>");
		System.out.println("넘어온 ntno >>>> " + ntno);
		
		List<NoticeVO> list = ntService.selectNotice(ntno);
			System.out.println("list >>>" + list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ntSelect",list);
		mav.setViewName(CONTEXT_PATH+"/notice_select");
		return mav;
	}
	
	@RequestMapping(value="/goInsertPage")
	public ModelAndView goInsertPage(@ModelAttribute NoticeVO ntvo){
		System.out.println("NoticeController goInsertPage() >>>");
		
		System.out.println("인서트 페이지 이동 >>> : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/notice_insert");
		
		return mav;
	}
	
	@RequestMapping(value="/insertNotice.tan")
	public ModelAndView insertNotice(@ModelAttribute NoticeVO ntvo){
		
		System.out.println("NoticeController insertNotice() >>>>");
		
		System.out.println("ntsubject >>>> " + ntvo.getNtsubject());
		System.out.println("ntcontent >>>> " + ntvo.getNtcontent());
		
	/*	String mbno = "T2019001";
		String ntno = ChaeBun.ntNo();
		
		ntvo.setMbno(mbno);
//		System.out.println("  ChaeBun.ntNo()  >>>>"+ChaeBun.ntNo());	
		ntvo.setNtno(ntno);
		//ntvo.setGname("사원");
		ntvo.setNtviews(0);*/
		
		int result = ntService.insertNotice(ntvo);
		
		System.out.println("result >>> :  " + result);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0){
			mav.addObject("listntno",ntvo.getNtno());
			mav.setViewName(CONTEXT_PATH+"/goSelectPage");
		}
		
		/*String insertResult ="";
		if(result>0){
		 insertResult = "redirect:/nt/selectNotice.tan";	
		}else{
		insertResult = "redirect:/nt/insertNotice.tan";
		}*/
		
		
		return mav;
	}
}
