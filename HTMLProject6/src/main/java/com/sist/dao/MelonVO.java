package com.sist.dao;

import lombok.Getter;
import lombok.Setter;

/*
 *   NO     NOT NULL NUMBER         
	POSTER          VARCHAR2(1000) 
	TITLE           VARCHAR2(200)  
	SINGER          VARCHAR2(100)  
	ALBUM           VARCHAR2(200)  
	OK              VARCHAR2(10)   
	KEY             VARCHAR2(100)
 */
@Setter
@Getter
public class MelonVO {
   private int no;
   private String poster,title,singer,album,key;
}
