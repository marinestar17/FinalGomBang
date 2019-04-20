package com.project.GomBang.VO;

public class Admin {
	private String admin_ID;
	private String admin_PW;
	private String admin_Name;
	private String admin_Phone;
	private String admin_Email;
	private String admin_Department;
	private String admin_Title;
	
	public Admin(String admin_ID, String admin_PW, String admin_Name, String admin_Phone, String admin_Email,
			String admin_Department, String admin_Title) {
		super();
		this.admin_ID = admin_ID;
		this.admin_PW = admin_PW;
		this.admin_Name = admin_Name;
		this.admin_Phone = admin_Phone;
		this.admin_Email = admin_Email;
		this.admin_Department = admin_Department;
		this.admin_Title = admin_Title;
	}

	public Admin() {
		super();
	}

	public String getAdmin_ID() {
		return admin_ID;
	}

	public void setAdmin_ID(String admin_ID) {
		this.admin_ID = admin_ID;
	}

	public String getAdmin_PW() {
		return admin_PW;
	}

	public void setAdmin_PW(String admin_PW) {
		this.admin_PW = admin_PW;
	}

	public String getAdmin_Name() {
		return admin_Name;
	}

	public void setAdmin_Name(String admin_Name) {
		this.admin_Name = admin_Name;
	}

	public String getAdmin_Phone() {
		return admin_Phone;
	}

	public void setAdmin_Phone(String admin_Phone) {
		this.admin_Phone = admin_Phone;
	}

	public String getAdmin_Email() {
		return admin_Email;
	}

	public void setAdmin_Email(String admin_Email) {
		this.admin_Email = admin_Email;
	}

	public String getAdmin_Department() {
		return admin_Department;
	}

	public void setAdmin_Department(String admin_Department) {
		this.admin_Department = admin_Department;
	}

	public String getAdmin_Title() {
		return admin_Title;
	}

	public void setAdmin_Title(String admin_Title) {
		this.admin_Title = admin_Title;
	}

	@Override
	public String toString() {
		return "Admin [admin_ID=" + admin_ID + ", admin_PW=" + admin_PW + ", admin_Name=" + admin_Name
				+ ", admin_Phone=" + admin_Phone + ", admin_Email=" + admin_Email + ", admin_Department="
				+ admin_Department + ", admin_Title=" + admin_Title + "]";
	}
	
}
