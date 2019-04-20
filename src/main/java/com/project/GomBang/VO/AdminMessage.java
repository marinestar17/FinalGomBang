package com.project.GomBang.VO;

import java.util.Date;

public class AdminMessage {
	private int adminMessage_Seq;
	private String admin_ID;
	private String admin_Name;
	private String adminMessage_Content;
	private String adminMessage_Indate;
	private String searchSelect;
	private String search;
	
	public AdminMessage(int adminMessage_Seq, String admin_ID, String admin_Name, String adminMessage_Content,
			String adminMessage_Indate, String searchSelect, String search) {
		super();
		this.adminMessage_Seq = adminMessage_Seq;
		this.admin_ID = admin_ID;
		this.admin_Name = admin_Name;
		this.adminMessage_Content = adminMessage_Content;
		this.adminMessage_Indate = adminMessage_Indate;
		this.searchSelect = searchSelect;
		this.search = search;
	}

	public AdminMessage() {
		super();
	}

	public int getAdminMessage_Seq() {
		return adminMessage_Seq;
	}

	public void setAdminMessage_Seq(int adminMessage_Seq) {
		this.adminMessage_Seq = adminMessage_Seq;
	}

	public String getAdmin_ID() {
		return admin_ID;
	}

	public void setAdmin_ID(String admin_ID) {
		this.admin_ID = admin_ID;
	}

	public String getAdmin_Name() {
		return admin_Name;
	}

	public void setAdmin_Name(String admin_Name) {
		this.admin_Name = admin_Name;
	}

	public String getAdminMessage_Content() {
		return adminMessage_Content;
	}

	public void setAdminMessage_Content(String adminMessage_Content) {
		this.adminMessage_Content = adminMessage_Content;
	}

	public String getAdminMessage_Indate() {
		return adminMessage_Indate;
	}

	public void setAdminMessage_Indate(String adminMessage_Indate) {
		this.adminMessage_Indate = adminMessage_Indate;
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
		return "AdminMessage [adminMessage_Seq=" + adminMessage_Seq + ", admin_ID=" + admin_ID + ", admin_Name="
				+ admin_Name + ", adminMessage_Content=" + adminMessage_Content + ", adminMessage_Indate="
				+ adminMessage_Indate + ", searchSelect=" + searchSelect + ", search=" + search + "]";
	}
	
}
