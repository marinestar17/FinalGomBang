package com.project.GomBang;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.GomBang.DAO.EnterpriseDAO;
import com.project.GomBang.VO.Customer;
import com.project.GomBang.VO.CustomerComment;
import com.project.GomBang.VO.Customerboard;
import com.project.GomBang.VO.Enterprise;
import com.project.GomBang.VO.EnterpriseBoard;
import com.project.GomBang.VO.EnterpriseComment;
import com.project.GomBang.VO.Image;
import com.project.GomBang.VO.Item;
import com.project.GomBang.VO.Reservation;
import com.project.GomBang.VO.Total;

@Controller
public class EnterpriseController {
	
	@Autowired
	EnterpriseDAO dao;
	
	ArrayList<Image> imgList = new ArrayList<Image>();
	 @RequestMapping(value="/goEnterprisePage",method=RequestMethod.GET)
	 public String goEnterprisePage() {
	  		
	  return "enterprise/enterpriseLogingo";
	}
	     
	@RequestMapping(value="/goSignup", method=RequestMethod.GET)
	public String goSignup() {
		
		return "enterprise/goEnterprisesignup";
	}
	@RequestMapping(value="/goUpdate", method=RequestMethod.GET)
	public String goUpdate(Enterprise enterprise, String enterprise_ID, String PW, String Name, String Address, String RegiNum, String ManagerName, 
			String ManagerPhone, String ManagerEmail, String ETC, String Code, Model model) {
		
		Enterprise result = dao.searchUpdate(enterprise_ID);
		if (result == null) {
			return "index-14";
		}
		model.addAttribute("Enterprise", result);
        
		System.out.println(enterprise_ID);
		
		return "enterprise/goEnterprisesignup";
	}
	@RequestMapping(value="/insertEnterprise", method=RequestMethod.POST)
	public String insertEnterprise(Enterprise enterprise) {
		
		int result = 0;
		result = dao.insertEnterprise(enterprise);
		if (result == 0) {
			return "enterprise/enterpriseSignup";
		}

		return "index-14";
	}
	@RequestMapping(value="/enterpriseLogin", method=RequestMethod.POST)
	public String login(Enterprise enterprise, HttpSession session, Model model) {
		
		Enterprise result = null;
		result = dao.selectEnterprise(enterprise);
		if (result == null) {
			model.addAttribute("warning", "Id와 Passworde를 확인해주세요.");
			return "enterprise/enterpriseLogingo";
		}
		if (result.getEnterprise_Permission().equals("Y")) {
			session.setAttribute("enterpriseLoginID", result.getEnterprise_ID());
			session.setAttribute("enterprise",result);
			model.addAttribute("ID", result.getEnterprise_ID());
			model.addAttribute("PW", result.getEnterprise_PW());
			model.addAttribute("Name", result.getEnterprise_Name());
			model.addAttribute("Address", result.getEnterprise_Address());
			model.addAttribute("RegiNum", result.getEnterprise_RegiNum());
			model.addAttribute("ManagerName", result.getEnterprise_ManagerName());
			model.addAttribute("ManagerPhone", result.getEnterprise_ManagerPhone());
			model.addAttribute("ManagerEmail", result.getEnterprise_ManagerEmail());
			model.addAttribute("ETC", result.getEnterprise_ETC());
			model.addAttribute("Code", result.getEnterprise_Code());
			ArrayList<Total> popularlist=new ArrayList<Total>();
			popularlist=dao.popularproperties();
	        model.addAttribute("popularlist",popularlist);
	        model.addAttribute("popularlista",popularlist.get(0));
	        model.addAttribute("popularlistb",popularlist.get(1));
	        model.addAttribute("popularlistc",popularlist.get(2));
	        model.addAttribute("popularlistd",popularlist.get(3));
		} else if(result.getEnterprise_Permission().equals("W")){
			model.addAttribute("wait", "관리자의 심사중입니다.");
		} else {
			model.addAttribute("deny", "가입이 거부되었습니다. 관리자에게 문의하세요.");
		}
		
		return "index-14";
	}
	@RequestMapping(value="/enterpriseLogout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		String loginId = (String)session.getAttribute("enterpriseLoginID");
		if (loginId == null) {
			return "customer/customerHome";
		}
		session.invalidate();
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		
		return "index-14";
	}
	@RequestMapping(value="/checkId", method=RequestMethod.GET)
	public @ResponseBody String checkId(String id, HttpSession session) {
		ArrayList<Enterprise> enterpriseList = dao.enterpriseList();
		
		for (Enterprise enter : enterpriseList) {
			if (enter.getEnterprise_ID().equals(id)) {
				if (session.getAttribute("enterpriseLoginID")==null) {
					return "duplicated";
				}
			}
		}
		if(id.length()<6 || id.length()>14) {
			return "fail";
		}else {
			return "success";
		}
	}
	@RequestMapping(value="/withdraw", method=RequestMethod.POST)
	public String withdraw(Enterprise enterprise, HttpSession session, Model model) {
		String loginId = (String)session.getAttribute("enterpriseLoginID");
		if (loginId==null) {
			return "enterprise/enterpriseHome";
		}
		
		enterprise.setEnterprise_ID((String)session.getAttribute("loginId"));
		dao.deleteEnterprise(enterprise);
		session.setAttribute("loginId", null);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		return "index-14";
	}
	@RequestMapping(value="/updateEnterprise", method=RequestMethod.POST)
	public String update(Enterprise enterprise, HttpSession session, Model model) {
		String loginId = (String)session.getAttribute("enterpriseLoginID");
		if (loginId==null) {
			return "enterprise/enterpriseLogingo";
		}
		
		int result = 0;
		result = dao.updateEnterprise(enterprise);
		if (result == 0) {
			return "enterprise/goEnterprisesignup";
		}
		
		model.addAttribute("ID", enterprise.getEnterprise_ID());
		model.addAttribute("PW", enterprise.getEnterprise_PW());
		model.addAttribute("Name", enterprise.getEnterprise_Name());
		model.addAttribute("Address", enterprise.getEnterprise_Address());
		model.addAttribute("RegiNum", enterprise.getEnterprise_RegiNum());
		model.addAttribute("ManagerName", enterprise.getEnterprise_ManagerName());
		model.addAttribute("ManagerPhone", enterprise.getEnterprise_ManagerPhone());
		model.addAttribute("ManagerEmail", enterprise.getEnterprise_ManagerEmail());
		model.addAttribute("ETC", enterprise.getEnterprise_ETC());
		model.addAttribute("Code", enterprise.getEnterprise_Code());
		
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		
		return "index-14";
	}
	@RequestMapping(value="/searchUpdate", method=RequestMethod.GET)
	public @ResponseBody Enterprise searchUpdate(String enterprise_ID) {
		Enterprise result = null;
		result = dao.searchUpdate(enterprise_ID);
		return result;
	}
	
