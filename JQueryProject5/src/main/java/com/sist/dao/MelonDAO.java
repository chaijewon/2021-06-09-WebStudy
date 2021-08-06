package com.sist.dao;
import java.sql.*;
import java.util.*;
public class MelonDAO {
    private Connection conn; // 오라클 연결 
    private PreparedStatement ps; // SQL문장 전송 => 결과값 받기 
    private final String URL="jdbc:oracle:thin:@localhost:1521:XE"; //오라클 주소 
    // thin 드라이버 => 연결만 해주는 드라이버 => 속도가 늦다 (무료)
    // 1. 드라이버 등록 
    public MelonDAO()
    {
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 등록 => 클래스 메모리 할당
    		// 클래스 이름으로 메모리 할당 => 리플렉션(마이바이스 , 스프링) 
    	}catch(Exception ex) {}
    }
    
    // VO는 등록 => SQL => 알아서 처리 
    // 연결 
    public void getConnection()
    {
    	try
    	{
    		conn=DriverManager.getConnection(URL,"hr","happy");
    		// conn hr/happy
    	}catch(Exception ex) {}
    }
    // 닫기
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    		// exit
    	}catch(Exception ex) {}
    }
    
    // 기능 ArrayList<MelonVO> [{vo},{vo},{vo},{vo},{vo}]: JSON = ArrayList
    public ArrayList<MelonVO> musicListData()
    {
    	// JSON을 만들수 있다 => JavaScript
    	ArrayList<MelonVO> list=new ArrayList<MelonVO>();
    	try
    	{
    		//1. 연결
    		getConnection();
    		//2.SQL문장 전송 
    		String sql="SELECT no,title,singer,poster,key,album "
    				  +"FROM melon_cjw "
    				  +"ORDER BY no ASC";
    		ps=conn.prepareStatement(sql);// 전송
    		// 실행후 결과값 받기 
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())//첫번째줄부터 값을 받아 온다  (next())
    		{
    			MelonVO vo=new MelonVO();
    			vo.setNo(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setSinger(rs.getString(3));
    			vo.setPoster(rs.getString(4));
    			vo.setKey(rs.getString(5));
    			vo.setAlbum(rs.getString(6));
    			
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












