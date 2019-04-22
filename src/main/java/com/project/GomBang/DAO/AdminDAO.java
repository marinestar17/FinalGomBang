package com.project.GomBang.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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



@Repository
public class AdminDAO {
	@Autowired
	SqlSession sqlSession;
	
	//관리자 로그인
	public Admin adminLogin(Admin admin) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		Admin result = new Admin();
		try {
			result = map.adminLogin(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//고객 성별 통계 출력
	public ArrayList<Customer> customerGenderStats() {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Customer> cList = new ArrayList<Customer>();
		try {
			cList = map.customerGenderStats();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//고객 나이대 통계 출력
	public ArrayList<Customer> customerAgeStats(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Customer> cList = new ArrayList<Customer>();
		try {
			cList = map.customerAgeStats();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//전체고객출력
	public ArrayList<Customer> allCustomerPrint(Customer c){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Customer> cList = new ArrayList<Customer>();
		try {
			cList = map.allCustomerPrint(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//기업 종류별 통계 출력
	public ArrayList<Enterprise> enterpriseCodeStats() {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = map.enterpriseCodeStats();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}
	
	//가입 승인 대기 리스트 출력
	public ArrayList<Enterprise> enterprisePermissionList(Enterprise enterprise) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = map.enterprisePermissionList(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}
	
	//기업 상세 페이지 이동용
	public Enterprise enterpriseDetail(String enterprise_ID) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		Enterprise result = new Enterprise();
		try {
			result = map.enterpriseDetail(enterprise_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//기업 가입 승인
	public int enterprisePermissionAccept(String enterprise_ID) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.enterprisePermissionAccept(enterprise_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//기업 가입 불허
	public int enterprisePermissionDeny(String enterprise_ID) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.enterprisePermissionDeny(enterprise_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//가입 허가된 기업 리스트 출력
	public ArrayList<Enterprise> enterpriseAcceptList(Enterprise enterprise) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = map.enterpriseAcceptList(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}
	
	//가입 불허된 기업 리스트 출력
	public ArrayList<Enterprise> enterpriseDenyList(Enterprise enterprise) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = map.enterpriseDenyList(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}
	
	//조건없이 모든 기업 리스트 출력
	public ArrayList<Enterprise> allEnterprisePrint() {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = map.allEnterprisePrint();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}
	
	//비밀번호 찾기
	public Admin findAdminPassword(Admin admin) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		Admin result = new Admin();
		try {
			result = map.findAdminPassword(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자 추가
	public int insertAdmin(Admin admin) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.insertAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자 개인정보 수정
	public int updateAdmin(Admin admin) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.updateAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//소비자, 기업 count 
	public HashMap<Integer,Integer> countAccount(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		HashMap<Integer,Integer> hMap = new HashMap<Integer, Integer>();
		try {
			hMap = map.countAccount();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return hMap;
	}
	
	//소비자, 기업 게시물 count
	public HashMap<Integer,Integer> countBoard(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		HashMap<Integer,Integer> hMap = new HashMap<Integer, Integer>();
		try {
			hMap = map.countBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//매물 수 count
	public int countForSale() {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.countForSale();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//각 주체별 숫자 count (현재 기업(구분x), 소비자, 매물 만) 
	public HashMap<String, Integer> countSubject(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		HashMap<String,Integer> hMap = new HashMap<String, Integer>();
		try {
			hMap = map.countSubject();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//예약 성립/대기 count
	public HashMap<String, Integer> countReservation(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		HashMap<String,Integer> hMap = new HashMap<String, Integer>();
		try {
			hMap = map.countReservation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//기업 문의글 업무 및 가입 승인 허가 관련 업무 개수 count
	public HashMap<Integer, Integer> countEnterpriseTask(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		HashMap<Integer,Integer> hMap = new HashMap<Integer, Integer>();
		try {
			hMap = map.countEnterpriseTask();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hMap;
	}
	
	//관리자 todo 추가
	public int insertTODO(AdminTODO admintodo) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.insertTODO(admintodo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//todo 출력 (본인 id 내용만)
	public ArrayList<AdminTODO> printTODO(String admin_ID) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<AdminTODO> todoList = new ArrayList<AdminTODO>();
		try {
			todoList = map.printTODO(admin_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return todoList;
	}
	
	//todo 수정
	public int updateTODO(AdminTODO admintodo) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.updateTODO(admintodo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//todo 삭제
	public int deleteTODO(String adminTodo_Seq) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.deleteTODO(adminTodo_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//메인 페이지 통계 - 기업
	public ArrayList<Enterprise> mainPageEnterprise(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		try {
			eList = map.mainPageEnterprise();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eList;
	}
	
	//메인 페이지 통계 - 고객
	public ArrayList<Customer> mainPageCustomer(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Customer> cList = new ArrayList<Customer>();
		try {
			cList = map.mainPageCustomer();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//메인 페이지 통계 - 매물
	public ArrayList<Item> mainPageItem(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		ArrayList<Item> iList = new ArrayList<Item>();
		try {
			iList = map.mainPageItem();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iList;
	 }
	 
	 //메인 페이지 통계 - 예약
	 public ArrayList<Reservation> mainPageReservation(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Reservation> rList = new ArrayList<Reservation>();
		 try {
			rList = map.mainPageReservation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return rList;
	 }
	 
	 //메인 페이지 통계 - 거래
	 public ArrayList<Item> mainPageTrade(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.mainPageTrade();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	 }
	 
	 //관리자 간편 게시판 등록하기
	 public int insertAdminMessage(AdminMessage adminmessage) {
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		int result = 0;
		try {
			result = map.insertAdminMessage(adminmessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	 }
	 
	 //관리자 간편 게시판 출력
	 public ArrayList<AdminMessage> printMessage(AdminMessage message){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<AdminMessage> mList = new ArrayList<AdminMessage>();
		 try {
			mList = map.printMessage(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return mList;
	 }
	 
	 //메인 페이지에서 간편 게시판 5개 출력
	 public ArrayList<AdminMessage> mainPageMessage(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<AdminMessage> mList = new ArrayList<AdminMessage>();
		 ArrayList<AdminMessage> result = new ArrayList<AdminMessage>();
		 try {
			 mList = map.mainPageMessage();
			for (int i = 0; i < 5; i++) {
				result.add(mList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return mList;
	 }
	 
	 //매물 통계(임대/렌트 비율)
	 public HashMap<String, Integer> countForSaleRent() {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		 try {
			hMap = map.countForSaleRent();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return hMap;
	 }
	 
	 //매물 통계 (종류별) 카운트
	 public ArrayList<Item> countHouseType(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.countHouseType();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	 }
	 
	 //매물 통계 (기업이 등록한 매물 갯수 카운트)
	 public ArrayList<Item> enterpriseItemCount(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.enterpriseItemCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	 }
	 
	 //관리자 입장에서 고객 게시판 출력
	 public ArrayList<Customerboard> adminCustomerBoard(Customerboard board){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Customerboard> bList = new ArrayList<Customerboard>();
		 try {
			bList = map.adminCustomerBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return bList;
	 }
	 
	 //관리자 입장에서 고객 게시판 게시물 상세 조회
	 public Customerboard admincustomerBoardDetail(String customerBoard_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 Customerboard board = new Customerboard();
		 try {
			board = map.admincustomerBoardDetail(customerBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return board;
	 }
	 
	 //관리자 입장에서 고객 게시판 게시물의 덧글 조회
	 public ArrayList<CustomerComment> adminCustomerBoardComment(String customerBoard_Seq){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<CustomerComment> cList = new ArrayList<CustomerComment>();
		 try {
			cList = map.adminCustomerBoardComment(customerBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return cList;
	 }
	 
	 //관리자가 고객 게시물에 덧글달기
	 public int adminInsertCustomerComment(CustomerComment comment) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 int result = 0;
		 try {
			result = map.adminInsertCustomerComment(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 //관리자가 고객 게시물에 덧글 삭제
	 public int adminDeleteCustomerComment(String customerComment_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 int result = 0;
		 try {
			result = map.adminDeleteCustomerComment(customerComment_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 //관리자가 고객 게시판에 글 삭제
	 public int adminDeleteCustomerBoard(String customerBoard_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 int result = 0;
		 try {
			result = map.adminDeleteCustomerBoard(customerBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 //관리자가 기겁 게시판 리스트 확인
	 public ArrayList<EnterpriseBoard> adminEnterpriseBoard(EnterpriseBoard board){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<EnterpriseBoard> bList = new ArrayList<EnterpriseBoard>();
		 try {
			bList = map.adminEnterpriseBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return bList;
	 }
	 
	 //관리자가 기업 게시판 상세 확인
	 public EnterpriseBoard adminEnterpriseBoardDetail(String enterpriseBoard_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 EnterpriseBoard board = new EnterpriseBoard();
		 try {
			board = map.adminEnterpriseBoardDetail(enterpriseBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return board;
	 }
	 
	 //관리자가 기업 게시판 삭제
	 public int adminDeleteEnterpriseBoard(String enterpriseBoard_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 int result = 0;
		 try {
			result = map.adminDeleteEnterpriseBoard(enterpriseBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 //관리자가 기업 게시판에 덧글 등록
	 public int adminInsertEnterpriseComment(EnterpriseComment comment) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 int result = 0;
		 try {
			result = map.adminInsertEnterpriseComment(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 //관리자가 기업 게시물에 달린 덧글 확인
	 public ArrayList<EnterpriseComment> adminEnterpriseBoardComment(String enterpriseBoard_Seq){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<EnterpriseComment> cList = new ArrayList<EnterpriseComment>();
		 try {
			cList = map.adminEnterpriseBoardComment(enterpriseBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return cList;
	 }
	 
	 //관리자가 기업 게시물 덧글 삭제
	 public int adminDeleteEnterpriseComment(String enterpriseComment_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 int result = 0;
		 try {
			result = map.adminDeleteEnterpriseComment(enterpriseComment_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 //관리자가 기업 게시물에 덧글 달면 상태변경
	 public int adminUpdateCheck(String enterpriseBoard_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 int result = 0;
		 try {
			result = map.adminUpdateCheck(enterpriseBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 //관리자가 등록된 매물 리스트 확인
	 public ArrayList<Item> adminItemBoard(Item item){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.adminItemBoard(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	 }
	 
	 //매물 상세 조회
	 public Item adminItemDetail(String forSale_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 Item item = new Item();
		 try {
			item = map.adminItemDetail(forSale_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return item;
	 }
	 
	 //관리자가 매물 삭제
	 public int adminItemDelete(String forSale_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 int result = 0;
		 try {
			result = map.adminItemDelete(forSale_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 //관리자가 예약 리스트 보기
	 public ArrayList<Total> adminReservationList(Total total) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Total> tList = new ArrayList<Total>();
		 try {
			tList = map.adminReservationList(total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return tList;
	 }
	 
	 //예약 상세히 보기
	 public Total adminReservationDetail(String reservation_Seq) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 Total total = new Total();
		 try {
			total = map.adminReservationDetail(reservation_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return total;
	 }
	 
	 //거래 완료 리스트
	 public ArrayList<Total> adminTradeBoard(Total total) {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Total> tList = new ArrayList<Total>();
		 try {
			tList = map.adminTradeBoard(total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return tList;
	 }
	 
	 //매물통계 - 제일 인기많은 도시 5개 ㅇㅇ
	 public ArrayList<Item> bestItemCity(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.bestItemCity();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	 }
	 
	 //매물통계 - 시키/레이킹 관련
	 public HashMap<String,Integer> countShikiRei(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 HashMap<String,Integer> hMap = new HashMap<String,Integer>();
		 try {
			hMap = map.countShikiRei();
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		 return hMap;
	 }
	 
	 //예약 통계 - 사람들 비자 종류 count
	 public ArrayList<Reservation> countReservationVisa(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Reservation> rList = new ArrayList<Reservation>();
		 try {
			rList = map.countReservationVisa();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return rList;
	 }
	 
	 //즐겨찾기 인기 순위 매물
	 public ArrayList<Item> countBookmarkItem(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.countBookmarkItem();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	 }
	 
	 //사이트 예약 현황 통계
	 public ArrayList<Reservation> countReservationComplete() {
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Reservation> rList = new ArrayList<Reservation>();
		 try {
			rList = map.countReservationComplete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return rList;
	 }
	 
	 //임대 매물 야칭값 범위 통계용
	 public ArrayList<Item> countRentItem(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.countRentItem();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	 }
	
	 //예약 - 인기 순위 매물 
	 public ArrayList<Item> countReservationItem(){
		 AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.countReservationItem();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	 }
	 
	//조회수  - 인기 매물
	public ArrayList<Item> hitCountItem(){
		AdminMapper map = sqlSession.getMapper(AdminMapper.class);
		 ArrayList<Item> iList = new ArrayList<Item>();
		 try {
			iList = map.hitCountItem();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return iList;
	}
	
}
