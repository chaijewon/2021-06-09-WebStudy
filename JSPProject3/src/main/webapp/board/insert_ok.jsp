<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
     // 한글 변환 
     try
     {
    	 request.setCharacterEncoding("UTF-8");
    	 // encoding => decoding(원상복귀)
         //http://localhost/JSPProject3/board/insert_ok.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99&subject=%EB%AC%B8%EC%9D%98+%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4&content=aaa&pwd=aaa
     }catch(Exception ex){}

     // 값을 받는다 
     // <input type=text name=name>
     String name=request.getParameter("name");
     String subject=request.getParameter("subject");
     String content=request.getParameter("content");
     String pwd=request.getParameter("pwd");
     
     // 데이터를 묶어서 DAO로 전송
     BoardVO vo=new BoardVO();
     vo.setName(name);
     vo.setSubject(subject);
     vo.setContent(content);
     vo.setPwd(pwd);
     
     BoardDAO dao=new BoardDAO();
     dao.boardInsert(vo);
     
     // 화면 이동 
     response.sendRedirect("list.jsp"); // sendRedirect(): 서버에서 화면 이동 , GET만 사용이 가능 
     // response에서 응답 => 화면이동 , 그 자리에서 응답 
%>






