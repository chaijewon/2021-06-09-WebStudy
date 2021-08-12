package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.db.*;
public class DataBoardDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCreate db=new DBCreate();// 라이브러리 => getConnection()/disConnection() => jar
   // 기능 처리 (목록 출력)
   public ArrayList<DataBoardVO> databoardListData(int page)
   {
	   ArrayList<DataBoardVO> list=
			   new ArrayList<DataBoardVO>();
	   try
	   {
		   //1. 연결 INDEX => 자동으로 생성 (PK,UK) => 직접 생성 CREATE INDEX index명 ON table(컬럼)
		   conn=db.getConnection();
		   String sql="SELECT no,subject,name,regdate,hit,filename,filesize,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,filename,filesize,rownum as num "
				     +"FROM (SELECT /*+ INDEX_DESC(databoard db_no_pk) */ no,subject,name,regdate,hit,filename,filesize "
				     +"FROM databoard)) "
				     +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   //?에 값을 채운다 
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   
		   ps.setInt(1,start);
		   ps.setInt(2, end);
		   
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()){
			   DataBoardVO vo=new DataBoardVO();
			   vo.setNo(rs.getInt(1));
			   vo.setSubject(rs.getString(2));
			   vo.setName(rs.getString(3));
			   vo.setRegdate(rs.getDate(4));
			   vo.setHit(rs.getInt(5));
			   vo.setFilename(rs.getString(6));
			   vo.setFilesize(rs.getInt(7));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
	   return list;
   }
   // 다운로드 => setHeader() 
   // 업로드
   public void databoardInsert(DataBoardVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="INSERT INTO databoard(no,name,subject,content,pwd,filename,filesize) "
				     +"VALUES(db_no_seq.nextval,?,?,?,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   // ?에 값 채운다
		   ps.setString(1, vo.getName());
		   ps.setString(2, vo.getSubject());
		   ps.setString(3, vo.getContent());
		   ps.setString(4, vo.getPwd());
		   ps.setString(5, vo.getFilename());
		   ps.setInt(6, vo.getFilesize());
		   // 실행 요청
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
   }
}






