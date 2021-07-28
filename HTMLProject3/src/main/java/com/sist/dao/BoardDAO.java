package com.sist.dao;
import java.util.*;
import java.sql.*;
public class BoardDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   
   public BoardDAO()
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
   // 기능 => 오라클과 연결하는 기능 ===========> Servlet을 통해서 브라우저로 전송 (HTML)
   // 블록별로 묶어서 이전 [1][2][3][4][5] 다음
   // 1. 목록 출력 ==> 인라인뷰 (페이지 설정)
   public ArrayList<BoardVO> boardListData(int page)
   {
	   // page => 사용자가 브라우저 전송한다 
	   ArrayList<BoardVO> list=new ArrayList<BoardVO>();
	   try
	   {
		   // 1. 연결
		   getConnection();
		   // 2. SQL문장을 전송 
		   String sql="SELECT no,subject,name,regdate,hit,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				     +"FROM (SELECT no,subject,name,regdate,hit "
				     +"FROM freeboard ORDER BY no DESC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1); // 1,11,21 => rownum은 1번부터 시작한다
		   int end=rowSize*page;
		   
		   // 3. 오라클에 전송
		   ps=conn.prepareStatement(sql);
		   // 4. ? 값을 채운다
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   // 5. 실행 요청 
		   ResultSet rs=ps.executeQuery();
		   // 6. 메모리에 저장된 값을 ArrayList에 채운다 
		   while(rs.next()) // rs.next() => 한줄을 읽어 온다 
		   {
			   // no,subject,name,regdate,hit
			   BoardVO vo=new BoardVO(); // JSP=>빈즈(bean) => 핵심클래스
			   vo.setNo(rs.getInt(1));
			   vo.setSubject(rs.getString(2));
			   vo.setName(rs.getString(3));
			   vo.setRegdate(rs.getDate(4));
			   vo.setHit(rs.getInt(5));
			   
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
   // 1-2. 총페이지 CEIL() => Java,Oracle(SQL),HTML,CSS,JavaScript
   // CSS(라이브러리) => 부트스트립, SQL(라이브러리:MyBatis) , JavaScript(라이브러리)=Jquery,React,Vue,Ajax
   // 통합 => Spring  
   public int boardTotalPage()
   {
	   int total=0;
	   try
	   {
		   getConnection();
		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM freeboard";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return total;
   }
   // 2. 상세보기 => 조회수증가 , 상세보기 
   // 3. 게시물 추가 => <input type=text name=name> => 서브 쿼리이용 방법 
   public void boardInsert(BoardVO vo)
   {
	   try
	   {
		   //1. 연결
		   getConnection();
		   String sql="INSERT INTO freeboard VALUES("
				     +"(SELECT NVL(MAX(no)+1,1) FROM freeboard),?,?,?,?,?,SYSDATE,0)";
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
   }
   // 4. 수정 => 태그 => value속성 이용 
   // 5. 삭제 
   // 6. 찾기 => like 
}












