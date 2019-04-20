package com.project.GomBang.VO;

public class SearchItem {
	private String forSale_Status;
	private String forSale_HouseType;
	private String geoapi_prefectures;
	private String geoapi_cities;
	private String geoapi_towns;
	private int min_distance;
	private int max_distance;
	private int min_price;
	private int max_price;
	private String forSale_OptionA;
	private String forSale_OptionB;
	private String forSale_OptionC;
	private String forSale_OptionD;
	private String forSale_OptionE;
	private String forSale_OptionF;
	
	public SearchItem() {
	
	}

	public SearchItem(String forSale_Status, String forSale_HouseType, String geoapi_prefectures, String geoapi_cities,
			String geoapi_towns, int min_distance, int max_distance, int min_price, int max_price,
			String forSale_OptionA, String forSale_OptionB, String forSale_OptionC, String forSale_OptionD,
			String forSale_OptionE, String forSale_OptionF) {
		super();
		this.forSale_Status = forSale_Status;
		this.forSale_HouseType = forSale_HouseType;
		this.geoapi_prefectures = geoapi_prefectures;
		this.geoapi_cities = geoapi_cities;
		this.geoapi_towns = geoapi_towns;
		this.min_distance = min_distance;
		this.max_distance = max_distance;
		this.min_price = min_price;
		this.max_price = max_price;
		this.forSale_OptionA = forSale_OptionA;
		this.forSale_OptionB = forSale_OptionB;
		this.forSale_OptionC = forSale_OptionC;
		this.forSale_OptionD = forSale_OptionD;
		this.forSale_OptionE = forSale_OptionE;
		this.forSale_OptionF = forSale_OptionF;
	}

	public String getForSale_Status() {
		return forSale_Status;
	}

	public void setForSale_Status(String forSale_Status) {
		this.forSale_Status = forSale_Status;
	}

	public String getForSale_HouseType() {
		return forSale_HouseType;
	}

	public void setForSale_HouseType(String forSale_HouseType) {
		this.forSale_HouseType = forSale_HouseType;
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

	public int getMin_distance() {
		return min_distance;
	}

	public void setMin_distance(int min_distance) {
		this.min_distance = min_distance;
	}

	public int getMax_distance() {
		return max_distance;
	}

	public void setMax_distance(int max_distance) {
		this.max_distance = max_distance;
	}

	public int getMin_price() {
		return min_price;
	}

	public void setMin_price(int min_price) {
		this.min_price = min_price;
	}

	public int getMax_price() {
		return max_price;
	}

	public void setMax_price(int max_price) {
		this.max_price = max_price;
	}

	public String getForSale_OptionA() {
		return forSale_OptionA;
	}

	public void setForSale_OptionA(String forSale_OptionA) {
		this.forSale_OptionA = forSale_OptionA;
	}

	public String getForSale_OptionB() {
		return forSale_OptionB;
	}

	public void setForSale_OptionB(String forSale_OptionB) {
		this.forSale_OptionB = forSale_OptionB;
	}

	public String getForSale_OptionC() {
		return forSale_OptionC;
	}

	public void setForSale_OptionC(String forSale_OptionC) {
		this.forSale_OptionC = forSale_OptionC;
	}

	public String getForSale_OptionD() {
		return forSale_OptionD;
	}

	public void setForSale_OptionD(String forSale_OptionD) {
		this.forSale_OptionD = forSale_OptionD;
	}

	public String getForSale_OptionE() {
		return forSale_OptionE;
	}

	public void setForSale_OptionE(String forSale_OptionE) {
		this.forSale_OptionE = forSale_OptionE;
	}

	public String getForSale_OptionF() {
		return forSale_OptionF;
	}

	public void setForSale_OptionF(String forSale_OptionF) {
		this.forSale_OptionF = forSale_OptionF;
	}

	@Override
	public String toString() {
		return "SearchItem [forSale_Status=" + forSale_Status + ", forSale_HouseType=" + forSale_HouseType
				+ ", geoapi_prefectures=" + geoapi_prefectures + ", geoapi_cities=" + geoapi_cities + ", geoapi_towns="
				+ geoapi_towns + ", min_distance=" + min_distance + ", max_distance=" + max_distance + ", min_price="
				+ min_price + ", max_price=" + max_price + ", forSale_OptionA=" + forSale_OptionA + ", forSale_OptionB="
				+ forSale_OptionB + ", forSale_OptionC=" + forSale_OptionC + ", forSale_OptionD=" + forSale_OptionD
				+ ", forSale_OptionE=" + forSale_OptionE + ", forSale_OptionF=" + forSale_OptionF + "]";
	}

	
	
	
}
