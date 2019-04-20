package com.project.GomBang.Util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class fileUploadController {
	/*@RequestMapping(value = "/file-upload")
	public String requestupload2(MultipartHttpServletRequest upload) {
		System.out.println("확인");
		List<MultipartFile> fileList = upload.getFiles("file");
		String src = upload.getParameter("src");
		System.out.println("src value : " + src);

		String path = "C:\\Users\\SIM\\Documents\\test\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			
			
			
			String safeFile = path + System.currentTimeMillis() + originFileName;
			System.out.println("originFileName : " + originFileName);
			System.out.println("FileName : " + safeFile);
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:/";
	}*/
}	
