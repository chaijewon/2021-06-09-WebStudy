package com.sist.dao;
/*
 *   VO => 오라클의 record와 일치하게 만든다 (오라클에서 가지고 오는 데이터값을 받아서 저장)
 *         ===== column => 8개 (VO=>8개)
 *               column여러개 모아서 관리 ==> record
 *      NO      NOT NULL NUMBER         
		NAME    NOT NULL VARCHAR2(34)   
		SUBJECT NOT NULL VARCHAR2(1000) 
		CONTENT NOT NULL CLOB           
		PWD     NOT NULL VARCHAR2(10)   
		REGDATE          DATE           
		HIT              NUMBER  
 */
import java.util.*; // <input => name속성은 언제 사용하지 확인> id,class=>CSS/JS
// 전송 => GET/POST (데이터 전송 방법) => 브라우저 전송(1byte) => 자바 (한글 2byte)
//                                   Encoding              Decoding => 한글 처리방법 

public class BoardVO {
    private int no,hit;
    private String name,subject,content,pwd,email;
    private Date regdate;
    
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
     
}











