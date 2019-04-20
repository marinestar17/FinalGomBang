package com.project.GomBang;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.GomBang.DAO.CustomerDAO;
import com.project.GomBang.VO.Bookmark;
import com.project.GomBang.VO.Customer;
import com.project.GomBang.VO.CustomerComment;
import com.project.GomBang.VO.Customerboard;
import com.project.GomBang.VO.Image;
import com.project.GomBang.VO.Item;
import com.project.GomBang.VO.Reservation;
import com.project.GomBang.VO.SearchItem;
import com.project.GomBang.VO.Total;

@Controller
public class CustomerController {

     @Autowired
	 CustomerDAO dao;
   //EnterpriseDAO dao1;
     
     @RequestMapping(value="/goCustomerPage",method=RequestMethod.GET)
  	public String goCustomerPage() {
    	 
  		return "customer/customerHome";
  	}
     
     @RequestMapping(value="/customerSignupgo",method=RequestMethod.GET)
 	public String signupgo() {
 		
 		return "customer/customerSignupgo";
 	}
 	@RequestMapping(value="/customerSignup",method=RequestMethod.POST)
 	public String signup(Customer c,Model model,HttpSession session) {
 		
 		dao.signup(c);
 		
 		return "index-14";
 	}
 	
 	@RequestMapping(value="/customerIDcheck",method=RequestMethod.GET)
 	public @ResponseBody String idcheck(String customer_id) {
 		ArrayList<Customer> list=dao.checkid();	
 		for (Customer customer : list) {
 			
 			if (customer_id.equals(customer.getCustomer_ID())) {
 				return "duplicated";
 			}
 		
 		}
 		return "success";
 	}
	
 	@RequestMapping(value="/customerLogin",method=RequestMethod.POST)	
	public String login(Customer c,Model model,HttpSession session, HttpServletRequest request
            , HttpServletResponse response) throws Exception {
		
		Customer cu=dao.login(c);
		System.out.println(cu);
		
		if(cu!=null) {
			session.setAttribute("customerLoginID",c.getCustomer_ID());
			session.setAttribute("customer",cu);
			return"index-14";
		}else {
			model.addAttribute("message","아이디나 비밀번호가 틀렸습니다");
			//return "customer/customerLogingo";
			   response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('아이디나 비밀번호가 틀렸습니다.'); history.go(-1);</script>");
	            out.flush();

		}
	    
		return "customer/customerLogingo";
	}
	@RequestMapping(value="/customerLogingo",method=RequestMethod.GET)
	public String logingo() {
		return "customer/customerLogingo";
	}
	
	@RequestMapping(value="/customerLogout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "index-14";
	}
	
