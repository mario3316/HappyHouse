package com.ssafy.happyhouse.model;

public class HouseViewDto {
	public static String APT_DEAL = "아파트 매매";
	public static String APT_RENT = "아파트 전월세";
	public static String HOUSE_DEAL = "연립,주택 매매";
	public static String HOUSE_RENT = "연립,주택 전월세";

	// 식별 번호
	private int no;
	// 법정동
	private String dong;
	// 아파트 이름
	private String aptName;
	// 법정동 코드
	private String code;
	// 거래금액
	private String dealAmount;
	// 건축 연도
	private String buildYear;
	// 거래 연도
	private String dealYear;
	// 거래 월
	private String dealMonth;
	// 거래 일
	private String dealDay;
	// 전용 면적
	private String area;
	// 층수
	private String floor;

	// 지번
	private String jibun;

	/**
	 * type 1 : 아파트 매매 2 : 연립 다세세 매매 3 : 아파트 전월세 4 : 연립 다세세 전월세
	 */
	private String type;

	// 가격
	private String rentMoney;

	// 이미지 경로
	private String img;

	private String lat;
	private String lng;

	public HouseViewDto(int no, String dong, String aptName, String code, String dealAmount, String buildYear,
			String dealYear, String dealMonth, String dealDay, String area, String floor, String jibun, String type,
			String rentMoney, String img, String lat, String lng) {
		super();
		this.no = no;
		this.dong = dong;
		this.aptName = aptName;
		this.code = code;
		this.dealAmount = dealAmount;
		this.buildYear = buildYear;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.floor = floor;
		this.jibun = jibun;
		this.type = type;
		this.rentMoney = rentMoney;
		this.img = img;
		this.lat = lat;
		this.lng = lng;
	}

	public static String getAPT_DEAL() {
		return APT_DEAL;
	}

	public static void setAPT_DEAL(String aPT_DEAL) {
		APT_DEAL = aPT_DEAL;
	}

	public static String getAPT_RENT() {
		return APT_RENT;
	}

	public static void setAPT_RENT(String aPT_RENT) {
		APT_RENT = aPT_RENT;
	}

	public static String getHOUSE_DEAL() {
		return HOUSE_DEAL;
	}

	public static void setHOUSE_DEAL(String hOUSE_DEAL) {
		HOUSE_DEAL = hOUSE_DEAL;
	}

	public static String getHOUSE_RENT() {
		return HOUSE_RENT;
	}

	public static void setHOUSE_RENT(String hOUSE_RENT) {
		HOUSE_RENT = hOUSE_RENT;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public String getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}

	public String getDealYear() {
		return dealYear;
	}

	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}

	public String getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}

	public String getDealDay() {
		return dealDay;
	}

	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRentMoney() {
		return rentMoney;
	}

	public void setRentMoney(String rentMoney) {
		this.rentMoney = rentMoney;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

}
