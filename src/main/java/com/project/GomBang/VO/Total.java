package com.project.GomBang.VO;

public class Total {
	private int image_Seq;
	private int forSale_Seq;
	private String customer_ID;
	private String customer_Email;
	private String originName;
	private String saveName;
	private String enterprise_ID;
	private String geoapi_prefectures;
	private String geoapi_cities;
	private String geoapi_towns;
	private String geoapi_remain;
	private String forSale_Title;
	private int forSale_Rent;
	private int forSale_Deposit;
	private int forSale_Reward;
	private int forSale_ManageCost;
	private String forSale_Option;
	private String forSale_ETC;
	private String forSale_Indate;
	private String forSale_PostCode;
	private String forSale_HouseType;
	private String forSale_Status;
	private String bookmark_Seq;
	private String bookmark_Indate;
	private String reservation_Seq;
	private String reservation_Indate;
	private String reservation_Visa;
	private String reservation_Guarantor;
	private String reservation_Complete;
	private double forSale_Lat;
	private double forSale_Lng;
	private String forSale_Trade;
	private int stats_Count;
	public Total(int image_Seq, int forSale_Seq, String customer_ID, String customer_Email, String originName,
			String saveName, String enterprise_ID, String geoapi_prefectures, String geoapi_cities, String geoapi_towns,
			String geoapi_remain, String forSale_Title, int forSale_Rent, int forSale_Deposit, int forSale_Reward,
			int forSale_ManageCost, String forSale_Option, String forSale_ETC, String forSale_Indate,
			String forSale_PostCode, String forSale_HouseType, String forSale_Status, String bookmark_Seq,
			String bookmark_Indate, String reservation_Seq, String reservation_Indate, String reservation_Visa,
			String reservation_Guarantor, String reservation_Complete, double forSale_Lat, double forSale_Lng,
			String forSale_Trade, int stats_Count) {
		super();
		this.image_Seq = image_Seq;
		this.forSale_Seq = forSale_Seq;
		this.customer_ID = customer_ID;
		this.customer_Email = customer_Email;
		this.originName = originName;
		this.saveName = saveName;
		this.enterprise_ID = enterprise_ID;
		this.geoapi_prefectures = geoapi_prefectures;
		this.geoapi_cities = geoapi_cities;
		this.geoapi_towns = geoapi_towns;
		this.geoapi_remain = geoapi_remain;
		this.forSale_Title = forSale_Title;
		this.forSale_Rent = forSale_Rent;
		this.forSale_Deposit = forSale_Deposit;
		this.forSale_Reward = forSale_Reward;
		this.forSale_ManageCost = forSale_ManageCost;
		this.forSale_Option = forSale_Option;
		this.forSale_ETC = forSale_ETC;
		this.forSale_Indate = forSale_Indate;
		this.forSale_PostCode = forSale_PostCode;
		this.forSale_HouseType = forSale_HouseType;
		this.forSale_Status = forSale_Status;
		this.bookmark_Seq = bookmark_Seq;
		this.bookmark_Indate = bookmark_Indate;
		this.reservation_Seq = reservation_Seq;
		this.reservation_Indate = reservation_Indate;
		this.reservation_Visa = reservation_Visa;
		this.reservation_Guarantor = reservation_Guarantor;
		this.reservation_Complete = reservation_Complete;
		this.forSale_Lat = forSale_Lat;
		this.forSale_Lng = forSale_Lng;
		this.forSale_Trade = forSale_Trade;
		this.stats_Count = stats_Count;
	}
	public Total() {
		super();
	}
	public int getImage_Seq() {
		return image_Seq;
	}
	public void setImage_Seq(int image_Seq) {
		this.image_Seq = image_Seq;
	}
	public int getForSale_Seq() {
		return forSale_Seq;
	}
	public void setForSale_Seq(int forSale_Seq) {
		this.forSale_Seq = forSale_Seq;
	}
	public String getCustomer_ID() {
		return customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		this.customer_ID = customer_ID;
	}
	public String getCustomer_Email() {
		return customer_Email;
	}
	public void setCustomer_Email(String customer_Email) {
		this.customer_Email = customer_Email;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getEnterprise_ID() {
		return enterprise_ID;
	}
	public void setEnterprise_ID(String enterprise_ID) {
		this.enterprise_ID = enterprise_ID;
	}
	public String getGeoapi_prefectures() {
		return geoapi_prefectures;
	}
	public void setGeoapi_prefectures(String geoapi_prefectures) {
		this.geoapi_prefectures = geoapi_prefectures;
	}
	public String getGeoapi_cities() {
		return geoapi_cities;
	}
	public void setGeoapi_cities(String geoapi_cities) {
		this.geoapi_cities = geoapi_cities;
	}
	public String getGeoapi_towns() {
		return geoapi_towns;
	}
	public void setGeoapi_towns(String geoapi_towns) {
		this.geoapi_towns = geoapi_towns;
	}
	public String getGeoapi_remain() {
		return geoapi_remain;
	}
	public void setGeoapi_remain(String geoapi_remain) {
		this.geoapi_remain = geoapi_remain;
	}
	public String getForSale_Title() {
		return forSale_Title;
	}
	public void setForSale_Title(String forSale_Title) {
		this.forSale_Title = forSale_Title;
	}
	public int getForSale_Rent() {
		return forSale_Rent;
	}
	public void setForSale_Rent(int forSale_Rent) {
		this.forSale_Rent = forSale_Rent;
	}
	public int getForSale_Deposit() {
		return forSale_Deposit;
	}
	public void setForSale_Deposit(int forSale_Deposit) {
		this.forSale_Deposit = forSale_Deposit;
	}
	public int getForSale_Reward() {
		return forSale_Reward;
	}
	public void setForSale_Reward(int forSale_Reward) {
		this.forSale_Reward = forSale_Reward;
	}
	public int getForSale_ManageCost() {
		return forSale_ManageCost;
	}
	public void setForSale_ManageCost(int forSale_ManageCost) {
		this.forSale_ManageCost = forSale_ManageCost;
	}
	public String getForSale_Option() {
		return forSale_Option;
	}
	public void setForSale_Option(String forSale_Option) {
		this.forSale_Option = forSale_Option;
	}
	public String getForSale_ETC() {
		return forSale_ETC;
	}
	public void setForSale_ETC(String forSale_ETC) {
		this.forSale_ETC = forSale_ETC;
	}
	public String getForSale_Indate() {
		return forSale_Indate;
	}
	public void setForSale_Indate(String forSale_Indate) {
		this.forSale_Indate = forSale_Indate;
	}
	public String getForSale_PostCode() {
		return forSale_PostCode;
	}
	public void setForSale_PostCode(String forSale_PostCode) {
		this.forSale_PostCode = forSale_PostCode;
	}
	public String getForSale_HouseType() {
		return forSale_HouseType;
	}
	public void setForSale_HouseType(String forSale_HouseType) {
		this.forSale_HouseType = forSale_HouseType;
	}
	public String getForSale_Status() {
		return forSale_Status;
	}
	public void setForSale_Status(String forSale_Status) {
		this.forSale_Status = forSale_Status;
	}
	public String getBookmark_Seq() {
		return bookmark_Seq;
	}
	public void setBookmark_Seq(String bookmark_Seq) {
		this.bookmark_Seq = bookmark_Seq;
	}
	public String getBookmark_Indate() {
		return bookmark_Indate;
	}
	public void setBookmark_Indate(String bookmark_Indate) {
		this.bookmark_Indate = bookmark_Indate;
	}
	public String getReservation_Seq() {
		return reservation_Seq;
	}
	public void setReservation_Seq(String reservation_Seq) {
		this.reservation_Seq = reservation_Seq;
	}
	public String getReservation_Indate() {
		return reservation_Indate;
	}
	public void setReservation_Indate(String reservation_Indate) {
		this.reservation_Indate = reservation_Indate;
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
	public String getReservation_Complete() {
		return reservation_Complete;
	}
	public void setReservation_Complete(String reservation_Complete) {
		this.reservation_Complete = reservation_Complete;
	}
	public double getForSale_Lat() {
		return forSale_Lat;
	}
	public void setForSale_Lat(double forSale_Lat) {
		this.forSale_Lat = forSale_Lat;
	}
	public double getForSale_Lng() {
		return forSale_Lng;
	}
	public void setForSale_Lng(double forSale_Lng) {
		this.forSale_Lng = forSale_Lng;
	}
	public String getForSale_Trade() {
		return forSale_Trade;
	}
	public void setForSale_Trade(String forSale_Trade) {
		this.forSale_Trade = forSale_Trade;
	}
	public int getStats_Count() {
		return stats_Count;
	}
	public void setStats_Count(int stats_Count) {
		this.stats_Count = stats_Count;
	}
	@Override
	public String toString() {
		return "Total [image_Seq=" + image_Seq + ", forSale_Seq=" + forSale_Seq + ", customer_ID=" + customer_ID
				+ ", customer_Email=" + customer_Email + ", originName=" + originName + ", saveName=" + saveName
				+ ", enterprise_ID=" + enterprise_ID + ", geoapi_prefectures=" + geoapi_prefectures + ", geoapi_cities="
				+ geoapi_cities + ", geoapi_towns=" + geoapi_towns + ", geoapi_remain=" + geoapi_remain
				+ ", forSale_Title=" + forSale_Title + ", forSale_Rent=" + forSale_Rent + ", forSale_Deposit="
				+ forSale_Deposit + ", forSale_Reward=" + forSale_Reward + ", forSale_ManageCost=" + forSale_ManageCost
				+ ", forSale_Option=" + forSale_Option + ", forSale_ETC=" + forSale_ETC + ", forSale_Indate="
				+ forSale_Indate + ", forSale_PostCode=" + forSale_PostCode + ", forSale_HouseType=" + forSale_HouseType
				+ ", forSale_Status=" + forSale_Status + ", bookmark_Seq=" + bookmark_Seq + ", bookmark_Indate="
				+ bookmark_Indate + ", reservation_Seq=" + reservation_Seq + ", reservation_Indate="
				+ reservation_Indate + ", reservation_Visa=" + reservation_Visa + ", reservation_Guarantor="
				+ reservation_Guarantor + ", reservation_Complete=" + reservation_Complete + ", forSale_Lat="
				+ forSale_Lat + ", forSale_Lng=" + forSale_Lng + ", forSale_Trade=" + forSale_Trade + ", stats_Count="
				+ stats_Count + "]";
	}
	
}
