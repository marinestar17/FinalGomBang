package com.project.GomBang.VO;

public class Enterprise {
	
    private String enterprise_ID;
	private String enterprise_PW;
	private String enterprise_Name;
	private String enterprise_Address;
	private String enterprise_RegiNum;
	private String enterprise_ManagerName;
	private String enterprise_ManagerPhone;
	private String enterprise_ETC;
	private String enterprise_Code;
	private String enterprise_ManagerEmail;
	private String enterprise_Indate;
	private int stats_Count;
	private String searchSelect;
	private String search;
	private String enterprise_Permission;
	
	public Enterprise(String enterprise_ID, String enterprise_PW, String enterprise_Name, String enterprise_Address,
			String enterprise_RegiNum, String enterprise_ManagerName, String enterprise_ManagerPhone,
			String enterprise_ETC, String enterprise_Code, String enterprise_ManagerEmail, String enterprise_Indate,
			int stats_Count, String searchSelect, String search, String enterprise_Permission) {
		super();
		this.enterprise_ID = enterprise_ID;
		this.enterprise_PW = enterprise_PW;
		this.enterprise_Name = enterprise_Name;
		this.enterprise_Address = enterprise_Address;
		this.enterprise_RegiNum = enterprise_RegiNum;
		this.enterprise_ManagerName = enterprise_ManagerName;
		this.enterprise_ManagerPhone = enterprise_ManagerPhone;
		this.enterprise_ETC = enterprise_ETC;
		this.enterprise_Code = enterprise_Code;
		this.enterprise_ManagerEmail = enterprise_ManagerEmail;
		this.enterprise_Indate = enterprise_Indate;
		this.stats_Count = stats_Count;
		this.searchSelect = searchSelect;
		this.search = search;
		this.enterprise_Permission = enterprise_Permission;
	}

	public Enterprise() {
		super();
	}

	public String getEnterprise_ID() {
		return enterprise_ID;
	}

	public void setEnterprise_ID(String enterprise_ID) {
		this.enterprise_ID = enterprise_ID;
	}

	public String getEnterprise_PW() {
		return enterprise_PW;
	}

	public void setEnterprise_PW(String enterprise_PW) {
		this.enterprise_PW = enterprise_PW;
	}

	public String getEnterprise_Name() {
		return enterprise_Name;
	}

	public void setEnterprise_Name(String enterprise_Name) {
		this.enterprise_Name = enterprise_Name;
	}

	public String getEnterprise_Address() {
		return enterprise_Address;
	}

	public void setEnterprise_Address(String enterprise_Address) {
		this.enterprise_Address = enterprise_Address;
	}

	public String getEnterprise_RegiNum() {
		return enterprise_RegiNum;
	}

	public void setEnterprise_RegiNum(String enterprise_RegiNum) {
		this.enterprise_RegiNum = enterprise_RegiNum;
	}

	public String getEnterprise_ManagerName() {
		return enterprise_ManagerName;
	}

	public void setEnterprise_ManagerName(String enterprise_ManagerName) {
		this.enterprise_ManagerName = enterprise_ManagerName;
	}

	public String getEnterprise_ManagerPhone() {
		return enterprise_ManagerPhone;
	}

	public void setEnterprise_ManagerPhone(String enterprise_ManagerPhone) {
		this.enterprise_ManagerPhone = enterprise_ManagerPhone;
	}

	public String getEnterprise_ETC() {
		return enterprise_ETC;
	}

	public void setEnterprise_ETC(String enterprise_ETC) {
		this.enterprise_ETC = enterprise_ETC;
	}

	public String getEnterprise_Code() {
		return enterprise_Code;
	}

	public void setEnterprise_Code(String enterprise_Code) {
		this.enterprise_Code = enterprise_Code;
	}

	public String getEnterprise_ManagerEmail() {
		return enterprise_ManagerEmail;
	}

	public void setEnterprise_ManagerEmail(String enterprise_ManagerEmail) {
		this.enterprise_ManagerEmail = enterprise_ManagerEmail;
	}

	public String getEnterprise_Indate() {
		return enterprise_Indate;
	}

	public void setEnterprise_Indate(String enterprise_Indate) {
		this.enterprise_Indate = enterprise_Indate;
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

	public String getEnterprise_Permission() {
		return enterprise_Permission;
	}

	public void setEnterprise_Permission(String enterprise_Permission) {
		this.enterprise_Permission = enterprise_Permission;
	}

	@Override
	public String toString() {
		return "Enterprise [enterprise_ID=" + enterprise_ID + ", enterprise_PW=" + enterprise_PW + ", enterprise_Name="
				+ enterprise_Name + ", enterprise_Address=" + enterprise_Address + ", enterprise_RegiNum="
				+ enterprise_RegiNum + ", enterprise_ManagerName=" + enterprise_ManagerName
				+ ", enterprise_ManagerPhone=" + enterprise_ManagerPhone + ", enterprise_ETC=" + enterprise_ETC
				+ ", enterprise_Code=" + enterprise_Code + ", enterprise_ManagerEmail=" + enterprise_ManagerEmail
				+ ", enterprise_Indate=" + enterprise_Indate + ", stats_Count=" + stats_Count + ", searchSelect="
				+ searchSelect + ", search=" + search + ", enterprise_Permission=" + enterprise_Permission + "]";
	}
	
}
