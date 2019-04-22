package com.project.GomBang.DAO;

import java.util.ArrayList;

import com.project.GomBang.VO.Bookmark;
import com.project.GomBang.VO.Customer;
import com.project.GomBang.VO.CustomerComment;
import com.project.GomBang.VO.Customerboard;
import com.project.GomBang.VO.Enterprise;
import com.project.GomBang.VO.Image;
import com.project.GomBang.VO.Item;
import com.project.GomBang.VO.Reservation;
import com.project.GomBang.VO.SearchItem;
import com.project.GomBang.VO.Total;


public interface CustomerMapper {

    public int signup(Customer c);
	
	public ArrayList<Customer> checkid();
	
	public Customer login(Customer c);
	
	public int modify(Customer c);
	
	public Customer searchmodify(String customer_ID);
	
	public int deleteID(Customer c);
	
	public int insertCustomerboard(Customerboard cboard);
	
	public ArrayList<Customerboard> customerBoardlist();
	
	public Customerboard selectCustomerboard(String customerBoard_Seq);
	
	public void countCustomerboard(String customerBoard_Seq);
	
	public int remakeCustomerboard(Customerboard cboard);
	
	public Item customerItemDetail(int forSale_Seq); // 매물 상세 조회
	
	public ArrayList<Item> searchAllItem(); // 전체 매물 상세 조회
	
	public ArrayList<Image> detailImg(int forSale_Seq);
	
	public ArrayList<Item> searchItem(SearchItem item); // 검색된 매물 리스트
	
	public int insertCustomerComment(CustomerComment CustomerComment);
	
	public ArrayList<CustomerComment> customerCommentList(CustomerComment CustomerComment);
	
	public int deleteCustomerboard(Customerboard cboard);
	
	public int insertCustomerReservation(Reservation reservation); //손님이 예약검
	
	public ArrayList<Reservation> reservationCheck(String customer_ID); //에약 중복 체크용;
	
	public int customerBookmark(Bookmark bookmark); //즐겨찾기 등록
	
	public Customer customerProfile(String customer_ID); //프로필 데이터 용 
	
	public int profileUpdate(Customer customer); //프로필 화면에서 기본정보 수정
	
	public int profilePasswordUpdate(Customer customer); //프로필 화면에서 비밀번호 수정
	
	public ArrayList<Total> customerReservationList(String customer_ID); //예약 리스트 확인;
	
	public ArrayList<Total> customerBookmarkList(String customer_ID); //즐겨찾기 리스트 확인;
	
	public int customerDeleteBookmark(String bookmark_Seq); //즐찾 삭제
	
	public int customerDeleteReservation(String reservation_Seq); //예약 취소
	
	public ArrayList<Bookmark> bookmarkCheck(String customer_ID); //즐겨찾기 중복 체크용;
	
	public int itemHitCountUp(String forsale_Seq); // 매물 조회수 up
	
	public ArrayList<Enterprise> customerEnterpriseList(); // 소비자가 기업 리스트 확인
	
}