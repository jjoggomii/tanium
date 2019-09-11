package com.tt.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tt.common.MultiFileUpload;
import com.tt.notice.service.NoticeServiceDAO;
import com.tt.notice.vo.NoticeVO;

//컨트롤러 어노테이션 선언하기
@Controller
@RequestMapping(value = "/nt")
public class NoticeController {

	private static final String CONTEXT_PATH = "notice";

	@Autowired
	private NoticeServiceDAO ntService;
	@Autowired
	private MultiFileUpload mfu;

	@RequestMapping(value = "/listNotice")
	// String -> key(test) Object ->value(10)
	public ModelAndView listNotice(@RequestParam Map<String, Object> map) {
		System.out.println("컨트롤러 listNotice 진입 >>");

		// 페이지 구하기
		int nCnt = ntService.listCount(); // 게시글 총 갯수
		System.out.println("nCnt >>> " + nCnt);
		int page = 10; // 한 페이지에 보여줄 게시글 갯수

		// Maht.ceil() --> 올림처리
		// 페이징 될 수
		double paging = Math.ceil((float) nCnt / (float) page);
		System.out.println("paging >>> " + paging);
		// end of 페이지 구하기

		// map에 담아 있는 것 중에서 하나를 뽑아오려면 .get()으로 가져오는데
		// .get() 안에는 "key명"
		// (int)로 형변환 한 이유는 value에 Object로 받아왔기 때문에 int로 쓰기 위해서 형변환 한 것.
		// 처음 조회되면 1페이지니까 1이라고 초기화
		int pResult = 1;
		// map.get() 안에 있는 pResult-->jsp에 있는 hidden
		if (map.get("pResult") != null && map.get("pResult") != "") {
			pResult = Integer.parseInt((String) map.get("pResult"));
		}
		// int pResult = Integer.parseInt((String) map.get("pResult")) ;

		int endNum = page * pResult;
		int startNum = endNum - page + 1;

		map.put("endNum", endNum);
		map.put("startNum", startNum);

		// 현재 페이지의 시작 번호
		int index = nCnt - (page * (pResult - 1));
		
		//페이징의 페이지 ex) 1,2,3,4,5 --> 1페이지
		int nPage = (pResult-1) /5 +1;
		//페이징의 페이지 총 갯수 만약 총 페이징이 14번까지 있으면 3
		double fPage = Math.ceil(paging / 5); 
	
		//페이징의 페이지의 시작번호 1,6,11 etc
		int sPage = ((pResult-1) /5) * 5 +1;
		
		//페이징의 페이지의 마지막 번호 5,10,15 만약 페이징 마지막 번호가 17이면 17 
		int ePage = nPage*5;
		
		if (nPage == fPage) {
			ePage = (int)paging;
		}
		
		ModelAndView mav = new ModelAndView();
		
		if (nPage == 1) {
			mav.addObject("sss", "s");
		} else if (nPage == (int)fPage) {
			mav.addObject("sss", "e");
		}
		
		
		List<NoticeVO> list = ntService.listNotice(map);
		System.out.println("list : " + list + "\n");
		System.out.println(list.toString());

		mav.addObject("ntList", list);
		mav.addObject("index", index);
		mav.addObject("paging", paging);
		mav.addObject("sPage", sPage);
		mav.addObject("ePage", ePage);
		mav.setViewName(CONTEXT_PATH + "/notice_list");

		return mav;
	}

	@RequestMapping(value = "/selectNotice")
	public ModelAndView selectNotice(@RequestParam("listntno") String ntno) {
	//public ModelAndView selectNotice(@ModelAttribute NoticeVO nvo) {
		System.out.println("selectNotice() >>>>");
		System.out.println("넘어온 ntno >>>> " + ntno);

		List<NoticeVO> ntList = ntService.selectNotice(ntno);
		List<NoticeVO> atList = ntService.selectFile(ntno);
		System.out.println("ntList >>>" + ntList);
		System.out.println("atList >>>" + atList);
		int atSize = atList.size();
		
		System.out.println("atSize >>>" + atSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ntSelect", ntList);
		mav.addObject("atList", atList);
		mav.addObject("atSize", atSize);
		mav.setViewName(CONTEXT_PATH + "/notice_select");
		return mav;
	}

	@RequestMapping(value = "/goInsertPage")
	public ModelAndView goInsertPage(@ModelAttribute NoticeVO ntvo) {
		System.out.println("NoticeController goInsertPage() >>>");

		System.out.println("인서트 페이지 이동 >>> : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/notice_insert");

		return mav;
	}

	@RequestMapping(value = "/insertNotice.tan")
	public ModelAndView insertNotice(@ModelAttribute NoticeVO ntvo,
			MultipartHttpServletRequest mtpRequest,HttpSession session) {
		
		System.out.println("NoticeController insertNotice() >>>>");

		System.out.println("ntsubject >>>> " + ntvo.getNtsubject());
		System.out.println("ntcontent >>>> " + ntvo.getNtcontent());

		int nResult = ntService.insertNotice(ntvo,session);

		System.out.println("nResult >>> :  " + nResult);

		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>>  fileList = mfu.multiUpload(ntvo, mtpRequest);
		
		for (int i = 0; i < fileList.size(); i++) {
			System.out.println("컨트롤러 파일리스트 파일네임 체크" + fileList.get(i).get("filename"));
		}
		
		System.out.println("fileList.size() >>> " + fileList.size());
		String fname= (String) fileList.get(0).get("filename");
		if(fname != null && fname != ""){
		int aResult = ntService.insertFile(fileList);
		System.out.println("aResult >>> " + aResult);
		}
		
		if (nResult > 0) {
			mav.addObject("listntno", ntvo.getNtno());
			mav.setViewName(CONTEXT_PATH + "/goSelectPage");
		}
		

		return mav;
	}
	
	@RequestMapping(value="/downloadFile.tan")
	 public void bbsService(HttpServletRequest req, HttpServletResponse resp,@RequestParam Map<String,Object> map) throws ServletException, IOException {
        String atno = (String)map.get("atno");
        
        NoticeVO nvo = ntService.getFile(atno);
        
        String filepath = nvo.getAtfilepath();
        System.out.println("파일경로 >>>>" + filepath);
        
        String filename = nvo.getAtfilename();
        System.out.println("파일명 >>>>" + filename);
        
        //filePath에 경로+파일명까지 있기 때문에 filePath만 넘껴준다
        File file = new File(filepath);
        System.out.println(file.getPath());
        System.out.println(file.getName());
//        resp.setContentType("aplication/octet-stream");        // download 동일
        resp.setContentType("aplication/download");
//        resp.setContentLength((int) file.length());
        resp.setContentLengthLong(file.length());
        
        // 모든 브라우저가 지원
        filename = URLEncoder.encode(filename, "utf-8").replace("+", "%20").replace("(", "%28").replace(")", "%29");
        
        // 익스플로러는 지원 안됨
//        originFileName = new String(originFileName.getBytes("utf-8"), "iso-8859-1").replace("+", "%20");
 
        // Content-Disposition: form-data; name="fileName"; filename="파일명"
        resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
        
        OutputStream out = resp.getOutputStream();
        FileInputStream fis = null;
        
        try {
            int temp;
            fis = new FileInputStream(file);
            while((temp = fis.read()) != -1) {
                out.write(temp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(fis != null) {
                try {
                    fis.close();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        
    }



}
