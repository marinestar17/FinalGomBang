package com.project.GomBang.VO;

public class AdminTODO {
	private int adminTodo_Seq;
	private String admin_ID;
	private String adminTodo_Content;
	private String adminTodo_Indate;
	
	public AdminTODO(int adminTodo_Seq, String admin_ID, String adminTodo_Content, String adminTodo_Indate) {
		super();
		this.adminTodo_Seq = adminTodo_Seq;
		this.admin_ID = admin_ID;
		this.adminTodo_Content = adminTodo_Content;
		this.adminTodo_Indate = adminTodo_Indate;
	}

	public AdminTODO() {
		super();
	}

	public int getAdminTodo_Seq() {
		return adminTodo_Seq;
	}

	public void setAdminTodo_Seq(int adminTodo_Seq) {
		this.adminTodo_Seq = adminTodo_Seq;
	}

	public String getAdmin_ID() {
		return admin_ID;
	}

	public void setAdmin_ID(String admin_ID) {
		this.admin_ID = admin_ID;
	}

	public String getAdminTodo_Content() {
		return adminTodo_Content;
	}

	public void setAdminTodo_Content(String adminTodo_Content) {
		this.adminTodo_Content = adminTodo_Content;
	}

	public String getAdminTodo_Indate() {
		return adminTodo_Indate;
	}

	public void setAdminTodo_Indate(String adminTodo_Indate) {
		this.adminTodo_Indate = adminTodo_Indate;
	}

	@Override
	public String toString() {
		return "AdminTODO [adminTodo_Seq=" + adminTodo_Seq + ", admin_ID=" + admin_ID + ", adminTodo_Content="
				+ adminTodo_Content + ", adminTodo_Indate=" + adminTodo_Indate + "]";
	}
	
}
