package com.sist.dao;
/*
 *   NO      NOT NULL NUMBER         
	CNO              NUMBER         
	NAME    NOT NULL VARCHAR2(100)  
	SCORE   NOT NULL NUMBER(2,1)    
	ADDRESS NOT NULL VARCHAR2(200)  
	TEL     NOT NULL VARCHAR2(20)   
	TYPE    NOT NULL VARCHAR2(100)  
	PRICE   NOT NULL VARCHAR2(100)  
	PARKING NOT NULL VARCHAR2(100)  
	TIME             VARCHAR2(200)  
	MENU             VARCHAR2(2000) 
	POSTER  NOT NULL VARCHAR2(1000) 
	GOOD             NUMBER         
	SOSO             NUMBER         
	BAD              NUMBER         

 */
public class FoodVO {
    private String name,address,tel,poster;
    private double score;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	   
}
