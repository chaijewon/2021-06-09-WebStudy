package com.sist.dao;
import java.util.*;
import java.sql.*;
public class EmpDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";// 오라클 주소 
   // 드라이버 등록 (VO,DAO => JSP , Spring)
   public EmpDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
   }
   // 오라클 연결
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   // 오라클 해제 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 기능 처리(DML처리)
   public ArrayList<EmpVO> empAllData()
   {
	   ArrayList<EmpVO> list=new ArrayList<EmpVO>();
	   try
	   {
		   // 1. 연결
		   getConnection();
		   // 2. SQL문장 
		   String sql="SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno,"
				     +"(SELECT SUM(sal) FROM emp),"
				     +"(SELECT ROUND(AVG(sal),2) FROM emp) "
				     +"FROM emp";
		   // 3. SQL문장을 오라클로 전송
		   ps=conn.prepareStatement(sql);
		   // 4. 실행 요청
		   ResultSet rs=ps.executeQuery();
		   // 4. rs에 있는 데이터를 ArrayList 담아준다 
		   while(rs.next())
		   {
			   EmpVO vo=new EmpVO();
			   vo.setEmpno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setJob(rs.getString(3));
			   vo.setMgr(rs.getInt(4));
			   vo.setHiredate(rs.getDate(5));
			   vo.setSal(rs.getInt(6));
			   vo.setComm(rs.getInt(7));
			   vo.setDeptno(rs.getInt(8));
			   vo.setSum(rs.getInt(9));
			   vo.setAvg(rs.getDouble(10));
			   list.add(vo); // 14명의 정보를 가지고 있다 (EmpVO=>사원 한명에 대한 정보)
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 닫기 
		   disConnection();
	   }
	   return list;
   }
   
}











