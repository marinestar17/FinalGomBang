package com.project.GomBang.VO;

public class Customer {
	private String customer_ID; 
	private String customer_PW; 
	private String customer_Name;
	private String customer_Address; // 안씀
	private String customer_Birthdate;
	private String customer_Nickname; // 안씀
	private String customer_Phone;
	private String customer_Gender;
	private String customer_Email;
	private String customer_Indate;
	private int stats_Count;
	private String searchSelect;
	private String search;
	
	public Customer(String customer_ID, String customer_PW, String customer_Name, String customer_Address,
			String customer_Birthdate, String customer_Nickname, String customer_Phone, String customer_Gender,
			String customer_Email, String customer_Indate, int stats_Count, String searchSelect, String search) {
		super();
		this.customer_ID = customer_ID;
		this.customer_PW = customer_PW;
		this.customer_Name = customer_Name;
		this.customer_Address = customer_Address;
		this.customer_Birthdate = customer_Birthdate;
		this.customer_Nickname = customer_Nickname;
		this.customer_Phone = customer_Phone;
		this.customer_Gender = customer_Gender;
		this.customer_Email = customer_Email;
		this.customer_Indate = customer_Indate;
		this.stats_Count = stats_Count;
		this.searchSelect = searchSelect;
		this.search = search;
	}

	public Customer() {
		super();
	}

	public String getCustomer_ID() {
		return customer_ID;
	}

	public void setCustomer_ID(String customer_ID) {
		this.customer_ID = customer_ID;
	}

	public String getCustomer_PW() {
		return customer_PW;
	}

	public void setCustomer_PW(String customer_PW) {
		this.customer_PW = customer_PW;
	}

	public String getCustomer_Name() {
		return customer_Name;
	}

	public void setCustomer_Name(String customer_Name) {
		this.customer_Name = customer_Name;
	}

	public String getCustomer_Address() {
		return customer_Address;
	}

	public void setCustomer_Address(String customer_Address) {
		this.customer_Address = customer_Address;
	}

	public String getCustomer_Birthdate() {
		return customer_Birthdate;
	}

	public void setCustomer_Birthdate(String customer_Birthdate) {
		this.customer_Birthdate = customer_Birthdate;
	}

	public String getCustomer_Nickname() {
		return customer_Nickname;
	}

	public void setCustomer_Nickname(String customer_Nickname) {
		this.customer_Nickname = customer_Nickname;
	}

	public String getCustomer_Phone() {
		return customer_Phone;
	}

	public void setCustomer_Phone(String customer_Phone) {
		this.customer_Phone = customer_Phone;
	}

	public String getCustomer_Gender() {
		return customer_Gender;
	}

	public void setCustomer_Gender(String customer_Gender) {
		this.customer_Gender = customer_Gender;
	}

	public String getCustomer_Email() {
		return customer_Email;
	}

	public void setCustomer_Email(String customer_Email) {
		this.customer_Email = customer_Email;
	}

	public String getCustomer_Indate() {
		return customer_Indate;
	}

	public void setCustomer_Indate(String customer_Indate) {
		this.customer_Indate = customer_Indate;
	}

	public int getStats_Count() {
		return stats_Count;
	}

	public void setStats_Count(int stats_Count) {
		this.stats_Count = stats_Count;
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
		return "Customer [customer_ID=" + customer_ID + ", customer_PW=" + customer_PW + ", customer_Name="
				+ customer_Name + ", customer_Address=" + customer_Address + ", customer_Birthdate="
				+ customer_Birthdate + ", customer_Nickname=" + customer_Nickname + ", customer_Phone=" + customer_Phone
				+ ", customer_Gender=" + customer_Gender + ", customer_Email=" + customer_Email + ", customer_Indate="
				+ customer_Indate + ", stats_Count=" + stats_Count + ", searchSelect=" + searchSelect + ", search="
				+ search + "]";
	}
	
}
