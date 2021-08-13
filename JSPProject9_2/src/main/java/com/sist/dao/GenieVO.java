package com.sist.dao;
/*
 *  NO        NOT NULL NUMBER         
	POSTER             VARCHAR2(1000) 
	TITLE              VARCHAR2(200)  
	SINGER             VARCHAR2(100)  
	ALBUM              VARCHAR2(200)  
	STATE              CHAR(10)       
	IDCREMENT          NUMBER         
	KEY                VARCHAR2(100)  
 */
public class GenieVO {
    private int no,idcrement;
    private String poster,title,singer,album,state,key;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getIdcrement() {
		return idcrement;
	}
	public void setIdcrement(int idcrement) {
		this.idcrement = idcrement;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
   
   
}
