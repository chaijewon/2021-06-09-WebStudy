package com.sist.dao;
/*
 *  RNO     NOT NULL NUMBER       
	MNO              NUMBER       
	NAME    NOT NULL VARCHAR2(34) 
	MSG     NOT NULL CLOB         
	REGDATE          DATE  
 */
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class MelonReplyVO {
   private int rno,mno;
   private String name,msg;
   private Date regdate;
   private String dbday;
   
}