	// 매물등록 페이지 이동
	@RequestMapping(value="/goInsertItem", method=RequestMethod.GET)
	public String goInsertItem() {
		return "enterprise/insertItem";
	}
	// 매물등록 페이지 이동
	@RequestMapping(value="/submitProperty", method=RequestMethod.GET)
	public String submitProperty(Model model) {
		imgList = new ArrayList<Image>();
		/*ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);*/
		return "enterprise/submit-property";
	}
	// 매물 등록하기
	@RequestMapping(value="/insertItem", method= {RequestMethod.POST,RequestMethod.GET} )
	public String insertItem(Item item,HttpSession session) {
		System.out.println("콘트롤러 확인");
		String userid = (String) session.getAttribute("enterpriseLoginID");
		item.setEnterprise_ID("aaa");
		System.out.println(item);
		dao.insertItem(item);
		System.out.println(item.getForSale_Seq());
		for (Image image : imgList) {
			image.setForSale_Seq(item.getForSale_Seq());
			dao.insertImg(image);
		}
		return "redirect:/";
	}
	
	/*//기업 게시판 이동
	@RequestMapping(value = "/goEnterpriseboard", method = RequestMethod.GET)
	public String goEnterpriseboard() {
		return "enterprise/enterpriseBoardGo";
	}*/
	
