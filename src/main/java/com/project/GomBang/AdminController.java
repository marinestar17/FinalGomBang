package com.project.GomBang;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.GomBang.DAO.AdminDAO;
import com.project.GomBang.DAO.AdminMapper;
import com.project.GomBang.VO.Admin;
import com.project.GomBang.VO.AdminMessage;
import com.project.GomBang.VO.AdminTODO;
import com.project.GomBang.VO.Customer;
import com.project.GomBang.VO.CustomerComment;
import com.project.GomBang.VO.Customerboard;
import com.project.GomBang.VO.Enterprise;
import com.project.GomBang.VO.EnterpriseBoard;
import com.project.GomBang.VO.EnterpriseComment;
import com.project.GomBang.VO.Item;
import com.project.GomBang.VO.Reservation;
import com.project.GomBang.VO.Total;

@Controller
public class AdminController {

	@Autowired
	AdminDAO dao;
	
	//관리자 페이지 이동 루트
	@RequestMapping(value = "/goAdminPage", method = RequestMethod.GET)
	public String adminManagementMainPage() {
		return "admin/adminHome";
	}
	
	//패스워드 찾는 페이지 이동
	@RequestMapping(value = "/adminPassword", method = RequestMethod.GET)
	public String adminPassword() {
		return "admin/adminPassword";
	}
	
	//관리자 추가 페이지 이동
	@RequestMapping(value = "/addAdmin", method = RequestMethod.GET)
	public String addAdmin() {
		return "admin/insertAdmin";
	}
	
