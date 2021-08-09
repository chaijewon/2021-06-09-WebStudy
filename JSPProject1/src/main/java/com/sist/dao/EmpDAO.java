package com.sist.dao;
import java.util.*;
import java.sql.*;
public class EmpDAO {
    private Connection conn;
    private PreparedStatement ps;
    private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
    
    // 드라이버 등록 
    public EmpDAO()
    {
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    	}catch(Exception ex) {}
    }
    // 연결
    public void getConnection()
    {
    	try
    	{
    		conn=DriverManager.getConnection(URL,"hr","happy");
    	}catch(Exception ex) {}
    }
    // 해제
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch(Exception ex) {}
    }
    
    // 데이터베이스에서 데이터 읽기 
    public ArrayList<EmpVO> empListData()
    {
    	ArrayList<EmpVO> list=new ArrayList<EmpVO>();
    	try
    	{
    		// 연결 
    		getConnection();
    		String sql="SELECT empno,ename,job,mgr,hiredate,sal,comm,dname,loc,grade "
    				  +"FROM emp,dept,salgrade "
    				  +"WHERE emp.deptno=dept.deptno "
    				  +"AND sal BETWEEN losal AND hisal "
    				  +"ORDER BY sal DESC";
    		// 오라클로 전송 
    		ps=conn.prepareStatement(sql);
    		// 결과값 받기
    		ResultSet rs=ps.executeQuery();
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
    			vo.getDvo().setDname(rs.getString(8));
    			vo.getDvo().setLoc(rs.getString(9));
    			vo.getSvo().setGrade(rs.getInt(10));
    			
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
}
















