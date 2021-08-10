<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    //1. 한글 변환 
    try
    {
    	request.setCharacterEncoding("UTF-8"); //인코딩(byte):1byte 디코딩(unicode):2byte
    }catch(Exception ex){}

    //2. 전송된 값을 받는다 
    String no=request.getParameter("no");
    String name=request.getParameter("name");
    String subject=request.getParameter("subject");
    String content=request.getParameter("content");
    String pwd=request.getParameter("pwd");
    
    //3. 묶어서 => DAO로 전송 => DAO에서 수정처리 
    BoardVO vo=new BoardVO();
    vo.setNo(Integer.parseInt(no));
    vo.setName(name);
    vo.setSubject(subject);
    vo.setContent(content);
    vo.setPwd(pwd);
    
    BoardDAO dao=new BoardDAO();
    // 수정하기 메소드 호출 => 매개변수 => vo를 전송 
    boolean bCheck=dao.boardUpdate(vo);
    //4. 이동 => 내용보기로 이동 (내용이 변경)
    if(bCheck==true)
    {
    	// 수정이 된 경우(detail.jsp)
    	response.sendRedirect("detail.jsp?no="+vo.getNo());
    }
    else
    {
    	//비밀번호가 틀리다 => 원상복귀(update.jsp)
%>
        <script>
        alert("비밀번호가 틀립니다\n다시 입력하세요");
        history.back();
        </script>
<%
    }
    /*
        자바 : 클래스에서 클래스로 값을 전송 
               A        B 
               ==> 메소드의 매개변수 
        웹(jsp) : jsp에서 jsp로 값을 전송 
               ==> 웹 주소를 이용해서 전송 ==> URL ==> (받을 파일명?변수=값)
    */
%>