	/*//게시물 상세 확인 이동
	@RequestMapping(value = "/enterpriseBoardDetail", method = RequestMethod.GET)
	public String enterpriseBoardDetail(int enterpriseBoard_Seq, Model model) {
		EnterpriseBoard eb = new EnterpriseBoard();
		try {
			eb = dao.enterpriseBoardDetail(enterpriseBoard_Seq);
			dao.updateHitCount(enterpriseBoard_Seq);
			model.addAttribute("eb", eb);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "enterprise/enterpriseBoardDetail";
	}*/
	
	/*//게시물 등록폼으로 이동
	@RequestMapping(value = "goInsertEnterpriseBoard", method = RequestMethod.GET)
	public String insertEnterpriseBoard() {
		return "enterprise/insertEnterpriseBoard";
	}*/
	
	/*//게시물 등록
	@RequestMapping(value = "/insertEnterpriseBoard", method = RequestMethod.POST)
	public String insertEnterpriseBoard(EnterpriseBoard enterpriseboard) {
		try {
			dao.insertEnterpriseBoard(enterpriseboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "enterprise/enterpriseBoard";
	}*/
	
	/*//게시물 전체 뿌리기
	@RequestMapping(value = "/enterpriseBoardList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<EnterpriseBoard> enterpriseBoardList() {
		ArrayList<EnterpriseBoard> ebList = new ArrayList<EnterpriseBoard>();
		try {
			ebList = dao.enterpriseBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ebList;
	}*/
	
	
	@RequestMapping(value = "/file-upload")
	public String requestupload2(MultipartHttpServletRequest upload) {
		System.out.println("확인");
		
		List<MultipartFile> fileList = upload.getFiles("file");
		/*String src = upload.getParameter("src");
		System.out.println("src value : " + src);*/
		String path = "C:\\Users\\SIM\\Documents\\test\\";
		//String path = "C:\\Users\\user\\Pictures\\imagefile\\";
		//String path = "C:\\Users\\vvvxc\\OneDrive\\사진\\배경화면사진";

		
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			
			String safeFile = path + System.currentTimeMillis() + originFileName;
			System.out.println("originFileName : " + originFileName);
			System.out.println("FileName : " + safeFile);
			Image img = new Image();
			img.setOriginName(originFileName);
			img.setSaveName(System.currentTimeMillis() + originFileName);
			try {
				mf.transferTo(new File(safeFile));
				System.out.println(img);
				imgList.add(img);
				System.out.println(imgList.size());
				System.out.println("확인");
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:/gg";
	}
	
	@RequestMapping(value="/ICList",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Total> alllist(){
	 
		ArrayList<Total> list=new ArrayList<Total>();
		list=dao.ICList();
		return list;
		
	}
	
	@RequestMapping(value="/HouseTypeList",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Total> typelist(String forSale_HouseType){
	
		ArrayList<Total> typelist=new ArrayList<Total>();
		typelist=dao.HouseTypeList(forSale_HouseType);
		return typelist;
		
	}
	
	//게시판 이동
	@RequestMapping(value="/goEnterpriseboard", method=RequestMethod.GET)
	public String goBoard(HttpSession session) {
		
		String LoginID = (String)session.getAttribute("enterpriseLoginID");
		if (LoginID==null) {
			return "index-14";		}
		
		return "redirect:/enterpriseBoardlist";
	}
	
	//게시물 등록
	@RequestMapping(value="/insertEnterpriseitem", method=RequestMethod.POST)
	public @ResponseBody String insertEnterpriseitem(EnterpriseBoard enterpriseboard, Model model) {
		int result = 0;
		result = dao.insertEnterpriseBoard(enterpriseboard);
		if (result == 0) {
			return "fail";
		}else {			
			return "success";
		}
	}
	
	//게시판 리스트
	@RequestMapping(value="/enterpriseBoardlist", method= {RequestMethod.GET, RequestMethod.POST})
	public String enterpriseBoardlist(Model model, EnterpriseBoard enterpriseboard) {
		ArrayList<EnterpriseBoard> result = null;
		result = dao.enterpriseBoardList();
		if (result == null) {
			return "enterprise/enterpriseBoardGo";
		}
		
		for(EnterpriseBoard eb:result) {
			
			
			String s = eb.getEnterpriseBoard_Content();
			Pattern pattern = Pattern.compile("(<img\\b|(?!^)\\G)[^>]*?\\b(src|width|height)=([\"']?)([^\"]*)\\3");
			Matcher matcher = pattern.matcher(s);
			while (matcher.find()){
			   eb.setEnterpriseBoard_Content(matcher.group(4));
			    System.out.println(matcher.group(4));
			} 
		}
		
		model.addAttribute("ebList", result);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "enterprise/enterpriseBoardGo";
	}
	
	//게시물 보기
	@RequestMapping(value="/enterEnterpriseboard", method=RequestMethod.GET)
	public String selectEnterpriseboard(String enterpriseBoard_Seq, Model model, EnterpriseComment EnterpriseComment) {
		try {
			Integer.parseInt(enterpriseBoard_Seq);
		} catch (Exception e) {
			return "redirect:/enterpriseBoardlist";
		}
		EnterpriseBoard result = null;
		dao.countEnterpriseboard(enterpriseBoard_Seq);
		result = dao.selectEnterpriseboard(enterpriseBoard_Seq);
		if (result == null) {
			return "redirect:/enterpriseBoardlist";
		}
		model.addAttribute("enterpriseBoard", result);
						
		enterpriseCommentList3(EnterpriseComment, model);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
						
		return "enterprise/enterpriseBoardDetail";
	}
			
	//게시물 업데이트 방 이동, 정보 뿌려주기
	@RequestMapping(value="/goRemakeenterprise", method=RequestMethod.GET)
	public String goRemakeenterprise(String enterpriseBoard_Seq, Model model, EnterpriseBoard eboard) {
		try {
			Integer.parseInt(enterpriseBoard_Seq);
		} catch (Exception e) {
			return "redirect:/enterprise/selectedEnterpriseboard";
		}
		EnterpriseBoard result = null;
		result = dao.selectEnterpriseboard(enterpriseBoard_Seq);
		if (result == null) {
			return "redirect:/enterprise/selectedEnterpriseboard";
		}
		model.addAttribute("enterpriseBoard", result);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "enterprise/remakeEnterpriseboard";
	}
			
	//게시물 수정
	@RequestMapping(value="/remakeEnterpriseboard", method=RequestMethod.POST)
	public @ResponseBody String remakeEnterpriseboard(EnterpriseBoard eboard,Model model) {
		int result = 0;
		result=dao.remakeEnterpriseboard(eboard);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		if (result==0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	//게시판 등록페이지 이동
	@RequestMapping(value="/makeEnterpriseboard", method=RequestMethod.GET)
	public String makeEnterpriseboard(EnterpriseComment EnterpriseComment, Model model) {
				
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "enterprise/makeEnterpriseboard";
	}
			
	//기업 댓글 입력
	@RequestMapping(value="/insertEnterpriseComment", method=RequestMethod.POST)
	public String insertEnterpriseComment(EnterpriseComment EnterpriseComment, Model model) {
		int result = 0;
		result = dao.insertEnterpriseComment(EnterpriseComment);
		if (result == 0) {
			System.out.println("11111111");
			return "enterprise/enterpriseBoardDetail";
		}

		enterpriseCommentList2(EnterpriseComment, model);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);

		return "enterprise/commentFragment";
	}
			
	//고객 댓글 리스트 불러오기
	public void enterpriseCommentList2(EnterpriseComment EnterpriseComment, Model model) {
		ArrayList<EnterpriseComment> result = null;
		result = dao.enterpriseCommentList(EnterpriseComment);
		if (result == null) {
			return;
		}
		model.addAttribute("enterpriseCommentList2", result);
	}
	public void enterpriseCommentList3(EnterpriseComment EnterpriseComment, Model model) {
		ArrayList<EnterpriseComment> result = null;
		result = dao.enterpriseCommentList(EnterpriseComment);
		if (result == null) {
			return;
		}
		model.addAttribute("enterpriseCommentList3", result);
	}
			
	//고객 댓글 리스트 뽑기
	@RequestMapping(value="/enterpriseCommentList", method=RequestMethod.GET)
	public String enterpriseCommentList(EnterpriseComment EnterpriseComment, Model model) {
		ArrayList<EnterpriseComment> result2 = null;
		result2 = dao.enterpriseCommentList(EnterpriseComment);
		if (result2 == null) {
			return "enterprise/enterpriseBoardDetail";
		}
		model.addAttribute("enterpriseCommentList", result2);
		return "enterprise/commentFragment";
	}
			
	//고객 게시물 삭제
	@RequestMapping(value="/deleteEnterpriseboard", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteEnterpriseboard(EnterpriseBoard eboard) {
		int result = 0;
		result = dao.deleteEnterpriseboard(eboard);
		if (result == 0) {
			return "redirect:/enterpriseBoardlist";
		}
		return "redirect:/enterpriseBoardlist";
	}
	//기업 자신이 등록한 매물 보여주기
	@RequestMapping(value="/myproperties", method=RequestMethod.GET)
	public String myproperties(Model model,HttpSession session) {
					
		String userid = (String) session.getAttribute("enterpriseLoginID");
		Total total=new Total();
	    total.setEnterprise_ID(userid);
		ArrayList<Total> enterItemList=dao.EnterpriseItemList(total);
		model.addAttribute("enterItemList",enterItemList);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		/*model.addAttribute("popularlistc",popularlist.get(2));
		model.addAttribute("popularlistd",popularlist.get(3));*/
	    return "enterprise/my-properties";
	}
		//기업 자신이 등록한 매물 삭제하기
	@RequestMapping(value="/deleteEnterpriseItem", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteCustomerboard(Total total) {
		int result = 0;
		int result2 =0;
		result=dao.EnterpriseItemDelete(total);
		result2=dao.EnterpriseImageDelete(total);
		if (result == 0 && result2==0) {
			return "redirect:/myproperties";
		}
			return "redirect:/myproperties";
	}
		
	//기업 매물 수정페이지 이동
	@RequestMapping(value="/remakesubmitproperty", method={RequestMethod.POST, RequestMethod.GET})
	public String EnterpriseItem(Total tt, Model model) {
		Total total = null;
		ArrayList<Total> total2=new ArrayList<Total>();
		total=dao.EnterpriseItem(tt);
		total2=dao.EnterpriseImage(tt);
		if (total==null && total2==null) {
			return "redirect:/myproperties";
		}
		model.addAttribute("enterItem",total);
		model.addAttribute("enterImage",total2);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "enterprise/remake-submit-property";
	}
	//기업 매물 수정		
	@RequestMapping(value="/updateItem",method={RequestMethod.POST,RequestMethod.GET})
	public  String modify(Item item) {
		 //System.out.println(item);
		 int result = 0;
		 result=dao.updateItem(item);
		 System.out.println(dao.updateItem(item));
		 for (Image image : imgList) {
			image.setForSale_Seq(item.getForSale_Seq());
			dao.updateImage(image);
		}
		return "redirect:/myproperties";
	}
	
	//개인 프로필 페이지 이동
	@RequestMapping(value = "/enterpriseMyProfile", method = RequestMethod.GET)
	public String customerMyProfile(Model model,HttpSession session) {
		Enterprise enterprise=new Enterprise();
		String userid = (String)session.getAttribute("enterpriseLoginID");
		enterprise=dao.enterpriseProfile(userid);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
		model.addAttribute("popularlist",popularlist);
		model.addAttribute("enter",enterprise);
		return "enterprise/enterpriseMyProfile";
	}
		
	//프로필 업데이트
	@RequestMapping(value = "/updateenterpriseProfile", method={RequestMethod.POST,RequestMethod.GET})
	public String updateenterpriseProfile(Enterprise enterprise) {
		int result=0;
		result=dao.updateenterpriseProfile(enterprise);
		return "redirect:/enterpriseMyProfile";
	}	
		
	//프로필 화면 - 비밀번호 변겅으로 이동
	@RequestMapping(value = "/goprofilepassword", method = RequestMethod.GET)
	public String profliePassword(Model model) {
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		return "enterprise/enterpriseProfilePassword";
	}
	
	//프로필화면에서 비밀번호 수정
	@RequestMapping(value = "/updateenterprisePassword", method={RequestMethod.POST,RequestMethod.GET})
	public String updateenterprisePassword(Enterprise enterprise,HttpSession session,Model model) {
		int result=0;
		result=dao.updateenterprisePassword(enterprise);
		session.setAttribute("enterprise",enterprise);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		return "redirect:/enterpriseMyProfile";
	}	
		
	//고객이 예약한 매물을  기업이 승인 하기하기 전 상태
	@RequestMapping(value = "/reservationwait", method={RequestMethod.POST,RequestMethod.GET})
	public String reservationwait(HttpSession session,Model model) {
		String userid = (String) session.getAttribute("enterpriseLoginID");
		Total total=new Total();
		total.setEnterprise_ID(userid);
		ArrayList<Total> reservationlist=dao.reservationwait(total);
		model.addAttribute("reservationlist",reservationlist);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		return "enterprise/reservation-wait";
	}
		
	// 예약 대기상태를 확인상태로 바꿔주기	
	@RequestMapping(value = "/updatereservation", method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody String updatereservation(String reservation_Seq,Model model){
		int result=0;
		result=dao.updatereservation(reservation_Seq);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "redirect:/enterpriseMyProfile";
	}	
	
	//고객이 예약한 매물을  기업이 승인 완료 상태
	@RequestMapping(value = "/reservationcomplete", method={RequestMethod.POST,RequestMethod.GET})
	public String reservationcomplete(HttpSession session,Model model) {
		String userid = (String) session.getAttribute("enterpriseLoginID");
		Total total=new Total();
		total.setEnterprise_ID(userid);
		ArrayList<Total> completelist=dao.reservationcomplete(total);
		model.addAttribute("completelist",completelist);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		return "enterprise/reservation-complete";
	}	
		
	//기업이 예약 취소
	@RequestMapping(value = "/enterpriseReservationCancel", method = RequestMethod.POST)
	public @ResponseBody int enterpriseReservationCancel(Reservation reservation) {
		int result = 0;
		try {
			result = dao.enterpriseReservationCancel(reservation);
			System.out.println(reservation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//예약 --> 거래 완료 알림 버튼
	@RequestMapping(value = "/tradeComplete", method = RequestMethod.POST)
	public @ResponseBody int tradeComplete(Reservation reservation) {
		int result = 0;
		int result2 = 0;
		try {
			result2 = dao.tradeReservationCancel(reservation);
			result = dao.tradeComplete(reservation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//거래 완료 리스트 페이지 이동
	@RequestMapping(value = "/tradeCompleteList", method = RequestMethod.GET)
	public String tradeCompleteList(String enterprise_ID, Model model) {
		ArrayList<Total> tList = new ArrayList<Total>();
		try {
			tList = dao.tradeCompleteList(enterprise_ID);
			for (Total t : tList) {
				System.out.println(t);
			}
			model.addAttribute("tradeList", tList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		return "enterprise/tradeCompleteList";
	}
	
}
