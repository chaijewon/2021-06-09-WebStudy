package com.sist.dao;
import java.util.*;
import java.sql.*;
public class FoodDAO {
    private Connection conn;
    private PreparedStatement ps;
    private final String url="jdbc:oracle:thin:@localhost:1521:XE";
    
    public FoodDAO()
    {
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
    public void getConnection()
    {
    	try
    	{
    		conn=DriverManager.getConnection(url,"hr","happy");
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
    
    // 전체 목록 출력 
    public ArrayList<FoodVO> foodListData(int page)
    {
    	ArrayList<FoodVO> list=new ArrayList<FoodVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT name,poster,address,score,tel,num "
    			      +"FROM (SELECT name,poster,address,score,tel,rownum as num "
    				  +"FROM (SELECT name,poster,address,score,tel "
    			      +"FROM food_house)) "
    				  +"WHERE num BETWEEN ? AND ?";
    		int rowSize=12;
    		/*
    		 *   1~12
    		 *   13~24
    		 *   25~
    		 */
    		int start=(rowSize*page)-(rowSize-1); // rownum은 1번 시작
    		int end=rowSize*page;
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, start);
    		ps.setInt(2, end);
    		
    		ResultSet rs=ps.executeQuery();
    		
    		while(rs.next())
    		{
    		    FoodVO vo=new FoodVO();
    		    vo.setName(rs.getString(1));
    		    vo.setPoster(rs.getString(2));
    		    String addr=rs.getString(3);
    		    addr=addr.substring(0,addr.lastIndexOf("지"));// 길 
    		    vo.setAddress(addr);
    		    vo.setScore(rs.getDouble(4));
    		    vo.setTel(rs.getString(5));
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








