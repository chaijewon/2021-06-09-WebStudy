package com.sist.dao;
/*
 *   맛집
 *   영화
 *   음악 
 */
import java.util.*;
import java.sql.*;
public class OracleDAO {
	private Connection conn;
    private PreparedStatement ps;
    private final String URL="jdbc:oracle:thin:@localhost:1521:XE"; // this.conn = null
    
    // 드라이버 등록 
    public OracleDAO()
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
    // 영화 목록 
    public ArrayList<MovieVO> movieListData(int page)
    {
    	ArrayList<MovieVO> list=new ArrayList<MovieVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT mno,title,poster,num "
    				  +"FROM (SELECT mno,title,poster , rownum as num "
    				  +"FROM (SELECT mno,title,poster "
    				  +"FROM movie ORDER BY mno ASC)) "
    				  +"WHERE num BETWEEN ? AND ?";
    		int rowSize=20;
    		int start=(rowSize*page)-(rowSize-1);  // 1page => 1 , 2page => 21
    		int end=(rowSize*page);
    		// SQL문장 
    		ps=conn.prepareStatement(sql);
    		// ? 값을 채운다 
    		ps.setInt(1, start);
    		ps.setInt(2, end);   // ps.setString() => '' , ps.setInt() => ''를 사용하지 않는다 
    		// 실행 
    		ResultSet rs=ps.executeQuery();
    		// 결과값을 ArrayList에 담는다 
    		while(rs.next()) // 출력된 내용 처음부터 출력 
    		{
    			MovieVO vo=new MovieVO(); // rs.next() => row단위로 읽어 온다 
    			vo.setMno(rs.getInt(1));
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
    // 총페이지 
    public int movieTotalPage()
    {
    	int total=0;
    	try
    	{
    		getConnection();
    		String sql="SELECT CEIL(COUNT(*)/20.0) FROM movie";
    		ps=conn.prepareStatement(sql);
    		// 실행 
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
}














