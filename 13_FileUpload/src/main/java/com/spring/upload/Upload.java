package com.spring.upload;

import java.io.File;
import java.util.Calendar;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
// 스프링에서 비지니스 로직을 수행할 때 붙이는 어노테이션
// 해당 Upload라는 클래스는 비지니스 로직을 수행하는 클래스
public class Upload {
	
	// if문으로 물어본 값에 대한 true/false
	public boolean fileUpload(MultipartHttpServletRequest mRequest) {
		boolean isUpload = false;
		String uploadPath = "C:\\Users\\user1\\git\\Spring_Classes\\13_FileUpload\\src\\main\\webapp\\resources\\upload\\";
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		// 업로드 된 파일들의 이름 목록을 제공하는 메서드
		Iterator<String> iterator = mRequest.getFileNames();
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			System.out.println("uploadFileName"+uploadFileName);
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();			
						
			// 실제 폴더를 만들어 보자(파일복사)
			// ..............\\resources\\upload\\2022-11-25
			String homedir = uploadPath + year + "-" + month + "-" + day;
			File path1 = new File(homedir);
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			// 실제 파일을 만들어 보자
			if(!originalFileName.equals("")) {
				originalFileName = System.currentTimeMillis() + "_" + originalFileName;
				try {
					// ..............\\resources\\upload\\2022-11-25\\실제파일이름
					File origin = new File(homedir+"/"+originalFileName);
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드
					mFile.transferTo(origin);
					isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			}
		} // while문 end
		
		return isUpload;
	}

}
