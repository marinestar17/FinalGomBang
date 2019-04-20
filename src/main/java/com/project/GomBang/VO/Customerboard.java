package com.project.GomBang.VO;

public class Customerboard {
	/*private String forSale_Address;*/
	/*private int forSale_Rent;*/
	/*private int forSale_Deposit;*/
	/*private int forSale_Reward;*/
	/*private String forSale_Option;*/
	/*private String forSale_PostCode;*/
	private int customerBoard_Seq;
	private String customer_ID;
	private String customerBoard_Title;
	private String customerBoard_Content;
	private String customerBoard_Indate;
	private String customerBoard_Tag;
	private int customerBoard_Hitcount;
	private String searchSelect;
	private String search;
	
	public Customerboard() {
		super();
	}

	public Customerboard(int customerBoard_Seq, String customer_ID, String customerBoard_Title,
			String customerBoard_Content, String customerBoard_Indate, String customerBoard_Tag,
			int customerBoard_Hitcount, String searchSelect, String search) {
		super();
		this.customerBoard_Seq = customerBoard_Seq;
		this.customer_ID = customer_ID;
		this.customerBoard_Title = customerBoard_Title;
		this.customerBoard_Content = customerBoard_Content;
		this.customerBoard_Indate = customerBoard_Indate;
		this.customerBoard_Tag = customerBoard_Tag;
		this.customerBoard_Hitcount = customerBoard_Hitcount;
		this.searchSelect = searchSelect;
		this.search = search;
	}

	public int getCustomerBoard_Seq() {
		return customerBoard_Seq;
	}

	public void setCustomerBoard_Seq(int customerBoard_Seq) {
		this.customerBoard_Seq = customerBoard_Seq;
	}

	public String getCustomer_ID() {
		return customer_ID;
	}

	public void setCustomer_ID(String customer_ID) {
		this.customer_ID = customer_ID;
	}

	public String getCustomerBoard_Title() {
		return customerBoard_Title;
	}

	public void setCustomerBoard_Title(String customerBoard_Title) {
		this.customerBoard_Title = customerBoard_Title;
	}

	public String getCustomerBoard_Content() {
		return customerBoard_Content;
	}

	public void setCustomerBoard_Content(String customerBoard_Content) {
		this.customerBoard_Content = customerBoard_Content;
	}

	public String getCustomerBoard_Indate() {
		return customerBoard_Indate;
	}

	public void setCustomerBoard_Indate(String customerBoard_Indate) {
		this.customerBoard_Indate = customerBoard_Indate;
	}

	public String getCustomerBoard_Tag() {
		return customerBoard_Tag;
	}

	public void setCustomerBoard_Tag(String customerBoard_Tag) {
		this.customerBoard_Tag = customerBoard_Tag;
	}

	public int getCustomerBoard_Hitcount() {
		return customerBoard_Hitcount;
	}

	public void setCustomerBoard_Hitcount(int customerBoard_Hitcount) {
		this.customerBoard_Hitcount = customerBoard_Hitcount;
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
		return "Customerboard [customerBoard_Seq=" + customerBoard_Seq + ", customer_ID=" + customer_ID
				+ ", customerBoard_Title=" + customerBoard_Title + ", customerBoard_Content=" + customerBoard_Content
				+ ", customerBoard_Indate=" + customerBoard_Indate + ", customerBoard_Tag=" + customerBoard_Tag
				+ ", customerBoard_Hitcount=" + customerBoard_Hitcount + ", searchSelect=" + searchSelect + ", search="
				+ search + "]";
	}
	
	
}
