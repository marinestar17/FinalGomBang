package com.project.GomBang.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.GomBang.VO.Bookmark;
import com.project.GomBang.VO.Customer;
import com.project.GomBang.VO.CustomerComment;
import com.project.GomBang.VO.Customerboard;
import com.project.GomBang.VO.Image;
import com.project.GomBang.VO.Item;
import com.project.GomBang.VO.Reservation;
import com.project.GomBang.VO.SearchItem;
import com.project.GomBang.VO.Total;


@Repository
public class CustomerDAO {

	
	@Autowired
	SqlSession session;
	//회원가입
	public int signup(Customer c) {
		int result=0;
		CustomerMapper mapper=session.getMapper(CustomerMapper.class);
		try {
		   result=mapper.signup(c);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	//아이디 중복체크
	public ArrayList<Customer> checkid() {
		ArrayList<Customer> cu=null;
		CustomerMapper mapper=session.getMapper(CustomerMapper.class);
		try {
			cu=mapper.checkid();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			// TODO: handle exception
		}
		return cu;
	}
	//로그인
	public Customer login(Customer c) {
		Customer cu=null;
		CustomerMapper mapper=session.getMapper(CustomerMapper.class);
		try {
			cu=mapper.login(c);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return cu;
	}	
	
	//회원정보수정
	public int modify(Customer c) {
		int result=0;
		CustomerMapper mapper=session.getMapper(CustomerMapper.class);
		try {
			result=mapper.modify(c);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		return result;
		
	}
	//아이디 회원수정 찾기
	public Customer searchmodify(String customer_ID) {
		Customer c=null;
		CustomerMapper mapper=session.getMapper(CustomerMapper.class);
		try {
			c=mapper.searchmodify(customer_ID);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return c;
	}
	//아이디 삭제
	public int deleteID(Customer c) {
		int result=0;
		CustomerMapper mapper=session.getMapper(CustomerMapper.class);
		try {
			result=mapper.deleteID(c);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int insertCustomerboard(Customerboard cboard) {
		int result = 0;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			result = cm.insertCustomerboard(cboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Customerboard> customerBoardlist(){
		ArrayList<Customerboard> result = null;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			result = cm.customerBoardlist();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Customerboard selectCustomerboard(String customerBoard_Seq) {
		Customerboard result = null;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			result=cm.selectCustomerboard(customerBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void countCustomerboard(String customerBoard_Seq) {
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			cm.countCustomerboard(customerBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int remakeCustomerboard(Customerboard cboard) {
		int result = 0;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			result = cm.remakeCustomerboard(cboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 매물 상세보기
	public Item customerItemDetail(int forSale_Seq) {
		Item item = null;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			item = cm.customerItemDetail(forSale_Seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("매물 상세보기 에러");
		}
		return item;
	}
	
	// 상세보기 이미지 리스트 출력
	public ArrayList<Image> detailImg(int forSale_Seq){
		ArrayList<Image> list = new ArrayList<Image>();
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			list = cm.detailImg(forSale_Seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("이미지 리스트 출력 에러");
		}
		return list;
	}
	
	// 검색된 매물 리스트
	public ArrayList<Item> searchItem(SearchItem item){
		ArrayList<Item> list = null;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			list = cm.searchItem(item);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("검색된 매물 리스트 출력 에러");
		}
		return list;
	}
	
	public ArrayList<Item> searchAllItem() {
		ArrayList<Item> list = null;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			list = cm.searchAllItem();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("매물 전체 리스트 출력");
		}
		return list;
	}
	// 고객 댓글 입력
	public int insertCustomerComment(CustomerComment CustomerComment) {
		int result = 0;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			result = cm.insertCustomerComment(CustomerComment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 고객 댓글 리스트 뽑기
	public ArrayList<CustomerComment> customerCommentList(CustomerComment CustomerComment){
		ArrayList<CustomerComment> result = null;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			result = cm.customerCommentList(CustomerComment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 고객 게시물 삭제
	public int deleteCustomerboard(Customerboard cboard) {
		int result = 0;
		CustomerMapper cm = session.getMapper(CustomerMapper.class);
		try {
			result = cm.deleteCustomerboard(cboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//손님이 예약 
	public int insertCustomerReservation(Reservation reservation) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		int result = 0;
		try {
			result = map.insertCustomerReservation(reservation);
		} catch (Exception e) {
			
		}
		return result;
	}
	
	//손님 예약 체크용
	public ArrayList<Reservation> reservationCheck(String customer_ID) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		ArrayList<Reservation> rList = new ArrayList<Reservation>();
		try {
			rList = map.reservationCheck(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rList;
	}
	
	//즐겨찾기 등록
	public int customerBookmark(Bookmark bookmark) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		int result = 0;
		try {
			result = map.customerBookmark(bookmark);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//프로필 데이터 용
	public Customer customerProfile(String customer_ID) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		Customer c = new Customer();
		try {
			c = map.customerProfile(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	//프로필 화면에서 기본정보 수정
	public int profileUpdate(Customer customer) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		int result = 0;
		try {
			result = map.profileUpdate(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//프로필 화면에서 비밀번호 수정
	public int profilePasswordUpdate(Customer customer) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		int result = 0;
		try {
			result = map.profilePasswordUpdate(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//고객이 예약 리스트 확인
	public ArrayList<Total> customerReservationList(String customer_ID) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		ArrayList<Total> tList = new ArrayList<Total>();
		try {
			tList = map.customerReservationList(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tList;
	}
	
	//고객이 즐겨찾기 리스트 확인
	public ArrayList<Total> customerBookmarkList(String customer_ID){
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		ArrayList<Total> tList = new ArrayList<Total>();
		try {
			tList = map.customerBookmarkList(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tList;
	}
	
	//고객이 즐찾 삭제
	public int customerDeleteBookmark(String bookmark_Seq) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		int result = 0;
		try {
			result = map.customerDeleteBookmark(bookmark_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//고객이 예약 취소(삭제)
	public int customerDeleteReservation(String reservation_Seq) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		int result = 0;
		try {
			result = map.customerDeleteReservation(reservation_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//즐찾 중복 체크용
	public ArrayList<Bookmark> bookmarkCheck(String customer_ID)  {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		ArrayList<Bookmark> bList = new ArrayList<Bookmark>();
		try {
			bList = map.bookmarkCheck(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bList;
	}
	
	//매물 조회수 업데이트
	public int itemHitCountUp(String forSale_Seq) {
		CustomerMapper map = session.getMapper(CustomerMapper.class);
		int result = 0;
		try {
			result = map.itemHitCountUp(forSale_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
