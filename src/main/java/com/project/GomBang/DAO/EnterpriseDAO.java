
package com.project.GomBang.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


@Repository
public class EnterpriseDAO {

	@Autowired
	SqlSession session;
	
	public int insertEnterprise(Enterprise enterprise) {
		int result = 0;
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			result = em.insertEnterprise(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public Enterprise selectEnterprise(Enterprise enterprise) {
		Enterprise result = null;
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			result = em.selectEnterprise(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<Enterprise> enterpriseList() {
		ArrayList<Enterprise> result = null;
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			result = em.enterpriseList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int deleteEnterprise(Enterprise enterprise) {
		int result = 0;
		EnterpriseMapper am = session.getMapper(EnterpriseMapper.class);
		try {
			result = am.deleteEnterprise(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int updateEnterprise(Enterprise enterprise) {
		int result = 0;
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			result = em.updateEnterprise(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public Enterprise searchUpdate(String enterprise_ID) {
		Enterprise result = null;
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			result = em.searchUpdate(enterprise_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 매물 등록
	public int insertItem(Item item) {
		int result = 0;
		EnterpriseMapper mapper = session.getMapper(EnterpriseMapper.class);
		try {
			result = mapper.insertItem(item);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("매물 등록 에러");
		}
		return result;
	}
	public int insertImg(Image image) {
		int result = 0;
		EnterpriseMapper mapper = session.getMapper(EnterpriseMapper.class);
		try {
			result = mapper.insertImg(image);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("이미지 삽입 에러");
		}
		return result;
	}
	
	//기업 게시판 등록
	public int insertEnterpriseBoard(EnterpriseBoard enterpriseboard) {
		EnterpriseMapper mapper = session.getMapper(EnterpriseMapper.class);
		int result = 0;
		try {
			result = mapper.insertEnterpriseBoard(enterpriseboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//기업 게시판 전체출력
	public ArrayList<EnterpriseBoard> enterpriseBoardList(){
		ArrayList<EnterpriseBoard> result = null;
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			result = em.enterpriseBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//기업 게시판 글 하나 출력
	public EnterpriseBoard selectEnterpriseboard(String enterpriseBoard_Seq) {
		EnterpriseBoard result = null;
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			result=em.selectEnterpriseboard(enterpriseBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//기업 게시판 조회수 관련
	public void countEnterpriseboard(String enterpriseBoard_Seq) {
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			em.countEnterpriseboard(enterpriseBoard_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//최근 등록한 매물 이미지+6개리스트출력
	public ArrayList<Total> ICList(){
		ArrayList<Total> list=new ArrayList<Total>();
		EnterpriseMapper mapper = session.getMapper(EnterpriseMapper.class);
		try {
			list=mapper.ICList();
		} catch (Exception e) {
				// TODO: handle exception
			e.printStackTrace();
			return null;
		}
			return list;
		}
		
		//최근 등록한 매물중 하우스타입인것
	public ArrayList<Total> HouseTypeList (String forSale_HouseType){
		ArrayList<Total> typelist=new ArrayList<Total>();
		EnterpriseMapper mapper = session.getMapper(EnterpriseMapper.class);
		try {
			typelist=mapper.HouseTypeList(forSale_HouseType);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return typelist;
				
	    }
	
	public int remakeEnterpriseboard(EnterpriseBoard eboard) {
		int result = 0;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			result = cm.remakeEnterpriseboard(eboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 기업 댓글 입력
	public int insertEnterpriseComment(EnterpriseComment EnterpriseComment) {
		int result = 0;
		EnterpriseMapper em = session.getMapper(EnterpriseMapper.class);
		try {
			result = em.insertEnterpriseComment(EnterpriseComment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
			
	// 기업 댓글 리스트 뽑기
	public ArrayList<EnterpriseComment> enterpriseCommentList(EnterpriseComment EnterpriseComment){
		ArrayList<EnterpriseComment> result = null;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			result = cm.enterpriseCommentList(EnterpriseComment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
			
	// 기업 게시물 삭제
	public int deleteEnterpriseboard(EnterpriseBoard eboard) {
		int result = 0;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			result = cm.deleteEnterpriseboard(eboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//기업이 등록한 매물 리스트 보여주기
	public ArrayList<Total> EnterpriseItemList(Total total){
		ArrayList<Total> enteritemlist=new ArrayList<Total>();
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			enteritemlist = cm.EnterpriseItemList(total);
		} catch (Exception e) {
			e.printStackTrace();
			return null;	
		}
		return enteritemlist;
	}
	
	public int EnterpriseItemDelete(Total total) {
		int result = 0;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			result = cm.EnterpriseItemDelete(total);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int EnterpriseImageDelete(Total total) {
		int result = 0;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			result = cm.EnterpriseImageDelete(total);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public Total EnterpriseItem(Total tt) {
		Total total=null;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			total=cm.EnterpriseItem(tt);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return total;
	}
	
	public ArrayList<Total> EnterpriseImage(Total tt) {
		ArrayList<Total> total=new ArrayList<Total>();
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			total=cm.EnterpriseImage(tt);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return total;
	}
	
	public int updateItem(Item item) {
		int result=0;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			result = cm.updateItem(item);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int updateImage(Image image) {
		int result=0;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			result = cm.updateImage(image);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public Enterprise enterpriseProfile(String enterprise_ID) {
		Enterprise enterprise=new Enterprise();
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			enterprise = cm.enterpriseProfile(enterprise_ID);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return enterprise;
		
	}
	//프로필 화면에서 기본정보 수정
	public int updateenterpriseProfile(Enterprise enterprise) {
		int result=0;
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		try {
			result=cm.updateenterpriseProfile(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
		
	}
	//프로필 화면에서 비밀번호 수정
	public int updateenterprisePassword(Enterprise enterprise) {
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		int result = 0;
		try {
			result =cm.updateenterprisePassword(enterprise);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public ArrayList<Total> reservationwait(Total total) {
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		ArrayList<Total> list=new ArrayList<Total>();
		try {
			list=cm.reservationwait(total);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
    public int updatereservation(String reservation_Seq) {
    	EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
    	int result = 0;
		try {
			result =cm.updatereservation(reservation_Seq);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
    }
    
	public ArrayList<Total> reservationcomplete(Total total) {
		EnterpriseMapper cm = session.getMapper(EnterpriseMapper.class);
		ArrayList<Total> list=new ArrayList<Total>();
		try {
			list=cm.reservationcomplete(total);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	//예약 취소(기업)
	public int enterpriseReservationCancel(Reservation reservation) {
		EnterpriseMapper map = session.getMapper(EnterpriseMapper.class);
		int result = 0;
		try {
			result = map.enterpriseReservationCancel(reservation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//거래 완료 알림
	public int tradeComplete(String forSale_Seq) {
		EnterpriseMapper map = session.getMapper(EnterpriseMapper.class);
		int result = 0;
		try {
			result = map.tradeComplete(forSale_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//거래 완료 리스트 출력
	public ArrayList<Total> tradeCompleteList(String enterprise_ID){
		EnterpriseMapper map = session.getMapper(EnterpriseMapper.class);
		ArrayList<Total> tList = new ArrayList<Total>();
		try {
			tList = map.tradeCompleteList(enterprise_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tList;
	}
}

