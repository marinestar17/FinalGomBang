package com.project.GomBang.VO;

public class EnterpriseComment {
	private String enterprise_ID;
	private String enterpriseComment_Content;
	private String enterpriseComment_Indate;
	private int enterpriseComment_Seq;
	private int enterpriseBoard_Seq;
	public EnterpriseComment(String enterprise_ID, String enterpriseComment_Content, String enterpriseComment_Indate,
			int enterpriseComment_Seq, int enterpriseBoard_Seq) {
		super();
		this.enterprise_ID = enterprise_ID;
		this.enterpriseComment_Content = enterpriseComment_Content;
		this.enterpriseComment_Indate = enterpriseComment_Indate;
		this.enterpriseComment_Seq = enterpriseComment_Seq;
		this.enterpriseBoard_Seq = enterpriseBoard_Seq;
	}
	public EnterpriseComment() {
		super();
	}
	public String getEnterprise_ID() {
		return enterprise_ID;
	}
	public void setEnterprise_ID(String enterprise_ID) {
		this.enterprise_ID = enterprise_ID;
	}
	public String getEnterpriseComment_Content() {
		return enterpriseComment_Content;
	}
	public void setEnterpriseComment_Content(String enterpriseComment_Content) {
		this.enterpriseComment_Content = enterpriseComment_Content;
	}
	public String getEnterpriseComment_Indate() {
		return enterpriseComment_Indate;
	}
	public void setEnterpriseComment_Indate(String enterpriseComment_Indate) {
		this.enterpriseComment_Indate = enterpriseComment_Indate;
	}
	public int getEnterpriseComment_Seq() {
		return enterpriseComment_Seq;
	}
	public void setEnterpriseComment_Seq(int enterpriseComment_Seq) {
		this.enterpriseComment_Seq = enterpriseComment_Seq;
	}
	public int getEnterpriseBoard_Seq() {
		return enterpriseBoard_Seq;
	}
	public void setEnterpriseBoard_Seq(int enterpriseBoard_Seq) {
		this.enterpriseBoard_Seq = enterpriseBoard_Seq;
	}
	@Override
	public String toString() {
		return "EnterpriseComment [enterprise_ID=" + enterprise_ID + ", enterpriseComment_Content="
				+ enterpriseComment_Content + ", enterpriseComment_Indate=" + enterpriseComment_Indate
				+ ", enterpriseComment_Seq=" + enterpriseComment_Seq + ", enterpriseBoard_Seq=" + enterpriseBoard_Seq
				+ "]";
	}
	
}
