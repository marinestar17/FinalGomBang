package com.project.GomBang.Util;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.GomBang.VO.CkEditor;


@Controller
public class ckeditorController {
	
	
	@RequestMapping(value = "requestupload")
	public @ResponseBody CkEditor requestupload(MultipartFile upload) {
		String src = upload.getName();
		System.out.println("src value : " + src);
		MultipartFile mf = upload;
		// 파일 저장되는  서버path
		//String path = "C:\\Users\\Administrator\\Desktop\\apache-tomcat-8.0.52\\apache-tomcat-8.0.52\\webapps\\GomBangProject\\resources\\image\\";
		// 로컬에서 확인하고 싶을시에는 path를 설정하면 된다.
		/*String path = "C:\\Users\\user\\Desktop\\wow\\";*/
		//String path = "C:\\Users\\vvvxc\\Documents\\pictures\\"; /*연준이꺼*/
		String path = "C:\\Users\\SIM\\Documents\\test\\";
		/*String path= "C:\\Users\\KIM\\Documents\\test\\";*/
		/*String path = "C:\\Users\\user\\Desktop\\roomImage\\"; //김갱호 학원컴
*/		//String path = "C:\\Users\\user\\Pictures\\imagefile\\";
		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈

		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);

		String fname=System.currentTimeMillis() + originFileName;
		String safeFile = path +fname;

		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return new CkEditor("1",originFileName,"/GomBang/ckeditor/"+fname);
		//return new CkEditor("1",originFileName,"/GomBangProject/resources/image/"+fname); /*서버용*/
	}
}
