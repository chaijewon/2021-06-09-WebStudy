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
    // 영화 상세보기 
    /*
     *  MNO         NUMBER        
		TITLE       VARCHAR2(300) 
		GENRE       VARCHAR2(200) 
		POSTER      VARCHAR2(500) 
		ACTOR       VARCHAR2(200) 
		REGDATE     VARCHAR2(100) 
		GRADE       VARCHAR2(60)  
		DIRECTOR    VARCHAR2(200) 
     */
    public MovieVO movieDetailData(int mno)
    {
    	//MovieVO vo=new MovieVO();
    	ArrayList<MovieVO> list=new ArrayList<MovieVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT mno,title,genre,poster,actor,regdate,grade,director "
    				  +"FROM movie "
    				  +"WHERE mno=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, mno);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MovieVO vo=new MovieVO();
    			vo.setMno(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setGenre(rs.getString(3));
    			vo.setPoster(rs.getString(4));
    			vo.setActor(rs.getString(5));
    			vo.setRegdate(rs.getString(6));
    			vo.setGrade(rs.getString(7));
    			vo.setDirector(rs.getString(8));
    			list.add(vo);
    		}
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return list.get(0);
    }
    /////////////////////////////////// 맛집 ////////////////////////////
 // 카테고리 출력 
    public ArrayList<CategoryVO> foodCategoryListData()
    {
    	ArrayList<CategoryVO> list=new ArrayList<CategoryVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT cno,title,subject,poster "
    				  +"FROM food_category ORDER BY cno ASC";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			CategoryVO vo=new CategoryVO();
    			vo.setCno(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setSubject(rs.getString(3));
    			vo.setPoster(rs.getString(4));
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
    // 1-1 
    public CategoryVO foodCategoryInfoData(int cno)
    {
    	CategoryVO vo=new CategoryVO();
    	try
    	{
    		getConnection();
    		String sql="SELECT title,subject "
    				  +"FROM food_category "
    				  +"WHERE cno=?";
    		ps=conn.prepareStatement(sql);
    		// ? 
    		ps.setInt(1,cno);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		vo.setTitle(rs.getString(1));
    		vo.setSubject(rs.getString(2));
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
    // 카테고리별 음식점 출력 
    public ArrayList<FoodVO> foodCategoryData(int cno)
    {
    	ArrayList<FoodVO> list=new ArrayList<FoodVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT no,name,tel,address,poster,score "
    			      +"FROM food_house "
    				  +"WHERE cno=?";
    		// no 고유번호 (primary key) => 상세보기  , cno => category 번호
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, cno);
    		// 실행 
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			FoodVO vo=new FoodVO();
    			vo.setNo(rs.getInt(1));
    			vo.setName(rs.getString(2));
    			vo.setTel(rs.getString(3));
    			String s=rs.getString(4);
    			s=s.substring(0,s.lastIndexOf("지"));
    			vo.setAddress(s.trim());
    			s=rs.getString(5);// 5개가 동시에 저장 ==> a.jpg^~a.jpg^
    			s=s.substring(0,s.indexOf("^"));
    			vo.setPoster(s);
    			vo.setScore(rs.getDouble(6));
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
    // 음식점 상세보기 
    /*
     *   NO      NOT NULL NUMBER         
	CNO              NUMBER         
	NAME    NOT NULL VARCHAR2(100)  
	SCORE   NOT NULL NUMBER(2,1)    
	ADDRESS NOT NULL VARCHAR2(200)  
	TEL     NOT NULL VARCHAR2(20)   
	TYPE    NOT NULL VARCHAR2(100)  
	PRICE   NOT NULL VARCHAR2(100)  
	PARKING NOT NULL VARCHAR2(100)  
	TIME             VARCHAR2(200)  
	MENU             VARCHAR2(2000) 
	POSTER  NOT NULL VARCHAR2(1000) 
	GOOD             NUMBER         
	SOSO             NUMBER         
	BAD              NUMBER    
     */
    public FoodVO foodDetailData(int no)
    {
    	FoodVO vo=new FoodVO();
    	try
    	{
    		getConnection();
    		String sql="SELECT no,name,score,address,tel,type,price,parking,time,NVL(menu,'no'),poster,good,soso,bad,cno "
    				  +"FROM food_house "
    				  +"WHERE no=?";
    	    ps=conn.prepareStatement(sql);
    	    ps.setInt(1, no);
    	    ResultSet rs=ps.executeQuery();
    	    rs.next();
    	    // 값을 vo에 저장 
    	    vo.setNo(rs.getInt(1));
    	    vo.setName(rs.getString(2));
    	    vo.setScore(rs.getDouble(3));
    	    vo.setAddress(rs.getString(4));
    	    vo.setTel(rs.getString(5));
    	    vo.setType(rs.getString(6));
    	    vo.setPrice(rs.getString(7));
    	    vo.setParking(rs.getString(8));
    	    vo.setTime(rs.getString(9));
    	    vo.setMenu(rs.getString(10));
    	    vo.setPoster(rs.getString(11));
    	    vo.setGood(rs.getInt(12));
    	    vo.setSoso(rs.getInt(13));
    	    vo.setBad(rs.getInt(14));
    	    vo.setCno(rs.getInt(15));
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
    // 3-1 근처 맛집 => 이미지 , 맛집명 , 평점 , 주소 , 가격대 , 음식종류 
    public ArrayList<FoodVO> houseLocationData(String addr)
    {
    	ArrayList<FoodVO> list=new ArrayList<FoodVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT poster,name,address,price,type "
    				  +"FROM food_house "
    				  +"WHERE address LIKE '%'||?||'%'";
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, addr);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			FoodVO vo=new FoodVO();
    			vo.setPoster(rs.getString(1));
    			vo.setName(rs.getString(2));
    			vo.setAddress(rs.getString(3));
    			vo.setPrice(rs.getString(4));
    			vo.setType(rs.getString(5));
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














