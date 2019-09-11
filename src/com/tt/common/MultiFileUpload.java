package com.tt.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tt.notice.vo.NoticeVO;

@Service
public class MultiFileUpload {

	public ArrayList<Map<String, Object>> multiUpload(NoticeVO ntvo,MultipartHttpServletRequest mtpRequest) {
		System.out.println("MultiFileUpload>>>>>>>>>>>>");
		
		 List<MultipartFile> fileList = mtpRequest.getFiles("file");
		 for (int i = 0; i < fileList.size(); i++) {
			 System.out.println("fileList >>> "+ fileList.get(i));
		}
		
		
		 
		 
			

			String path = "D:\\file\\";
			
			ArrayList<Map<String, Object>> aList = new ArrayList<Map<String, Object>>();
			
			for (MultipartFile mf : fileList) {	 
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				String filePath = path + System.currentTimeMillis()
						+ originFileName;
				System.out.println("originFileName >>> " + originFileName);
				System.out.println("filePath>>> "+filePath);
				
				map.put("filename", originFileName);
				map.put("filepath", filePath);
				map.put("ntno", ntvo.getNtno());
				
				System.out.println("파일명"+map.get("filename"));
				System.out.println("파일경로"+map.get("filepath"));
				System.out.println("가져온 ntno"+map.get("ntno"));
				
				aList.add(map);
				
				try {
					mf.transferTo(new File(filePath));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		 	
		return aList;
	}

}
