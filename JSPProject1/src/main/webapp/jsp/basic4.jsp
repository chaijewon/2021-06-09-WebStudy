<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!-- public void _jspService(){ 사용자 요청처리가되는 곳  => JSP는 메소드 영역이다 (브라우저에 실행할 내용)
     public class MyServlet{
       public void service(request,response)
       {
            out.println("<html>")
       }
     }
-->
<%
    // 데이터 수집
    ArrayList<String> list=new ArrayList<String>();
    // 오라클에서 데이터 읽기 
    list.add("홍길동");
    list.add("심청이");
    list.add("춘향이");
    list.add("이순신");
    list.add("강감찬");
    list.add("을지문덕");
    list.add("박문수");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <ul>
   <%
      for(String name:list)
      {
   %>
    	  <li><%= name %></li>
   <%
      }
   %>
  </ul>
  <hr>
  <ol>
    <%
      // 스크립트릿 => 자바 코딩 
      for(String name:list)
      {
    %>
    	  <li><%= name /*화면에 출력할 데이터 내용*/%></li>
    <%
      }
    %>
  </ol>
  <hr>
  <dl>
    <%
      for(String name:list)
      {
    %>
    	  <dd><%= name %></dd>
    <%
      }
    %>
  </dl>
</body>
</html>
<!--  } -->