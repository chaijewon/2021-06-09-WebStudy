package com.sist.dao;
import java.util.*;
import java.sql.*;
// input , select , textarea , form , fieldset , label  => css(div,span)
/*
 *    데이터 관리 => 오라클 (자바) 
 *    화면 출력 => HTML 
 *    브라우저 안에서 처리 (이벤트 => 자바스크립트) 
 *    ==================================== + JSP
 *    JSP => HTML+JAVASCRIP+CSS+Java
 *           ================== ====  분리 (MVC) => 프로젝트는 MVC구조로 만든다 (현업은 MVC) => Spring(MVC)
 *           M => Model (비지니스로직) => 기능 처리(자바)
 *           ================================================== Back-End(자바,오라클,스프링)
 *           V => View  (프리젠테이션로직)=> 화면 출력(HTML)
 *           ================================================== Front-End(HTML,JS,CSS)
 *           C => Controller => 자바+HTML은 연결 =========> 서블릿 ==> Spring에서는 이미 제작이 되어있다 
 */
public class MusicDAO {
   // 연결 객체
	private Connection conn;
   // SQL 전송 
	private PreparedStatement ps;
   // URL주소
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   // 1. 드라이버 등록
	public MusicDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
   // 2. 오라클 연결
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
   // 3. 오라클 닫기
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
   // 4. 기능 
   // 4-1. 목록 (table)
	// 자바 => 브라우저에서 실행 => servlet(순수하게 자바로만 코딩) , jsp(자바+HTML) 
	/*
	 *   jsp는 분리
	 *   ========
	 *   자바출력 : <% 자바 코딩 %>
	 *   HTML : 
	 */
	public ArrayList<MusicVO> musicListData()
	{
		ArrayList<MusicVO> list=new ArrayList<MusicVO>();
		try
		{
			getConnection();
			String sql="SELECT no,poster,title,singer,album "
					  +"FROM melon_cjw";
			// 전송(오라클)
			ps=conn.prepareStatement(sql);
			// 실행 결과를 받는다 
			ResultSet rs=ps.executeQuery();
			// 메모리에 실행 결과 저장 완료 => ArrayList에 묶어서 => 브라우저로 전송 
			while(rs.next())
			{
				MusicVO vo=new MusicVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setSinger(rs.getString(4));
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
			disConnection();
		}
		return list;
	}
   // 4-2. 상세보기 (동영상)
	public MusicVO musicDetailData(int no) // Database는 중복이 없는 값이 필요(Primary key)
	{
		MusicVO vo=new MusicVO();
		try
		{
			getConnection();
			String sql="SELECT no,title,singer,key "
					  +"FROM music_cjw "
					  +"WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setSinger(rs.getString(3));
			vo.setKey(rs.getString(4));
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
}









