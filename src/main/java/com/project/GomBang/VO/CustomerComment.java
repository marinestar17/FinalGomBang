package com.project.GomBang.VO;

public class CustomerComment {
	private String customer_ID;
	private String customerComment_Content;
	private String customerComment_Indate;
	private int customerComment_Seq;
	private int customerBoard_Seq;
	public CustomerComment(String customer_ID, String customerComment_Content, String customerComment_Indate,
			int customerComment_Seq, int customerBoard_Seq) {
		super();
		this.customer_ID = customer_ID;
		this.customerComment_Content = customerComment_Content;
		this.customerComment_Indate = customerComment_Indate;
		this.customerComment_Seq = customerComment_Seq;
		this.customerBoard_Seq = customerBoard_Seq;
	}
	public CustomerComment() {
		super();
	}
	public String getCustomer_ID() {
		return customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		this.customer_ID = customer_ID;
	}
	public String getCustomerComment_Content() {
		return customerComment_Content;
	}
	public void setCustomerComment_Content(String customerComment_Content) {
		this.customerComment_Content = customerComment_Content;
	}
	public String getCustomerComment_Indate() {
		return customerComment_Indate;
	}
	public void setCustomerComment_Indate(String customerComment_Indate) {
		this.customerComment_Indate = customerComment_Indate;
	}
	public int getCustomerComment_Seq() {
		return customerComment_Seq;
	}
	public void setCustomerComment_Seq(int customerComment_Seq) {
		this.customerComment_Seq = customerComment_Seq;
	}
	public int getCustomerBoard_Seq() {
		return customerBoard_Seq;
	}
	public void setCustomerBoard_Seq(int customerBoard_Seq) {
		this.customerBoard_Seq = customerBoard_Seq;
	}
	@Override
	public String toString() {
		return "CustomerComment [customer_ID=" + customer_ID + ", customerComment_Content=" + customerComment_Content
				+ ", customerComment_Indate=" + customerComment_Indate + ", customerComment_Seq=" + customerComment_Seq
				+ ", customerBoard_Seq=" + customerBoard_Seq + "]";
	}
	
}
