package com.project.GomBang.VO;

public class EnterpriseBoard {
	private int enterpriseBoard_Seq;
	private String enterprise_ID;
	private String enterpriseBoard_Title;
	private String enterpriseBoard_Content;
	private String enterpriseBoard_Indate;
	private int enterpriseBoard_HitCount;
	private String enterpriseBoard_AdminCheck;
	private String searchSelect;
	private String search;
	
	public EnterpriseBoard(int enterpriseBoard_Seq, String enterprise_ID, String enterpriseBoard_Title,
			String enterpriseBoard_Content, String enterpriseBoard_Indate, int enterpriseBoard_HitCount,
			String enterpriseBoard_AdminCheck, String searchSelect, String search) {
		super();
		this.enterpriseBoard_Seq = enterpriseBoard_Seq;
		this.enterprise_ID = enterprise_ID;
		this.enterpriseBoard_Title = enterpriseBoard_Title;
		this.enterpriseBoard_Content = enterpriseBoard_Content;
		this.enterpriseBoard_Indate = enterpriseBoard_Indate;
		this.enterpriseBoard_HitCount = enterpriseBoard_HitCount;
		this.enterpriseBoard_AdminCheck = enterpriseBoard_AdminCheck;
		this.searchSelect = searchSelect;
		this.search = search;
	}

	public EnterpriseBoard() {
		super();
	}

	public int getEnterpriseBoard_Seq() {
		return enterpriseBoard_Seq;
	}

	public void setEnterpriseBoard_Seq(int enterpriseBoard_Seq) {
		this.enterpriseBoard_Seq = enterpriseBoard_Seq;
	}

	public String getEnterprise_ID() {
		return enterprise_ID;
	}

	public void setEnterprise_ID(String enterprise_ID) {
		this.enterprise_ID = enterprise_ID;
	}

	public String getEnterpriseBoard_Title() {
		return enterpriseBoard_Title;
	}

	public void setEnterpriseBoard_Title(String enterpriseBoard_Title) {
		this.enterpriseBoard_Title = enterpriseBoard_Title;
	}

	public String getEnterpriseBoard_Content() {
		return enterpriseBoard_Content;
	}

	public void setEnterpriseBoard_Content(String enterpriseBoard_Content) {
		this.enterpriseBoard_Content = enterpriseBoard_Content;
	}

	public String getEnterpriseBoard_Indate() {
		return enterpriseBoard_Indate;
	}

	public void setEnterpriseBoard_Indate(String enterpriseBoard_Indate) {
		this.enterpriseBoard_Indate = enterpriseBoard_Indate;
	}

	public int getEnterpriseBoard_HitCount() {
		return enterpriseBoard_HitCount;
	}

	public void setEnterpriseBoard_HitCount(int enterpriseBoard_HitCount) {
		this.enterpriseBoard_HitCount = enterpriseBoard_HitCount;
	}

	public String getEnterpriseBoard_AdminCheck() {
		return enterpriseBoard_AdminCheck;
	}

	public void setEnterpriseBoard_AdminCheck(String enterpriseBoard_AdminCheck) {
		this.enterpriseBoard_AdminCheck = enterpriseBoard_AdminCheck;
	}

	public String getSearchSelect() {
		return searchSelect;
	}

	public void setSearchSelect(String searchSelect) {
		this.searchSelect = searchSelect;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "EnterpriseBoard [enterpriseBoard_Seq=" + enterpriseBoard_Seq + ", enterprise_ID=" + enterprise_ID
				+ ", enterpriseBoard_Title=" + enterpriseBoard_Title + ", enterpriseBoard_Content="
				+ enterpriseBoard_Content + ", enterpriseBoard_Indate=" + enterpriseBoard_Indate
				+ ", enterpriseBoard_HitCount=" + enterpriseBoard_HitCount + ", enterpriseBoard_AdminCheck="
				+ enterpriseBoard_AdminCheck + ", searchSelect=" + searchSelect + ", search=" + search + "]";
	}
	
	
}
