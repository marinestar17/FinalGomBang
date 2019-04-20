package com.project.GomBang.VO;

public class Item {
	private int forSale_Seq;
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
	private double forSale_Lat;
	private double forSale_Lng;
	private String forSale_Subway;
	private int forSale_SubwayDistance;
	private String forSale_SubwayDistance2;
	private int forSale_HitCount;
	private String searchSelect;
	private String search;
	private int stats_Count;
	private String forSale_Trade;
	public Item(int forSale_Seq, String enterprise_ID, String geoapi_prefectures, String geoapi_cities,
			String geoapi_towns, String geoapi_remain, String forSale_Title, int forSale_Rent, int forSale_Deposit,
			int forSale_Reward, int forSale_ManageCost, String forSale_Option, String forSale_ETC,
			String forSale_Indate, String forSale_PostCode, String forSale_HouseType, String forSale_Status,
			double forSale_Lat, double forSale_Lng, String forSale_Subway, int forSale_SubwayDistance,
			String forSale_SubwayDistance2, int forSale_HitCount, String searchSelect, String search, int stats_Count,
			String forSale_Trade) {
		super();
		this.forSale_Seq = forSale_Seq;
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
		this.forSale_Lat = forSale_Lat;
		this.forSale_Lng = forSale_Lng;
		this.forSale_Subway = forSale_Subway;
		this.forSale_SubwayDistance = forSale_SubwayDistance;
		this.forSale_SubwayDistance2 = forSale_SubwayDistance2;
		this.forSale_HitCount = forSale_HitCount;
		this.searchSelect = searchSelect;
		this.search = search;
		this.stats_Count = stats_Count;
		this.forSale_Trade = forSale_Trade;
	}
	public Item() {
		super();
	}
	public int getForSale_Seq() {
		return forSale_Seq;
	}
	public void setForSale_Seq(int forSale_Seq) {
		this.forSale_Seq = forSale_Seq;
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
	public String getForSale_Subway() {
		return forSale_Subway;
	}
	public void setForSale_Subway(String forSale_Subway) {
		this.forSale_Subway = forSale_Subway;
	}
	public int getForSale_SubwayDistance() {
		return forSale_SubwayDistance;
	}
	public void setForSale_SubwayDistance(int forSale_SubwayDistance) {
		this.forSale_SubwayDistance = forSale_SubwayDistance;
	}
	public String getForSale_SubwayDistance2() {
		return forSale_SubwayDistance2;
	}
	public void setForSale_SubwayDistance2(String forSale_SubwayDistance2) {
		this.forSale_SubwayDistance2 = forSale_SubwayDistance2;
	}
	public int getForSale_HitCount() {
		return forSale_HitCount;
	}
	public void setForSale_HitCount(int forSale_HitCount) {
		this.forSale_HitCount = forSale_HitCount;
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
	public int getStats_Count() {
		return stats_Count;
	}
	public void setStats_Count(int stats_Count) {
		this.stats_Count = stats_Count;
	}
	public String getForSale_Trade() {
		return forSale_Trade;
	}
	public void setForSale_Trade(String forSale_Trade) {
		this.forSale_Trade = forSale_Trade;
	}
	@Override
	public String toString() {
		return "Item [forSale_Seq=" + forSale_Seq + ", enterprise_ID=" + enterprise_ID + ", geoapi_prefectures="
				+ geoapi_prefectures + ", geoapi_cities=" + geoapi_cities + ", geoapi_towns=" + geoapi_towns
				+ ", geoapi_remain=" + geoapi_remain + ", forSale_Title=" + forSale_Title + ", forSale_Rent="
				+ forSale_Rent + ", forSale_Deposit=" + forSale_Deposit + ", forSale_Reward=" + forSale_Reward
				+ ", forSale_ManageCost=" + forSale_ManageCost + ", forSale_Option=" + forSale_Option + ", forSale_ETC="
				+ forSale_ETC + ", forSale_Indate=" + forSale_Indate + ", forSale_PostCode=" + forSale_PostCode
				+ ", forSale_HouseType=" + forSale_HouseType + ", forSale_Status=" + forSale_Status + ", forSale_Lat="
				+ forSale_Lat + ", forSale_Lng=" + forSale_Lng + ", forSale_Subway=" + forSale_Subway
				+ ", forSale_SubwayDistance=" + forSale_SubwayDistance + ", forSale_SubwayDistance2="
				+ forSale_SubwayDistance2 + ", forSale_HitCount=" + forSale_HitCount + ", searchSelect=" + searchSelect
				+ ", search=" + search + ", stats_Count=" + stats_Count + ", forSale_Trade=" + forSale_Trade + "]";
	}
	
	
	
}