	//메인 페이지 이동 (로고 링크용)
	@RequestMapping(value = "/GomBangAdmin", method = RequestMethod.GET)
	public String Main(Model model) {
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		try {
			hMap = dao.countSubject();
			model.addAttribute("allForSale", hMap.get("F_COUNT"));
			model.addAttribute("allCustomer", hMap.get("C_COUNT"));
			model.addAttribute("allEnterprise", hMap.get("E_COUNT"));
			model.addAttribute("allReservation", hMap.get("R_COUNT"));
			/*Iterator<String> keys = hMap.keySet().iterator();
			while ( keys.hasNext() ) {
			    String key = keys.next();
			    System.out.println("방법3) key : " + key +" / value : " + hMap.get(key));
			}   */

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/adminMain2";
	}
	
	//lockScreen 페이지 이동
	@RequestMapping(value = "/lockScreen", method = RequestMethod.GET)
	public String lockScreen() {
		return "admin/lockScreen";
	}
	
	//기업 통계 페이지 이동 
	@RequestMapping(value = "/staticEnterprisePage", method = RequestMethod.GET)
	public String staticPage() {
		return "admin/staticEnterprisePage";
	}
	
	//고객 통계 페이지 이동
	@RequestMapping(value = "/staticCustomerPage", method = RequestMethod.GET)
	public String staticCustomerPage() {
		return "admin/staticCustomerPage";
	}
	
	//매물 관련 통계 페이지 이동
	@RequestMapping(value = "/staticForSalePage", method = RequestMethod.GET)
	public String staticForSalePage() {
		return "admin/staticForSalePage";
	}
	
	//게시물 관련 통계 페이지 이동
	@RequestMapping(value = "/staticBoardPage", method = RequestMethod.GET)
	public String staticBoardPage() {
		return "admin/staticBoardPage";
	}
	
	//예약 거래 관련 통계 페이지 이동
	@RequestMapping(value = "/staticReservationPage", method = RequestMethod.GET)
	public String staticReservateionPage() {
		return "admin/staticReservationPage";
	}
	
	//승인된 기업 출력
	@RequestMapping(value = "/enterpriseAcceptList" , method = RequestMethod.GET)
	public String AcceptenterpriseList(Model model) {
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		Enterprise enterprise = new Enterprise();
		try {
			eList = dao.enterpriseAcceptList(enterprise);
			model.addAttribute("acceptList", eList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/enterpriseListY";
	}
	
	//고객 리스트 이동, 출력
	@RequestMapping(value = "/customerList", method = RequestMethod.GET)
	public String customerList(Model model) {
		ArrayList<Customer> cList = new ArrayList<Customer>();
		Customer customer = new Customer();
		try {
			cList = dao.allCustomerPrint(customer);
			model.addAttribute("customerList", cList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/customerList";
	}
	
	//관리자들 메세지 페이지 이동
	@RequestMapping(value="/adminMessage", method = RequestMethod.GET)
	public String adminMessage() {
		return "admin/adminMessage";
	}
	
	//기업 문의 게시판 이동
	@RequestMapping(value = "/adminEnterpriseBoardList", method = RequestMethod.GET)
	public String adminEnterpriseBoardList() {
		return "admin/adminEnterpriseBoardList";
	}
	
	//소비자 게시판 이동
	@RequestMapping(value = "/adminCustomerBoardList", method = RequestMethod.GET)
	public String adminCustomerBoardList() {
		return "admin/adminCustomerBoardList";
	}
	
	//매물(아이템) 리스트 페이지 이동
	 @RequestMapping(value = "/adminItemList", method = RequestMethod.GET)
	 public String adminItemList() {
		return "admin/adminItemList"; 
	 }
	 
	//예약 리스트 페이지 이동
	 @RequestMapping(value = "/adminReservationList", method = RequestMethod.GET)
	 public String adminReservationList() {
		return "admin/adminReservationList";
	 }
	 
	//거래 완료 리스트 페이지 이동
	 @RequestMapping(value = "/adminTradeList", method = RequestMethod.GET)
	 public String adminTradeList() {
		 return "admin/adminTradeList";
	 }
	 
	//관리차 추가하기
	@RequestMapping(value = "/insertAdmin", method = RequestMethod.POST)
	public String insertAdmin(Admin admin, Model model) {
		try {
			int result = dao.insertAdmin(admin);
			if (result == 1) {
				model.addAttribute("ok", "관리자가 추가되었습니다.");
			} else {
				model.addAttribute("ok", "에러발생");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/adminHome";
	}
	
	//관리자 패스워드 찾기
	@RequestMapping(value = "/findAdminPassword", method = RequestMethod.POST)
	public @ResponseBody String findAdminPassword(String admin_ID, String admin_Email) {
		Admin result = new Admin();
		Admin admin = new Admin();
		admin.setAdmin_ID(admin_ID);
		admin.setAdmin_Email(admin_Email);
		try {
			result = dao.findAdminPassword(admin);
			if (result != null) {
				String pw = result.getAdmin_PW();
				return "PW:" + pw;
			} else {
				return "없는 계정입니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	//관리자 로그인
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(Admin admin, HttpSession httpSession, Model model) {
		Admin result = new Admin();
		HashMap<String,Integer> hMap = new HashMap<String, Integer>();
		try {
			result = dao.adminLogin(admin);
			if (result == null) {
				model.addAttribute("error", "로그인 실패 - 계정정보 확인");
				return "admin/adminHome";
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		hMap = dao.countSubject();
		model.addAttribute("allForSale", hMap.get("F_COUNT"));
		model.addAttribute("allCustomer", hMap.get("C_COUNT"));
		model.addAttribute("allEnterprise", hMap.get("E_COUNT"));
		model.addAttribute("allReservation", hMap.get("R_COUNT"));
		httpSession.setAttribute("admin", result);
		return "admin/adminMain2";
	}
	
	//관리자 로그아웃
	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String adminLogout(HttpSession httpSession) {
		httpSession.invalidate();
		return "admin/adminHome";
	}
	
	//관리자 lockScreen 페이지 해제
	@RequestMapping(value = "/screenLockClear", method = RequestMethod.POST)
	public String screenLockClear(Admin admin, Model model) {
		Admin result = new Admin();
		try {
			result = dao.adminLogin(admin);
			if (result == null) {
				model.addAttribute("lockWrong", "잘못된 입력입니다.");
				return "admin/lockScreen";
			} else {
				return "admin/adminMain2";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//고객성별통계출력
	@RequestMapping(value = "customerGenderStats", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Customer> customerGenderStats() {
		ArrayList<Customer> cList = new ArrayList<Customer>();
		try {
			cList = dao.customerGenderStats();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//고객나이별통계출력
	@RequestMapping(value = "/customerAgeStats", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Customer> customerAgeStats(){
		ArrayList<Customer> cList = new ArrayList<Customer>();
		try {
			cList = dao.customerAgeStats();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//모든고객출력
	@RequestMapping(value ="/allCustomerPrint", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Customer> allCustomerPrint(@RequestParam(value="search" ,defaultValue="")String search, @RequestParam(value="searchSelect" ,defaultValue="")String searchSelect) {
		ArrayList<Customer> cList = new ArrayList<Customer>();
		Customer customer = new Customer();
		customer.setSearch(search);
		customer.setSearchSelect(searchSelect);
		try {
			cList = dao.allCustomerPrint(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//기업 종류별 통계 출력
	@RequestMapping(value = "/enterpriseCodeStats", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Enterprise> enterpriseCodeStats() {
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = dao.enterpriseCodeStats();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}
	
	//가입 승인 대기 리스트 출력
	@RequestMapping(value = "/enterprisePermissionList", method = RequestMethod.GET)
	public String enterprisePermissionList(Model model){
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		Enterprise enterprise = new Enterprise();
		try {
			eList = dao.enterprisePermissionList(enterprise);
			model.addAttribute("waitList", eList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/enterpriseListW";
	}
	
	//기업 가입 승인을 위한 개요 페이지 이동
	@RequestMapping(value = "/enterpriseDetail", method = RequestMethod.GET)
	public String enterpriseDetail(String enterprise_ID, Model model) {
		Enterprise enterprise = new Enterprise();
		try {
			enterprise = dao.enterpriseDetail(enterprise_ID);
			model.addAttribute("enterpriseDetail", enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/enterpriseDetail";
	}
	
	//기업 가입 허가
	@RequestMapping(value= "/enterprisePermissionAccept", method = RequestMethod.POST)
	public String enterprisePermissionAccept(String enterprise_ID) {
		try {
			int result = dao.enterprisePermissionAccept(enterprise_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/adminMain2";
	}
	
	//기업 가입 불허
	@RequestMapping(value = "/enterprisePermissionDeny", method = RequestMethod.POST)
	public String enterprisePermissionDeny(String enterprise_ID) {
		try {
			int result = dao.enterprisePermissionDeny(enterprise_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/adminMain2";
	}
	
	/*//가입 허가 리스트 출력
	@RequestMapping(value = "/enterprisePermissionAcceptList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Enterprise> enterprisePermissionAcceptList(Model model){
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		Enterprise enterprise = new Enterprise();
		try {
			eList = dao.enterpriseAcceptList(enterprise);
			for (Enterprise e : eList) {
				System.out.println(e);
			}
			model.addAttribute("enterpriseAcceptList", eList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}*/
	
	//가입 승인 거부 리스트 출력
	@RequestMapping(value = "/enterprisePermissionDenyList", method = RequestMethod.GET)
	public String enterprisePermissionDenyList(Model model,@RequestParam(value="search" ,defaultValue="")String search, @RequestParam(value="searchSelect" ,defaultValue="")String searchSelect ){
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		Enterprise enterprise = new Enterprise();
		enterprise.setSearch(search);
		enterprise.setSearchSelect(searchSelect);
		try {
			eList = dao.enterpriseDenyList(enterprise);
			model.addAttribute("denyList",eList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/enterpriseListN";
	}
	
	//조건없는 모든 기업 리스트 출력
	@RequestMapping(value = "/allEnterprisePrint", method = RequestMethod.GET)
	public String allEnterprisePrint (Model model) {
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = dao.allEnterprisePrint();
			for (Enterprise e : eList) {
				if (e.getEnterprise_Permission().equals("W")) {
					e.setEnterprise_Permission("대기중");
				} else if (e.getEnterprise_Permission().equals("N")) {
					e.setEnterprise_Permission("거부됨");
				} else {
					e.setEnterprise_Permission("승인됨");
				}
			}
			model.addAttribute("enterpriseList", eList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/enterpriseList";
	}
	//관리자 개인정보 업데이트
	@RequestMapping(value = "/updateAdmin", method = RequestMethod.POST)
	public String updateAdmin(Admin admin, HttpSession httpsession) {
		try {
			int result = dao.updateAdmin(admin);
			if (result ==1) {
				httpsession.invalidate();
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/adminHome";
	}
	
	// 기업, 소비자 수 카운트
	@RequestMapping(value = "/countAccount" , method = RequestMethod.GET)
	public @ResponseBody HashMap<Integer,Integer> countAccount(){
		HashMap<Integer,Integer> hMap = new HashMap<Integer, Integer>();
		try {
			hMap = dao.countAccount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//기업, 소비자 게시물 수 카운트
	@RequestMapping(value = "/countBoard", method = RequestMethod.GET)
	public @ResponseBody HashMap<Integer,Integer> countBoard(){
		HashMap<Integer,Integer> hMap = new HashMap<Integer, Integer>();
		try {
			hMap = dao.countBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//예약 (성립/진행) 카운트
	@RequestMapping(value = "/countReservation", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Integer> countReservation(){
		HashMap<String,Integer> hMap = new HashMap<String, Integer>();
		try {
			hMap = dao.countReservation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//매물 수 카운트
	@RequestMapping(value="/countForSale", method = RequestMethod.GET)
	public @ResponseBody int countForSale(){
		int result = 0;
		try {
			result = dao.countForSale();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//기업 관련 업무 개수 count
	@RequestMapping(value = "/countEnterpriseTask", method = RequestMethod.GET)
	public @ResponseBody HashMap<Integer,Integer> countEnterpriseTask(){
		HashMap<Integer,Integer> hMap = new HashMap<Integer, Integer>();
		try {
			hMap = dao.countEnterpriseTask();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//관리자 todo 추가
	@RequestMapping(value = "/insertTODO", method = RequestMethod.POST)
	public @ResponseBody int insertTODO(AdminTODO admintodo) {
		int result = 0;
		try {
			result = dao.insertTODO(admintodo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//todo 출력
	@RequestMapping(value = "/printTODO", method = RequestMethod.GET)
	public @ResponseBody ArrayList<AdminTODO> printTODO(String admin_ID){
		ArrayList<AdminTODO> todoList = new ArrayList<AdminTODO>();
		try {
			todoList = dao.printTODO(admin_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return todoList;
	}
	
	//todo 수정
	@RequestMapping(value = "/updateTODO", method = RequestMethod.POST)
	public @ResponseBody int updateTODO(AdminTODO admintodo) {
		int result = 0;
		try {
			result = dao.updateTODO(admintodo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//todo 삭제
	@RequestMapping(value = "/deleteTODO", method = RequestMethod.POST)
	public @ResponseBody int deleteTODO(String adminTodo_Seq) {
		int result = 0;
		try {
			result = dao.deleteTODO(adminTodo_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//메인 페이지 통계 - 고객
	@RequestMapping(value = "/mainPageCustomer", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Customer> mainPageCustomer(){
		ArrayList<Customer> cList = new ArrayList<Customer>();
		try {
			cList = dao.mainPageCustomer();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//메인 페이지 통계 - 기업
	@RequestMapping(value = "/mainPageEnterprise", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Enterprise> mainPageEnterprise(){
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = dao.mainPageEnterprise();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}
	
	//메인 페이지 통계 - 매물
	@RequestMapping(value = "/mainPageItem" , method = RequestMethod.GET)
	public @ResponseBody ArrayList<Item> mainPageItem(){
		ArrayList<Item> iList = new ArrayList<Item>();
		try {
			iList = dao.mainPageItem();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iList;
	}
	
	//메인 페이지 통계 - 예약
	@RequestMapping(value = "/mainPageReservation", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Reservation> mainPageReservation(){
		ArrayList<Reservation> rList = new ArrayList<Reservation>();
		try {
			rList = dao.mainPageReservation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rList;
	}
	
	//관리자 간편 게시판 등록
	@RequestMapping(value = "/insertAdminMessage", method = RequestMethod.POST)
	public @ResponseBody String insertAdminMessage(AdminMessage adminmessage) {
		int result = 0;
		try {
			result = dao.insertAdminMessage(adminmessage);
			if (result == 1) {
				return "good";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "bad";
		}
		return null;
	}
	
	//관리자 간편 게시판 출력
	@RequestMapping(value = "printMessage" , method = RequestMethod.GET)
	public @ResponseBody ArrayList<AdminMessage> printMessage(@RequestParam(value="search" ,defaultValue="")String search, @RequestParam(value="searchSelect" ,defaultValue="")String searchSelect){
		ArrayList<AdminMessage> mList = new ArrayList<AdminMessage>();
		AdminMessage message = new AdminMessage();
		message.setSearch(search);
		message.setSearchSelect(searchSelect);
		try {
			mList = dao.printMessage(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mList;
	}
	
	//메인 페이지에 간편 게시판 내용 5개 출력
	@RequestMapping(value = "/mainPageMessage", method = RequestMethod.GET)
	public @ResponseBody ArrayList<AdminMessage> mainPageMessage() {
		ArrayList<AdminMessage> mList = new ArrayList<AdminMessage>();
		try {
			mList = dao.mainPageMessage();
			for (AdminMessage m : mList) {
				if (m.getAdminMessage_Indate().equals("0")) {
					m.setAdminMessage_Indate("오늘");
				} else if (m.getAdminMessage_Indate().equals("1")) {
					m.setAdminMessage_Indate("어제");
				} else {
					m.setAdminMessage_Indate(m.getAdminMessage_Indate()+"일 전");
				}
			} //for
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mList;
	}
	
	//매물 통계 (임대/렌트) 카운트
	@RequestMapping(value = "/countForSaleRent", method = RequestMethod.GET) 
	public @ResponseBody HashMap<String, Integer> countForSaleRent(){
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		try {
			hMap = dao.countForSaleRent();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//매물 통계 (종류) 카운트
	@RequestMapping(value = "/countHouseType", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Item> countHouseType(){
		ArrayList<Item> iList = new ArrayList<Item>();
		try {
			iList = dao.countHouseType();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iList;
	}
	
	//관리자 입장에서 고객 게시판 출력
	@RequestMapping(value = "/adminCustomerBoard", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Customerboard> adminCustomerBoard(@RequestParam(value="search" ,defaultValue="")String search, @RequestParam(value="searchSelect" ,defaultValue="")String searchSelect){
		ArrayList<Customerboard> bList = new ArrayList<Customerboard>();
		Customerboard board = new Customerboard();
		board.setSearch(search);
		board.setSearchSelect(searchSelect);
		try {
			bList = dao.adminCustomerBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bList;
	}
	
	//매물통계 (각 기업별 등록한 매물 수 카운트)
	@RequestMapping(value = "/enterpriseItemCount", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Item> enterpriseItemCount(){
		ArrayList<Item> iList = new ArrayList<Item>();
		try {
			iList = dao.enterpriseItemCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iList;
	}
	
	//관리자 입장에서 고객 게시판 상세 조회
	@RequestMapping(value = "/admincustomerBoardDetail", method = RequestMethod.GET)
	public String admincustomerBoardDetail(String customerBoard_Seq, Model model) {
		Customerboard board = new Customerboard();
		try {
			board = dao.admincustomerBoardDetail(customerBoard_Seq);
			if (board != null) {
				model.addAttribute("adminCustomerDetail", board);
				return "admin/adminCustomerBoardDetail";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//관리자 입장에서 고객 게시판 덧글 조회
	@RequestMapping(value = "/adminCustomerBoardComment", method = RequestMethod.GET)
	public @ResponseBody ArrayList<CustomerComment> adminCustomerBoardComment(String customerBoard_Seq){
		ArrayList<CustomerComment> cList = new ArrayList<CustomerComment>();
		try {
			cList = dao.adminCustomerBoardComment(customerBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//관리자가 고객 게시물에 덧글달기
	@RequestMapping(value = "/adminInsertCustomerComment", method = RequestMethod.POST)
	public @ResponseBody int adminInsertCustomerComment(CustomerComment comment) {
		int result = 0;
		try {
			result = dao.adminInsertCustomerComment(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자가 고객 게시판 덧글 삭제
	@RequestMapping(value = "/adminDeleteCustomerComment", method = RequestMethod.POST)
	public @ResponseBody int adminDeleteCustomerComment(String customerComment_Seq) {
		int result = 0;
		try {
			result = dao.adminDeleteCustomerComment(customerComment_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자가 고객 게시판 글 삭제
	@RequestMapping(value = "/adminDeleteCustomerBoard", method = RequestMethod.POST)
	public @ResponseBody int adminDeleteCustomerBoard(String customerBoard_Seq) {
		int result = 0;
		try {
			result = dao.adminDeleteCustomerBoard(customerBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자가 기업 게시판 리스트 확인
	@RequestMapping(value = "/adminEnterpriseBoard", method = RequestMethod.GET)
	public @ResponseBody ArrayList<EnterpriseBoard> adminEnterpriseBoard(@RequestParam(value="search" ,defaultValue="")String search, @RequestParam(value="searchSelect" ,defaultValue="")String searchSelect){
		ArrayList<EnterpriseBoard> bList = new ArrayList<EnterpriseBoard>();
		EnterpriseBoard board = new EnterpriseBoard();
		board.setSearch(search);
		board.setSearchSelect(searchSelect);
		try {
			bList = dao.adminEnterpriseBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bList;
	}
	
	//관리자가 기업 게시물 상세 확인
	@RequestMapping(value = "/adminEnterpriseBoardDetail", method = RequestMethod.GET)
	public String adminEnterpriseBoardDetail(String enterpriseBoard_Seq, Model model) {
		EnterpriseBoard board = new EnterpriseBoard();
		try {
			board = dao.adminEnterpriseBoardDetail(enterpriseBoard_Seq);
			if (board != null) {
				model.addAttribute("adminEnterpriseDetail", board);
				return "admin/adminEnterpriseBoardDetail";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//관리자가 기업 게시물 삭제
	@RequestMapping(value = "/adminDeleteEnterpriseBoard", method = RequestMethod.POST)
	public @ResponseBody int adminDeleteEnterpriseBoard(String enterpriseBoard_Seq) {
		int result = 0;
		try {
			result = dao.adminDeleteEnterpriseBoard(enterpriseBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자가 기업 게시물에 덧글 등록
	@RequestMapping(value = "/adminInsertEnterpriseComment", method = RequestMethod.POST)
	public @ResponseBody int adminInsertEnterpriseComment(EnterpriseComment comment) {
		int result = 0;
		int result2 = 0;
		String seq = String.valueOf(comment.getEnterpriseBoard_Seq());
		try {
			result = dao.adminInsertEnterpriseComment(comment);
			result2 = dao.adminUpdateCheck(seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자가 기업 게시물에 달린 덧글 확인
	@RequestMapping(value = "/adminEnterpriseBoardComment", method = RequestMethod.GET)
	public @ResponseBody ArrayList<EnterpriseComment> adminEnterpriseBoardComment(String enterpriseBoard_Seq){
		ArrayList<EnterpriseComment> cList = new ArrayList<EnterpriseComment>();
		try {
			cList = dao.adminEnterpriseBoardComment(enterpriseBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//관리자가 기업 게시물에 달린 덧글 삭제
	@RequestMapping(value = "/adminDeleteEnterpriseComment", method = RequestMethod.POST)
	public @ResponseBody int adminDeleteEnterpriseComment(String enterpriseComment_Seq){
		int result = 0;
		try {
			result = dao.adminDeleteEnterpriseComment(enterpriseComment_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자가 등록된 매물 리스트 확인
	@RequestMapping(value = "/adminItemBoard", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Item> adminItemBoard(@RequestParam(value="search" ,defaultValue="")String search, @RequestParam(value="searchSelect" ,defaultValue="")String searchSelect) {
		ArrayList<Item> iList = new ArrayList<Item>();
		Item item = new Item();
		item.setSearch(search);
		item.setSearchSelect(searchSelect);
		try {
			iList = dao.adminItemBoard(item);
			for (Item i : iList) {
				if (i.getForSale_Status().equals("For Rent")) {
					i.setForSale_Status("임대");
				} else {
					i.setForSale_Status("매매");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iList;
	}
	
	//매물 상세 조회
	@RequestMapping(value = "/adminItemDetail", method = RequestMethod.GET)
	public String adminItemDetail(String forSale_Seq, Model model) {
		Item item = new Item();
		try {
			item = dao.adminItemDetail(forSale_Seq);
			if (item.getForSale_Status().equals("For Rent")) {
				item.setForSale_Status("임대");
			} else {
				item.setForSale_Status("매매");
			}
			model.addAttribute("adminItemDetail", item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/adminItemDetail";
	}
	
	//관리자가 매물 삭제
	@RequestMapping(value = "/adminItemDelete", method = RequestMethod.POST)
	public @ResponseBody int adminItemDelete(String forSale_Seq) {
		int result = 0;
		try {
			result = dao.adminItemDelete(forSale_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자가 예약 리스트 보기
	@RequestMapping(value = "/adminReservation", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Total> adminReservationList(@RequestParam(value="search" ,defaultValue="")String search, @RequestParam(value="searchSelect" ,defaultValue="")String searchSelect){
		ArrayList<Total> tList = new ArrayList<Total>();
		Total total = new Total();
		total.setSearch(search);
		total.setSearchSelect(searchSelect);
		try {
			tList = dao.adminReservationList(total);
			for (Total t : tList) {
				if (t.getReservation_Complete().equals("Y")) {
					t.setReservation_Complete("예약 완료");
				} else if(t.getReservation_Complete().equals("W")) {
					t.setReservation_Complete("예약 대기중");
				} else {
					t.setReservation_Complete("예약 취소");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tList;
	}
	
	//예약 상세 보기..
	@RequestMapping(value = "/adminReservationDetail", method = RequestMethod.GET)
	public String adminReservationDetail(String reservation_Seq, Model model) {
		Total total = new Total();
		try {
			total = dao.adminReservationDetail(reservation_Seq);
			if (total != null) {
				if (total.getReservation_Complete().equals("W")) {
					total.setReservation_Complete("예약 대기중");
				} else if (total.getReservation_Complete().equals("Y")) {
					total.setReservation_Complete("예약 완료");
				} else {
					total.setReservation_Complete("예약 취소");
				}
				model.addAttribute("reservationDetail", total);
				return "admin/adminReservationDetail";
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//거래 완료 리스트 ...
	@RequestMapping(value = "/adminTradeBoard", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Total> adminTradeBoard(@RequestParam(value="search" ,defaultValue="")String search, @RequestParam(value="searchSelect" ,defaultValue="")String searchSelect){
		ArrayList<Total> tList = new ArrayList<Total>();
		Total total = new Total();
		total.setSearch(search);
		total.setSearchSelect(searchSelect);
		try {
			tList = dao.adminTradeBoard(total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tList;
	}
	
}
