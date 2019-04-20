package com.project.GomBang.DAO;

import java.util.ArrayList;
import java.util.HashMap;

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


public interface AdminMapper {

	public Admin adminLogin(Admin admin); //로그인
	
	public ArrayList<Customer> customerGenderStats(); //고객 성별 통계
	
	public ArrayList<Customer> customerAgeStats(); //고객 나이별 통계
	
	public ArrayList<Customer> allCustomerPrint(Customer customer); //고객 전체 리스트, 조건별 검색 리스트 출력
	
	public ArrayList<Enterprise> enterpriseCodeStats(); //기업 종류별 통계
	
	public ArrayList<Enterprise> enterprisePermissionList(Enterprise enterprise); //가입 후 승인 요청 리스트 (대기중)
	
	public ArrayList<Enterprise> allEnterprisePrint(); //조건 없이 모든 기업 리스트 출력
	
	public Enterprise enterpriseDetail(String enterprise_ID); //기업 상세 페이지 이동용
	
	public int enterprisePermissionAccept(String enterprise_ID); //기업 가입 승인 허가
	
	public int enterprisePermissionDeny(String enterprise_ID); //기업  가입 승인 불허
	
	public ArrayList<Enterprise> enterpriseAcceptList(Enterprise enterprise); //가입 허가된 리스트
	
	public ArrayList<Enterprise> enterpriseDenyList(Enterprise enterprise); //가입 불허된 리스트
	
	public Admin findAdminPassword(Admin admin); //관리자 비밀번호 찾기
	
	public int insertAdmin(Admin admin); //관리자 추가
	
	public int updateAdmin(Admin admin); //관리자 개인정보 업데이트
	
	public HashMap<Integer, Integer> countAccount(); // 소비자와 기업 숫자 count;
	
	public HashMap<Integer, Integer> countBoard(); //소비자, 기업 게시물 숫자 count;
	
	public HashMap<String, Integer> countSubject(); //각 주체별 숫자 count (현재 기업(구분x), 소비자, 매물 만)
	
	public HashMap<String, Integer> countReservation(); //예약 성립/대기 count
	
	public int countForSale(); //매물 개수 count;
	
	public HashMap<Integer, Integer> countEnterpriseTask(); // 기업 문의글, 가입 승인 허가 개수 count
	
	public int insertTODO (AdminTODO admintodo); //관리자 todo 추가
	
	public ArrayList<AdminTODO> printTODO(String admin_ID); //todo 출력
	
	public int updateTODO (AdminTODO admintodo); //todo 수정
	
	public int deleteTODO(String adminTodo_Seq); // todo 삭제
	
	public ArrayList<Enterprise> mainPageEnterprise(); // 메인 페이지 통계 - 기업
	
	public ArrayList<Customer> mainPageCustomer(); // 메인 페이지 통계 - 고객
	
	public ArrayList<Item> mainPageItem(); // 메인 페이지 통계 - 매물
	
	public ArrayList<Reservation> mainPageReservation(); //메인 페이지 통계 - 예약
	
	public int insertAdminMessage(AdminMessage adminmessage); //관리자 소규모 메세지창 등록
	
	public ArrayList<AdminMessage> printMessage(AdminMessage adminMessage); //관리자 소규모 메세지창 출력
	
	public ArrayList<AdminMessage> mainPageMessage(); // 메인화면에 5개 관리자 메세지창 출력
	
	public HashMap<String, Integer> countForSaleRent(); //매물 통계 (임대/렌트	) 카운트
	
	public ArrayList<Item> countHouseType(); //메물 통계 (종류별) 카운트
	
	public ArrayList<Customerboard> adminCustomerBoard(Customerboard board); //관리자 입장에서 고객 게시판 출력
	
	public ArrayList<Item> enterpriseItemCount(); //매물통계 (기업이 등록한 매물 count);
	
	public Customerboard admincustomerBoardDetail(String customerBoard_Seq); //관리자 입장에서 고객 게시판 상세 확인
	
	public ArrayList<CustomerComment> adminCustomerBoardComment(String customerBoard_Seq); //관리자 입장에서 고객 게시판 덧글 확인
	
	public int adminInsertCustomerComment(CustomerComment comment); //관리자가 고객 게시판에 덧글달기
	
	public int adminDeleteCustomerComment(String customerComment_Seq); //관리자가 고객 게시판에 덧글 삭제
	
	public int adminDeleteCustomerBoard(String customerBoard_Seq); //관리자가 고객 게시판 글 삭제
	
	public ArrayList<EnterpriseBoard> adminEnterpriseBoard(EnterpriseBoard board); //관리자가 기업 게시판 리스트 출력
	
	public EnterpriseBoard adminEnterpriseBoardDetail(String enterpriseBoard_Seq); //관리자가 기업 게시판 상세 확인
	
	public int adminDeleteEnterpriseBoard(String enterpriseBoard_Seq); //관리자가 기업 게시판 삭제
	
	public int adminInsertEnterpriseComment(EnterpriseComment comment); //관리자가 기업 게시물에 덧글달기
	
	public ArrayList<EnterpriseComment> adminEnterpriseBoardComment(String enterpriseBoard_Seq); //관리자가 기업 게시물 덧글 보기
	
	public int adminDeleteEnterpriseComment(String enterpriseComment_Seq); //관리자가 기업 게시물 덧글 삭제
	
	public int adminUpdateCheck(String enterpriseBoard_Seq); //관리자가 기업 게시물에 덧글달면 상태변경
	
	public ArrayList<Item> adminItemBoard(Item item); //관리자 쪽에서 등록된 매물 리스트 확인
	
	public Item adminItemDetail(String forSale_Seq); // 매물 정보 상세 조회
	
	public int adminItemDelete(String forSale_Seq); //관리자가 매물 삭제
}
