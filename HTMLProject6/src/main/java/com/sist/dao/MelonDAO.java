package com.sist.dao;
import java.util.*;
import java.sql.*;
public class MelonDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	   public MelonDAO()
	   {
		   try
		   {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	   public void getConnection()
	   {
		   try
		   {
			   conn=DriverManager.getConnection(URL,"hr","happy");
			   // conn hr/happy
		   }catch(Exception ex) {}
	   }
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex) {}
	   }
	   
	   // 기능 => 목록 출력 , 상세 (댓글) => white-space:pre-wrap background-color:
	   public ArrayList<MelonVO> musicListData()
	   {
		   ArrayList<MelonVO> list=new ArrayList<MelonVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,title,poster FROM melon_cjw ORDER BY no";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   MelonVO vo=new MelonVO();
				   vo.setNo(rs.getInt(1));
				   vo.setTitle(rs.getString(2));
				   vo.setPoster(rs.getString(3));
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			  
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	   // 한개의 뮤직 => VO
	   // 여러개 => ArrayList
	   // void .... int
	   public MelonVO melonDetailData(int no)
	   {
		   MelonVO vo=new MelonVO();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,title,poster,singer,key FROM melon_cjw "
					     +"WHERE no="+no;
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   vo.setSinger(rs.getString(4));
			   vo.setKey(rs.getString(5));
			   rs.close();
		   }catch(Exception ex)
		   {
			  
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return vo;
	   }
	   // 댓글 추가
	   // 1. 연결 (형식) 
	   // 2. SQL문장
	   public void replyInsert(MelonReplyVO vo)
	   {
		   try
		   {
			   // 1. 연결
			   getConnection();
			   // 2. SQL
			   String sql="INSERT INTO melonReply VALUES("
					     +"mr_rno_seq.nextval,?,?,?,SYSDATE)";
			   ps=conn.prepareStatement(sql);
			   //?에 값을 채운다
			   ps.setInt(1, vo.getMno());
			   ps.setString(2, vo.getName()); // '홍길동'
			   ps.setString(3, vo.getMsg());
			   // 실행
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
	   }
	   // 댓글 읽기
	   
}



















