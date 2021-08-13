package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.db.*;
public class MusicDAO {
    private Connection conn;
    private PreparedStatement ps;
    private DBCreate db=new DBCreate();
    /*
     *   1
     *   2
     *   3
     *   ..
     *   200
     *   
     *   1
     *   2
     *   4
     *   3 /*+  => ORDER BY
     */
    public ArrayList<GenieVO> genieListData()
    {
    	ArrayList<GenieVO> list=new ArrayList<GenieVO>();
    	try
    	{
    		// 1. 연결 
    		conn=db.getConnection();
    		// 2. SQL문장 전송 
    		// rownum의 순서 변경 => 인라인뷰 
    		String sql="SELECT no,title,singer,album,poster,state,idcrement,rownum "
    				  +"FROM (SELECT no,title,singer,album,poster,state,idcrement "
    				  +"FROM genie_cjw ORDER BY no ASC) "
    				  +"WHERE rownum<=50";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			GenieVO vo=new GenieVO();
    			vo.setNo(rs.getInt(1));//primary => 찾기(상세)
    			vo.setTitle(rs.getString(2));
    			vo.setSinger(rs.getString(3));
    			vo.setAlbum(rs.getString(4));
    			vo.setPoster(rs.getString(5));
    			String temp=rs.getString(6);
    			String s="";
    			//System.out.println(temp.length());
    			if(temp.startsWith("상승"))
    			{
    				s="<font color=blue>▲</font>";
    			}
    			else if(temp.startsWith("하강"))
    			{
    				s="<font color=red>▼</font>";
    			}
    			else
    			{
    				s="<font color=gray>-</font>";
    			}
    			System.out.println("s="+s);
    			vo.setState(s);
    			vo.setIdcrement(rs.getInt(7));
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
    
    // 지니뮤직 상세 
    public GenieVO genieDetailData(int no)
    {
    	GenieVO vo=new GenieVO();
    	try
    	{
    		conn=db.getConnection();
    		String sql="SELECT title,poster,singer,album,"
    				  +"(SELECT key FROM melon_cjw WHERE melon_cjw.title=genie_cjw.title) "
    				  +"FROM genie_cjw "
    				  +"WHERE no=?";
    		// 스칼라 서브쿼리
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		vo.setTitle(rs.getString(1));
    		vo.setPoster(rs.getString(2));
    		vo.setSinger(rs.getString(3));
    		vo.setAlbum(rs.getString(4));
    		vo.setKey(rs.getString(5));
    		rs.close();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		db.disConnection(conn, ps);
    	}
    	return vo;
    }
    // 멜론뮤직 
    public ArrayList<MelonVO> melonListData()
    {
    	ArrayList<MelonVO> list=new ArrayList<MelonVO>();
    	try
    	{
    		conn=db.getConnection();
    		String sql="SELECT no,title,singer,poster,album,rownum "
    				  +"FROM (SELECT no,title,singer,poster,album "
    				  +"FROM melon_cjw ORDER BY no ASC) "
    				  +"WHERE rownum<=50";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MelonVO vo=new MelonVO();
    			vo.setNo(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setSinger(rs.getString(3));
    			vo.setPoster(rs.getString(4));
    			vo.setAlbum(rs.getString(5));
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
     // 멜론뮤직 상세 
    public MelonVO melonDetailData(int no)
    {
    	MelonVO vo=new MelonVO();
    	try
    	{
    		conn=db.getConnection();
    		String sql="SELECT title,poster,singer,album,key "
    				  +"FROM melon_cjw "
    				  +"WHERE no=?";
    		// 스칼라 서브쿼리
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		vo.setTitle(rs.getString(1));
    		vo.setPoster(rs.getString(2));
    		vo.setSinger(rs.getString(3));
    		vo.setAlbum(rs.getString(4));
    		vo.setKey(rs.getString(5));
    		rs.close();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		db.disConnection(conn, ps);
    	}
    	return vo;
    }
    
 // 멜론뮤직 
    public ArrayList<TotalVO> totalListData()
    {
    	ArrayList<TotalVO> list=new ArrayList<TotalVO>();
    	try
    	{
    		conn=db.getConnection();
    		String sql="SELECT no,title,singer,poster,album,rownum "
    				  +"FROM (SELECT no,title,singer,poster,album "
    				  +"FROM music_total ORDER BY no ASC) "
    				  +"WHERE rownum<=50";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			TotalVO vo=new TotalVO();
    			vo.setNo(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setSinger(rs.getString(3));
    			vo.setPoster(rs.getString(4));
    			vo.setAlbum(rs.getString(5));
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
}










