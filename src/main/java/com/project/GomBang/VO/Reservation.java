package com.project.GomBang.VO;

public class Reservation {
	private int reservation_Seq;
	private String enterprise_ID;
	private String customer_ID;
	private String forSale_Seq;
	private String reservation_Visa;
	private String reservation_Guarantor;
	private String reservation_Indate;
	private String reservation_Complete;
	private int stats_Count;
	private String searchSelect;
	private String search;
	
	public Reservation(int reservation_Seq, String enterprise_ID, String customer_ID, String forSale_Seq,
			String reservation_Visa, String reservation_Guarantor, String reservation_Indate,
			String reservation_Complete, int stats_Count, String searchSelect, String search) {
		super();
		this.reservation_Seq = reservation_Seq;
		this.enterprise_ID = enterprise_ID;
		this.customer_ID = customer_ID;
		this.forSale_Seq = forSale_Seq;
		this.reservation_Visa = reservation_Visa;
		this.reservation_Guarantor = reservation_Guarantor;
		this.reservation_Indate = reservation_Indate;
		this.reservation_Complete = reservation_Complete;
		this.stats_Count = stats_Count;
		this.searchSelect = searchSelect;
		this.search = search;
	}

	public Reservation() {
		super();
	}

	public int getReservation_Seq() {
		return reservation_Seq;
	}

	public void setReservation_Seq(int reservation_Seq) {
		this.reservation_Seq = reservation_Seq;
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

	public String getReservation_Visa() {
		return reservation_Visa;
	}

	public void setReservation_Visa(String reservation_Visa) {
		this.reservation_Visa = reservation_Visa;
	}

	public String getReservation_Guarantor() {
		return reservation_Guarantor;
	}

	public void setReservation_Guarantor(String reservation_Guarantor) {
		this.reservation_Guarantor = reservation_Guarantor;
	}

	public String getReservation_Indate() {
		return reservation_Indate;
	}

	public void setReservation_Indate(String reservation_Indate) {
		this.reservation_Indate = reservation_Indate;
	}

	public String getReservation_Complete() {
		return reservation_Complete;
	}

	public void setReservation_Complete(String reservation_Complete) {
		this.reservation_Complete = reservation_Complete;
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
		return "Reservation [reservation_Seq=" + reservation_Seq + ", enterprise_ID=" + enterprise_ID + ", customer_ID="
				+ customer_ID + ", forSale_Seq=" + forSale_Seq + ", reservation_Visa=" + reservation_Visa
				+ ", reservation_Guarantor=" + reservation_Guarantor + ", reservation_Indate=" + reservation_Indate
				+ ", reservation_Complete=" + reservation_Complete + ", stats_Count=" + stats_Count + ", searchSelect="
				+ searchSelect + ", search=" + search + "]";
	}
	
	
}
