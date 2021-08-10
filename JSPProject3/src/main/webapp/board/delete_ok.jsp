<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    // setCharacterEncoding => 한글이 전송된 경우 (숫자,알파벳,특수문자)
    //1. 전송된 데이터 받기 
    String pwd=request.getParameter("pwd");
    String no=request.getParameter("no");
    
    // DAO연결 => 비밀번호 확인 => true(삭제),false(history.back())
    BoardDAO dao=new BoardDAO();
    // dao => delete()처리 
    boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
    // 결과에 따라서 화면이동 ==>  true:sendRedirect("list.jsp")    /  false:history.back(delete.jsp)
    if(bCheck==true)
    {
    	response.sendRedirect("list.jsp");
    }
    else
    {
%>
       <script>
       alert("비밀번호가 틀립니다!!");
       history.back();
       </script>
<%
    }
%>