	@RequestMapping(value="/customerModify",method=RequestMethod.POST)
	public  String modify(Customer c, HttpSession session) {
		/*String id=(String) session.getAttribute("customerLoginID");*/
	
	   try {
			int result = dao.modify(c);
			System.out.println(result);
			System.out.println(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index-14";
	}
	@RequestMapping(value="/customerDelete", method=RequestMethod.GET)
	public String withdraw(Customer c, HttpSession session, Model model) {
		String id = (String)session.getAttribute("customerLoginID");
		if (id==null) {
			return "customer/customerHome";
		}
		
		c.setCustomer_ID((String)session.getAttribute("customerLoginID"));
		dao.deleteID(c);
		session.setAttribute("customerLoginID", null);
		
		return "customer/customerHome";
	}
	
	//게시판 이동
		@RequestMapping(value="/goCustomerboard", method=RequestMethod.GET)
		public String goBoard(HttpSession session) {
			
			String LoginID = (String)session.getAttribute("customerLoginID");
			if (LoginID==null) {
				return "index-14";
			}
			
			return "redirect:/customerBoardlist";
		}
	
	//게시물 등록
	@RequestMapping(value="/insertCustomeritem", method=RequestMethod.POST)
	public @ResponseBody String insertCustomerboard(Customerboard cboard, Model model) {
		int result = 0;
		result = dao.insertCustomerboard(cboard);
		if (result == 0) {
			return "fail";
		}else {			
			return "success";
		}
	}
	
	//게시판 리스트
	@RequestMapping(value="/customerBoardlist", method= {RequestMethod.GET, RequestMethod.POST})
	public String customerBoardlist(Model model, Customerboard cboard) {
		ArrayList<Customerboard> result = null;
		result = dao.customerBoardlist();
		if (result == null) {
			return "customer/customerBoardGo";
		}
		
		for(Customerboard cb:result) {
			
			
			String s = cb.getCustomerBoard_Content();
			Pattern pattern = Pattern.compile("(<img\\b|(?!^)\\G)[^>]*?\\b(src|width|height)=([\"']?)([^\"]*)\\3");
			Matcher matcher = pattern.matcher(s);
			while (matcher.find()){
			   cb.setCustomerBoard_Content(matcher.group(4));
			    System.out.println(matcher.group(4));
			} 
		}
		
		model.addAttribute("cbList", result);
		return "customer/customerBoardGo";
	}
	
	//게시물 보기
	@RequestMapping(value="/enterCustomerboard", method=RequestMethod.GET)
	public String selectCustomerboard(String customerBoard_Seq, Model model, CustomerComment CustomerComment) {
		try {
			Integer.parseInt(customerBoard_Seq);
		} catch (Exception e) {
			return "redirect:/customerBoardlist";
		}
		Customerboard result = null;
		dao.countCustomerboard(customerBoard_Seq);
		result = dao.selectCustomerboard(customerBoard_Seq);
		if (result == null) {
			return "redirect:/customerBoardlist";
		}
		model.addAttribute("customerBoard", result);
				
		customerCommentList3(CustomerComment, model);
				
		return "customer/customerBoardDetail";
	}
	
	//게시물 업데이트 방 이동, 정보 뿌려주기
	@RequestMapping(value="/goRemakecustomer", method=RequestMethod.GET)
	public String goRemakecustomer(String customerBoard_Seq, Model model, Customerboard cboard) {
		try {
			Integer.parseInt(customerBoard_Seq);
		} catch (Exception e) {
			return "redirect:/customer/selectedCustomerboard";
		}
		Customerboard result = null;
		result = dao.selectCustomerboard(customerBoard_Seq);
		if (result == null) {
			return "redirect:/customer/selectedCustomerboard";
		}
		model.addAttribute("customerBoard", result);
		return "customer/remakeCustomerboard";
	}
	
	//게시물 수정
	@RequestMapping(value="/remakeCustomeritem", method=RequestMethod.POST)
	public @ResponseBody String remakeCustomeritem(Customerboard cboard) {
		int result = 0;
		result=dao.remakeCustomerboard(cboard);
		if (result==0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	// 매물 상세보기
	@RequestMapping(value="/customerItemDetail", method=RequestMethod.GET)
	public String customerItemDetail(Model model,int forSale_Seq) {
		Item item = null;
		item = dao.customerItemDetail(forSale_Seq);
		String seq = Integer.toString(forSale_Seq);
		dao.itemHitCountUp(seq);
		model.addAttribute("detailItem", item);
		return "customer/properties-details";
	}
	// 이미지 불러오기
	@RequestMapping(value="/detailImg", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Image> detailImg(int forSale_Seq){
		ArrayList<Image> imagelist = new ArrayList<Image>();
		imagelist = dao.detailImg(forSale_Seq);
		return imagelist;
	}
	
	// 매물 검색하기
		@RequestMapping(value="/searchAllItem", method=RequestMethod.GET)
		public @ResponseBody ArrayList<Item> searchAllItem() {
			ArrayList<Item> list = null;
			ArrayList<Image> imagelist = new ArrayList<Image>();
			list = dao.searchAllItem();
			for (Item item : list) {
				imagelist = dao.detailImg(item.getForSale_Seq());
				item.setForSale_ETC(imagelist.get(0).getSaveName());
			}
			return list;
		}
		
		// 매물 검색하기
				@RequestMapping(value="/searchItem", method=RequestMethod.GET)
				public String searchItem(SearchItem item, Model model) {
					System.out.println(item);
					if(item.getGeoapi_cities().equals("市区町村を選択してください")||item.getGeoapi_cities().equals("市区町村名を選択してください")) {
						item.setGeoapi_cities("none");
					}
					if(item.getGeoapi_towns().contains("町域を選択してください")||item.getGeoapi_towns().equals("町域を選択してください")) {
						item.setGeoapi_towns("none");
					}
					ArrayList<String[]> optionList = new ArrayList<String[]>();
					ArrayList<Item> list = null;
					ArrayList<Image> imagelist = new ArrayList<Image>();
					ArrayList<Image> searchImgList = new ArrayList<Image>();
					ArrayList<ArrayList<Image>> threeImgList = new ArrayList<ArrayList<Image>>();
					list = dao.searchItem(item);
					for (Item item2 : list) {
						imagelist = dao.detailImg(item2.getForSale_Seq());
						searchImgList.add(imagelist.get(0));
						String[] optionArr = item2.getForSale_Option().split(",");
						optionList.add(optionArr);
						threeImgList.add(imagelist);
					}
					for (ArrayList<Image> arrayList : threeImgList) {
						System.out.println(arrayList);
					}
					model.addAttribute("PreviousSearchItem", item);
					model.addAttribute("optionList", optionList);
					model.addAttribute("searchItemList", list);
					model.addAttribute("searchImgList", searchImgList);
					model.addAttribute("threeImgList", threeImgList);
					return "customer/properties-list-rightside";
				}
		
		// 매물 검색하기
		@RequestMapping(value="/searchItem2", method=RequestMethod.GET)
		public String searchItem2(SearchItem item, Model model) {
			if(item.getGeoapi_cities().contains("市区町村を選択してください")||item.getGeoapi_cities().contains("市区町村名を選択してください")) {
				item.setGeoapi_cities("none");
			}
			if(item.getGeoapi_towns().contains("町域を選択してください")||item.getGeoapi_towns().equals("町域を選択してください")) {
				item.setGeoapi_towns("none");
			}
			System.out.println(item);
			ArrayList<String[]> optionList = new ArrayList<String[]>();
			ArrayList<Item> list = null;
			ArrayList<Image> imagelist = new ArrayList<Image>();
			ArrayList<Image> searchImgList = new ArrayList<Image>();
			ArrayList<ArrayList<Image>> threeImgList = new ArrayList<ArrayList<Image>>();
			list = dao.searchItem(item);
			for (Item item2 : list) {
				imagelist = dao.detailImg(item2.getForSale_Seq());
				searchImgList.add(imagelist.get(0));
				threeImgList.add(imagelist);
				String[] optionArr = item2.getForSale_Option().split(",");
				optionList.add(optionArr);
			}
			model.addAttribute("PreviousSearchItem", item);
			model.addAttribute("optionList", optionList);
			model.addAttribute("searchItemList", list);
			model.addAttribute("searchImgList", searchImgList);
			model.addAttribute("threeImgList", threeImgList);
			/*return "customer/properties-list-rightside";*/
			return "customer/lots";
		}
	
	//게시판 등록페이지 이동
	@RequestMapping(value="/makeCustomerboard", method=RequestMethod.GET)
	public String makeCustomerboard(CustomerComment CustomerComment, Model model) {
		
		return "customer/makeCustomerboard";
	}
	
	//고객 댓글 입력
	@RequestMapping(value="/insertCustomerComment", method=RequestMethod.POST)
	public String inserCustomerComment(CustomerComment CustomerComment, Model model) {
		int result = 0;
		result = dao.insertCustomerComment(CustomerComment);
		if (result == 0) {
			System.out.println("11111111");
			return "customer/customerBoardDetail";
		}

		customerCommentList2(CustomerComment, model);

		return "customer/commentFragment";
	}
	
	//고객 댓글 리스트 불러오기
	public void customerCommentList2(CustomerComment CustomerComment, Model model) {
		ArrayList<CustomerComment> result = null;
		result = dao.customerCommentList(CustomerComment);
		if (result == null) {
			return;
		}
		model.addAttribute("customerCommentList2", result);
	}
	public void customerCommentList3(CustomerComment CustomerComment, Model model) {
		ArrayList<CustomerComment> result = null;
		result = dao.customerCommentList(CustomerComment);
		if (result == null) {
			return;
		}
		model.addAttribute("customerCommentList3", result);
	}
	
	//고객 댓글 리스트 뽑기
	@RequestMapping(value="/customerCommentList", method=RequestMethod.GET)
	public String customerCommentList(CustomerComment CustomerComment, Model model) {
		ArrayList<CustomerComment> result2 = null;
		result2 = dao.customerCommentList(CustomerComment);
		if (result2 == null) {
			return "customer/customerBoardDetail";
		}
		model.addAttribute("customerCommentList", result2);
		return "customer/commentFragment";
	}
	
	//고객 게시물 삭제
	@RequestMapping(value="/deleteCustomerboard", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteCustomerboard(Customerboard cboard) {
		int result = 0;
		result = dao.deleteCustomerboard(cboard);
		if (result == 0) {
			return "redirect:/customerBoardlist";
		}
		return "redirect:/customerBoardlist";
	}
	
	@RequestMapping(value="/goFullMap",method=RequestMethod.GET)
 	public String goFullMap() {
 		
 		return "customer/properties-map-full";
 	}
	
	//손님이 예약
	@RequestMapping(value = "/insertCustomerReservation", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody int insertCustomerReservation(String reservation_Visa, String reservation_Guarantor, String enterprise_ID, String customer_ID, String forSale_Seq) {
		int result = 0;
		Reservation reservation = new Reservation();
		reservation.setReservation_Visa(reservation_Visa);
		reservation.setReservation_Guarantor(reservation_Guarantor);
		reservation.setEnterprise_ID(enterprise_ID);
		reservation.setCustomer_ID(customer_ID);
		reservation.setForSale_Seq(forSale_Seq);
		try {
			result = dao.insertCustomerReservation(reservation);
		} catch (Exception e) {
			
		}
		return result;
	}
	
	//예약 체크
	@RequestMapping(value ="/reservationCheck", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Reservation> reservationCheck(String customer_ID){
		ArrayList<Reservation> rList = new ArrayList<Reservation>();
		try {
			rList = dao.reservationCheck(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rList;
	}
	
	//즐찾 등록
	@RequestMapping(value = "/customerBookmark", method = RequestMethod.POST)
	public @ResponseBody int customerBookmark(Bookmark bookmark) {
		int result = 0;
		try {
			result = dao.customerBookmark(bookmark);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//즐찾 중복 검사
	@RequestMapping(value = "/bookmarkCheck", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Bookmark> bookmarkCheck(String customer_ID){
		ArrayList<Bookmark> bList = new ArrayList<Bookmark>();
		try {
			bList = dao.bookmarkCheck(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bList;
	}
	
	//개인 프로필 페이지 이동
	@RequestMapping(value = "/customerMyProfile", method = RequestMethod.GET)
	public String customerMyProfile(String customer_ID, Model model) {
		Customer c = new Customer();
		try {
			c = dao.customerProfile(customer_ID);
			model.addAttribute("customerProfile", c);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "customer/customerMyProfile";
	}
	
	//프로필 화면에서 기본정보 수정
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.POST)
	public String profileUpdate(Customer customer, String customer_ID, Model model) {
		int result = 0;
		Customer c = new Customer();
		try {
			result = dao.profileUpdate(customer);
			if (result == 1) {
				c = dao.customerProfile(customer_ID);
				model.addAttribute("customerProfile", c);
				return "customer/customerMyProfile";
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//프로필 화면 - 비밀번호 변겅으로 이동
	@RequestMapping(value = "/profilePassword", method = RequestMethod.GET)
	public String profliePassword() {
		return "customer/customerProfilePassword";
	}
	
	//프로필화면에서 비밀번호 수정
	@RequestMapping(value = "/profilePasswordUpdate", method = RequestMethod.POST)
	public String profilePasswordUpdate(Customer customer,String customer_ID, Model model,HttpSession session) {
		int result = 0;
		Customer c = new Customer();
		try {
			result = dao.profilePasswordUpdate(customer);
			if (result == 1) {
				c = dao.customerProfile(customer_ID);
				session.setAttribute("customer", c);
				model.addAttribute("customerProfile", c);
				return "customer/customerMyProfile";
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//프로필 화면에서 즐찾 리스트 페이지로 이동하기
	@RequestMapping(value = "/favoritedList", method = RequestMethod.GET)
	public String favoritedList(String customer_ID, Model model) {
		ArrayList<Total> tList = new ArrayList<Total>();
		try {
			tList = dao.customerBookmarkList(customer_ID);
			model.addAttribute("customerBookmarkList", tList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "customer/customerFavoritedList";
	}
	
	//프로필 화면에서 예약 리스트 페이지로 이동하기
	@RequestMapping(value = "/reservationList", method = RequestMethod.GET)
	public String reservationList(String customer_ID, Model model) {
		ArrayList<Total> tList = new ArrayList<Total>();
		try {
			tList = dao.customerReservationList(customer_ID);
			model.addAttribute("customerReservationList", tList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "customer/customerReservationList";
	}
	
	//고객이 즐찾 삭제
	@RequestMapping(value = "/customerDeleteBookmark", method = RequestMethod.POST)
	public @ResponseBody int customerDeleteBookmark(String bookmark_Seq) {
		int result = 0;
		try {
			result = dao.customerDeleteBookmark(bookmark_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//고객이 예약 삭제(취소)
	@RequestMapping(value = "/customerDeleteReservation", method = RequestMethod.POST)
	public @ResponseBody int customerDeleteReservation(String reservation_Seq) {
		int result = 0;
		try {
			result = dao.customerDeleteReservation(reservation_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}