package com.project.GomBang.VO;

public class Bookmark {
	private int bookmark_Seq;
	private String enterprise_ID;
	private String customer_ID;
	private String forSale_Seq;
	private String bookmark_Indate;
	private int stats_Count;
	private String searchSelect;
	private String search;
	
	public Bookmark(int bookmark_Seq, String enterprise_ID, String customer_ID, String forSale_Seq,
			String bookmark_Indate, int stats_Count, String searchSelect, String search) {
		super();
		this.bookmark_Seq = bookmark_Seq;
		this.enterprise_ID = enterprise_ID;
		this.customer_ID = customer_ID;
		this.forSale_Seq = forSale_Seq;
		this.bookmark_Indate = bookmark_Indate;
		this.stats_Count = stats_Count;
		this.searchSelect = searchSelect;
		this.search = search;
	}

	public Bookmark() {
		super();
	}

	public int getBookmark_Seq() {
		return bookmark_Seq;
	}

	public void setBookmark_Seq(int bookmark_Seq) {
		this.bookmark_Seq = bookmark_Seq;
	}

	public String getEnterprise_ID() {
		return enterprise_ID;
	}

	public void setEnterprise_ID(String enterprise_ID) {
		this.enterprise_ID = enterprise_ID;
	}

	public String getCustomer_ID() {
		return customer_ID;
	}

	public void setCustomer_ID(String customer_ID) {
		this.customer_ID = customer_ID;
	}

	public String getForSale_Seq() {
		return forSale_Seq;
	}

	public void setForSale_Seq(String forSale_Seq) {
		this.forSale_Seq = forSale_Seq;
	}

	public String getBookmark_Indate() {
		return bookmark_Indate;
	}

	public void setBookmark_Indate(String bookmark_Indate) {
		this.bookmark_Indate = bookmark_Indate;
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
		return "Bookmark [bookmark_Seq=" + bookmark_Seq + ", enterprise_ID=" + enterprise_ID + ", customer_ID="
				+ customer_ID + ", forSale_Seq=" + forSale_Seq + ", bookmark_Indate=" + bookmark_Indate
				+ ", stats_Count=" + stats_Count + ", searchSelect=" + searchSelect + ", search=" + search + "]";
	}
}
