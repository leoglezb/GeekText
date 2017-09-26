package com.geektext.pojo;

import org.jdom2.input.SAXBuilder;
import org.jdom2.Document;
import org.jdom2.Element;

public class Location {
	private static final String IP = "Ip";
	private static final String COUNTRYCODE= "CountryCode";
	private static final String COUNTRYNAME="CountryName";
	private static final String REGIONCODE="RegionCode";
	private static final String REGIONNAME="RegionName";
	private static final String CITY="City";
	private static final String ZIPCODE="ZipCode";
	private static final String LATIDUDE="Latitude";
	private static final String LONGITUDE="Longitude";
	private static final String METROCODE="MetroCode";
	private static final String AREACODE="AreaCode";
	
	private String Ip;
	private String CountryCode;
	private String CountryName;
	private String RegionCode;
	private String RegionName;
	private String City;
	private String ZipCode;
	private String Latitude;
	private String Longitude;
	private String MetroCode;
	private String AreaCode;

	public Location() {
		super();
		Ip = "";
		CountryCode = "";
		CountryName = "";
		RegionCode = "";
		RegionName = "";
		City = "";
		ZipCode = "";
		Latitude = "";
		Longitude = "";
		MetroCode = "";
		AreaCode = "";
	}

	public Location(String ip, String countryCode, String countryName,
			String regionCode, String regionName, String city, String zipCode,
			String latitude, String longitude, String metroCode, String areaCode) {
		super();
		Ip = ip;
		CountryCode = countryCode;
		CountryName = countryName;
		RegionCode = regionCode;
		RegionName = regionName;
		City = city;
		ZipCode = zipCode;
		Latitude = latitude;
		Longitude = longitude;
		MetroCode = metroCode;
		AreaCode = areaCode;
	}

	public String getIp() {
		return Ip;
	}
	public Location(String urlStr){
		SAXBuilder builder = new SAXBuilder();		
		try{
			Document document = (Document) builder.build(urlStr);
			Element node = document.getRootElement();
			Ip = node.getChildText(IP);
			CountryCode = node.getChildText(COUNTRYCODE);
			CountryName = node.getChildText(COUNTRYNAME);
			RegionCode = node.getChildText(REGIONCODE);
			RegionName = node.getChildText(REGIONNAME);
			City = node.getChildText(CITY);
			ZipCode = node.getChildText(ZIPCODE);
			Latitude = node.getChildText(LATIDUDE);
			Longitude = node.getChildText(LONGITUDE);
			MetroCode = node.getChildText(METROCODE);
			AreaCode = node.getChildText(AREACODE);

		}catch(Exception e){
			System.err.println("RequestResource: Error intentando recuperar el recurso, "+urlStr + e.getMessage());
			Ip = "98.203.51.54";
			CountryCode = "US";
			CountryName = "United States";
			RegionCode = "FL";
			RegionName = "Florida";
			City = "Hialeah";
			ZipCode = "33015";
			Latitude = "25.9372";
			Longitude = "-80.317";
			MetroCode = "528";
			AreaCode = "305";
		}
	}
			
	public void setIp(String ip) {
		Ip = ip;
	}

	public String getCountryCode() {
		return CountryCode;
	}

	public void setCountryCode(String countryCode) {
		CountryCode = countryCode;
	}

	public String getCountryName() {
		return CountryName;
	}

	public void setCountryName(String countryName) {
		CountryName = countryName;
	}

	public String getRegionCode() {
		return RegionCode;
	}

	public void setRegionCode(String regionCode) {
		RegionCode = regionCode;
	}

	public String getRegionName() {
		return RegionName;
	}

	public void setRegionName(String regionName) {
		RegionName = regionName;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getZipCode() {
		return ZipCode;
	}

	public void setZipCode(String zipCode) {
		ZipCode = zipCode;
	}

	public String getLatitude() {
		return Latitude;
	}

	public void setLatitude(String latitude) {
		Latitude = latitude;
	}

	public String getLongitude() {
		return Longitude;
	}

	public void setLongitude(String longitude) {
		Longitude = longitude;
	}

	public String getMetroCode() {
		return MetroCode;
	}

	public void setMetroCode(String metroCode) {
		MetroCode = metroCode;
	}

	public String getAreaCode() {
		return AreaCode;
	}

	public void setAreaCode(String areaCode) {
		AreaCode = areaCode;
	}
}
