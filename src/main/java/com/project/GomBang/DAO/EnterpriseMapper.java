
package com.project.GomBang.DAO;


import java.util.ArrayList;

import com.project.GomBang.VO.CustomerComment;
import com.project.GomBang.VO.Customerboard;
import com.project.GomBang.VO.Enterprise;
import com.project.GomBang.VO.EnterpriseBoard;
import com.project.GomBang.VO.EnterpriseComment;
import com.project.GomBang.VO.Image;
import com.project.GomBang.VO.Item;
import com.project.GomBang.VO.Reservation;
import com.project.GomBang.VO.Total;


public interface EnterpriseMapper {

	public int insertEnterprise(Enterprise enterprise);
	
	public Enterprise selectEnterprise(Enterprise enterprise);
	
	public ArrayList<Enterprise> enterpriseList();
	
	public int deleteEnterprise(Enterprise enterprise);
	
	public int updateEnterprise(Enterprise enterprise);
	
	public Enterprise searchUpdate(String enterprise_ID);
	
	public int insertItem(Item item);
	
	public int insertImg(Image image); // 이미지 삽입
	
	public int insertEnterpriseBoard(EnterpriseBoard enterpriseboard); //기업 게시판 등록 
	
	public ArrayList<EnterpriseBoard> enterpriseBoardList(); //기업 게시판 글 전체 출력
	
	public EnterpriseBoard selectEnterpriseboard(String enterpriseBoard_Seq); //기업 게시판 글 상세보기
	
	public void countEnterpriseboard(String enterpriseBoard_Seq);

    public ArrayList<Total> ICList();//최근 등록한 6개 매물 출력하기
	
	public ArrayList<Total> HouseTypeList(String forSale_HouseType);//최근 등록한 매물중 하우스타입인것 출력
	
	public int remakeEnterpriseboard(EnterpriseBoard eboard);
	
	public int insertEnterpriseComment(EnterpriseComment EnterpriseComment);
	
	public ArrayList<EnterpriseComment> enterpriseCommentList(EnterpriseComment EnterpriseComment);
	
	public int deleteEnterpriseboard(EnterpriseBoard eboard);

    public ArrayList<Total> EnterpriseItemList(Total total);//기업이 등록한 매물리스트 보여주기
	
	public int EnterpriseItemDelete(Total total);
	
	public int EnterpriseImageDelete(Total total);
	
	public Total EnterpriseItem(Total total);
	
	public ArrayList<Total> EnterpriseImage(Total total);
	
	public int updateItem(Item item);
	
	public int updateImage(Image image); 
	
	public Enterprise enterpriseProfile(String enterprise_ID);
	
	public int updateenterpriseProfile(Enterprise enterprise);//프로필 화면에서 기본정보 수정
	
	public int updateenterprisePassword(Enterprise enterprise);//프로필 화면에서 비밀번호 수정
	
	public  ArrayList<Total> reservationwait(Total total);//기업페이지에서 기업이 등록한 매물을 예약한 고객 신청서 보여주기 
	
	public int updatereservation(String reservation_Seq);//예약 대기를 확인으로 바꿔주기
	
	public  ArrayList<Total> reservationcomplete(Total total);//기업페이지에서 기업이 등록한 매물을 예약확인된 신청서 보여주기 
	
	public int enterpriseReservationCancel(Reservation reservation); //예약 취소

	public int tradeComplete(Reservation reservation) ; //거래 완료
	
	public ArrayList<Total> tradeCompleteList(String enterprise_ID); //거래 리스트 완료 출려개ㅐㅐㅐㅐㅐㅐㅐㅐㅐ
	
	public ArrayList<Total> popularproperties();//popularproperties
	
	public int tradeReservationCancel(Reservation reservation); //완료된 거래의 매물 예약 전부 취소
}

