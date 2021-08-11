package com.sist.dao;
import java.util.*;
import java.sql.*;
/*
 *   기능 (흐름)   로그인 => 메인페이지 , 회원가입 => 메인페이지 , 예매완료 => 마이페이지
 *   1. 목록 ===================================> 페이징 (인라인뷰) 
 *   2. 상세보기     ==> 목록    =================> 
 *   3. 데이터 추가   ==> 최종화면 ==> 목록
 *   ==========================================
 *   4. 데이터 수정   ==> 최종화면 ==> 상세  => 비밀번호 : Ajax
 *   5. 데이터 삭제   ==> 최종화면 ==> 목록  => 비밀번호 : Ajax => 화면 변경없이 그자리에서 처리 
 *   ==========================================
 *   6. 찾기        ==> 최종화면 ==> 목록  =====> 새로운 JSP , 목록에서 출력 
 *   ==========================================
 */
public class BoardDAO {
	private Connection conn;
    private PreparedStatement ps;
    private final String URL="jdbc:oracle:thin:@localhost:1521:XE"; // this.conn = null
    
    // 드라이버 등록 
    public BoardDAO()
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
    /*
     *   1. 한개의 모든 데이터 =======> VO
     *   2. 목록 여러개의 데이터 =====> ArrayList
     */
    // 게시판 기능 설정 
    // 1. 목록 출력 ==> VO가 여러개 ==> ArrayList
    public ArrayList<BoardVO> boardListData(int page)
    {
    	ArrayList<BoardVO> list=new ArrayList<BoardVO>();
    	try
    	{
    		// 1. 연결 
    		getConnection();
    		// 2. SQL문장 
    		// 
    		String sql="SELECT no,subject,name,regdate,hit,num " 
    				  +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
    				  +"FROM (SELECT no,subject,name,regdate,hit "
    				  +"FROM jspBoard ORDER BY no DESC)) "
    				  +"WHERE num BETWEEN ? AND ?"; // 오라클에서 데이터를 나눠서 가지고 올때 사용(인라인뷰)
    		// 3. 오라클로 전송
    		ps=conn.prepareStatement(sql);
    		// 4. 실행 요청 => 결과값을 메모리에 저장 
    		// 실행전에 처리 => ?에 값을 채운다 
    		int rowSize=10; // 한페이지에 10개씩 출력 
    		/*
    		 *   rownum : 한줄에 대한 번호 (오라클) => 1번부터 시작 
    		 *   1 page  ==> 1 ~ 10
    		 *   2 page  ==> 11 ~ 20
    		 *   3 page  ==> 21 ~ 30
    		 */
    		int start=(rowSize*page)-(rowSize-1); 
    		int end=rowSize*page;
    		
    		ps.setInt(1,start);
    		ps.setInt(2, end);
    		
    		ResultSet rs=ps.executeQuery();
    		// 5. 메모리에 있는 데이터 => ArrayList이동 
    		while(rs.next()) // 첫번째줄부터 -- 밑으로 내려가면서 데이터를 읽어 온다 
    		{
    			BoardVO vo=new BoardVO();
    			vo.setNo(rs.getInt(1));
    			vo.setSubject(rs.getString(2));
    			vo.setName(rs.getString(3));
    			vo.setRegdate(rs.getDate(4));
    			vo.setHit(rs.getInt(5));
    			
    			list.add(vo);// 에러 없는 상태 => 데이터 출력이 안된다 , commit
    			// 톰캣 => 이미 사용중 => ctrl+alt+delete ==> httped.exe, javaw.exe => 제거 
    		}
    		// 6. 메모리 닫기 
    		rs.close();
    	}catch(Exception ex)
    	{
    		//오류처리 
    		ex.printStackTrace();//output창
    	}
    	finally
    	{
    		disConnection();// 연결 해제
    		
    	}
    	return list;
    }
    // 1-1 총페이지 
    public int boardTotalPage()
    {
    	int total=0;
    	try
    	{
    		// 1. 연결 
    		getConnection();
    		// 2. sql문장
    		String sql="SELECT CEIL(COUNT(*)/10.0) FROM jspBoard"; // 총페이지 => 나누고 올림 (CEIL)
    		// 3. 오라클 전송
    		ps=conn.prepareStatement(sql);
    		// 4. 결과값 받기
    		ResultSet rs=ps.executeQuery();
    		rs.next();// 값이 출력된 위치에 커서를 올린다 
    		total=rs.getInt(1);
    		// 5. 메모리 닫기
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
    // 2. 상세보기  ==> VO한개 출력 
    // JSP => 요청 ==> 요청값 받기 => DAO연결 ==> 오라클 데이터 받기 ==> JSP에서 화면 출력 
    // JSP 모양 잡기 ==> DAO코딩 => 화면 출력 
    // JSP => DAO => JSP
    public BoardVO boardDetailData(int no)
    {
    	BoardVO vo=new BoardVO();
    	try
    	{
    		// 1. 연결
    		getConnection();
    		// 2. sql ===> sql문장 2번 수행 
    		// 2-1. 조회수 증가 
    		String sql="UPDATE jspBoard SET "
    				  +"hit=hit+1 "
    				  +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		// ?에 값을 채운다 
    		ps.setInt(1, no);
    		// 실행 
    		ps.executeUpdate(); // commit() => INSERT,UPDATE,DELETE
    		// SELECT => executeQuery()
    		
    		sql="SELECT no,name,subject,content,regdate,hit "
    		   +"FROM jspBoard "
    		   +"WHERE no=?";
    		
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		
    		// 결과값 받기 
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		
    		vo.setNo(rs.getInt(1));
    		vo.setName(rs.getString(2));
    		vo.setSubject(rs.getString(3));
    		vo.setContent(rs.getString(4));
    		vo.setRegdate(rs.getDate(5));
    		vo.setHit(rs.getInt(6));
    		
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
    // 3. 글쓰기   ==> VO한개 첨부
    public void boardInsert(BoardVO vo) // vo가 게시물 한개 
    {
    	try
    	{
    		getConnection();
    		String sql="INSERT INTO jspBoard(no,name,subject,content,pwd) VALUES("
    				  +"jb_no_seq.nextval,?,?,?,?)";
    	    // 전송 
    		// 나중에 ? 에 값을 채워서 실행 
    		ps=conn.prepareStatement(sql);
    		// ?
    		ps.setString(1, vo.getName());
    		ps.setString(2, vo.getSubject());
    		ps.setString(3, vo.getContent());
    		ps.setString(4, vo.getPwd());
    		
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
    // 4. 수정하기  ==> VO한개 
    // 4-1 . 기존에 입력된 데이터를 가지고 온다
    public BoardVO boardUpdateData(int no) // int no 사용자 보내준 데이터  => ?no=1
    {
    	BoardVO vo=new BoardVO();
    	try
    	{
    		//1. 연결 
    		getConnection();
    		//2. SQL문장 
    		String sql="SELECT no,name,subject,content "
    				  +"FROM jspBoard "
    				  +"WHERE no=?";
    		//3. 오라클로 전송 
    		ps=conn.prepareStatement(sql);
    		//4. ?에 값을 채운다 
    		ps.setInt(1, no);
    		//5. 실행 요청 => 메모리에 결과값 담기
    		ResultSet rs=ps.executeQuery();
    		// 6. 출력위치에 커서
    		rs.next();
    		// 7. rs.에 들어간 값 받기 
    		vo.setNo(rs.getInt(1));
    		vo.setName(rs.getString(2));
    		vo.setSubject(rs.getString(3));
    		vo.setContent(rs.getString(4));
    		// 8. rs닫기
    		rs.close();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		// 오라클 해제
    		disConnection();
    	}
    	return vo;
    }
    // 4-2 . 비밀번호 확인후 수정/다시입력요청 
    public boolean boardUpdate(BoardVO vo)
    {
    	boolean bCheck=false;
    	try
    	{
    		//1. 연결 
    		getConnection();
    		//2. SQL문장 
    		String sql="SELECT pwd FROM jspBoard "
    				  +"WHERE no=?";
    		//3. 오라클 전송
    		ps=conn.prepareStatement(sql);
    		//4.?에 값을 채운다
    		ps.setInt(1, vo.getNo());
    		//5. 실행
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		String db_pwd=rs.getString(1);
    		rs.close();
    		
    		// 비교
    		if(db_pwd.equals(vo.getPwd()))
    		{
    			bCheck=true;
    			// 실제 수정 
    			sql="UPDATE jspBoard SET "
    			   +"name=?,subject=?,content=? "
    			   +"WHERE no=?";
    			// 전송
    			ps=conn.prepareStatement(sql);
    			// ?에 값을채운다
    			ps.setString(1, vo.getName());
    			ps.setString(2, vo.getSubject());
    			ps.setString(3, vo.getContent());
    			ps.setInt(4, vo.getNo());
    			
    			ps.executeUpdate();
    		}
    		else
    		{
    			bCheck=false;
    		}
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return bCheck;
    }
    // 5. 삭제하기  ==> 게시물번호 
    // 매개변수 => 3개이상 (클래스,배열) 
    public boolean boardDelete(int no,String pwd)
    {
    	boolean bCheck=false;
    	try
    	{
    		//1. 연결
    		getConnection();
    		//2. sql
    		String sql="SELECT pwd FROM jspBoard "
    				  +"WHERE no=?";
    		//3. 오라클 전송
    		ps=conn.prepareStatement(sql);
    		//4. 실행전에 ?에 값을 채운다
    		ps.setInt(1, no);
    		//5. 실행
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		String db_pwd=rs.getString(1);
    		rs.close();
    		/////////////////////////////////// 비밀번호 읽기 완료 
    		if(db_pwd.equals(pwd))
    		{
    			bCheck=true;
    			// 실제 데이터 삭제
    			sql="DELETE FROM jspBoard "
    			   +"WHERE no=?";
    			ps=conn.prepareStatement(sql);
    			ps.setInt(1, no);
    			ps.executeUpdate();//commit => DELETE , UPDATE , INSERT 
    			// SELECT => executeQuery() => commit이 없다 
    		}
    		else
    		{
    			bCheck=false;
    		}
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return bCheck;
    }
    // 5-1
    public int boardCount()
    {
    	int count=0;
    	try
    	{
    		getConnection();
    		String sql="SELECT COUNT(*) FROM jspBoard";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		count=rs.getInt(1);
    		rs.close();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return count;
    }
    // 6. 찾기     ==> VO가 여러개 ==> ArrayList 
    /*
     *   JSP에서 요청 ==========> JSP ========> 오라클연동(DAO) ======> find.jsp ======> 화면 
     *   list.jsp(submit) find.jsp => 동작순서
     */
    public ArrayList<BoardVO> boardFindData(String fs,String ss)
    {
    	ArrayList<BoardVO> list=new ArrayList<BoardVO>();
    	try 
    	{
    		getConnection();
    		String sql="SELECT no,subject,name,regdate,hit "
    				  +"FROM jspBoard "
    				  +"WHERE "+fs+" LIKE '%'||?||'%'";
    		/*
    		 *   테이블 / 컬럼명 => ?를 사용하면 안된다 
    		 *   "WHERE ? LIKE '%'||?||'%'"
    		 *   ps.setString(1,fs) 'subject'
    		 *   ps.setString(2,ss) 
    		 *   
    		 *   => WHERE 'name' LIKE '%'||'이'||'%'
    		 */
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, ss); // 홍길동 ==> '홍길동' => ''를 첨부한다 
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			BoardVO vo=new BoardVO();
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
}












