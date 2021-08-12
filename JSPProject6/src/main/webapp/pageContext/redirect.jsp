<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%--
       화면변경 , URL주소도 변경 
       각 JSP마다 request,response 
       ========================== request,response => 주인 (URL주소)
   --%>
  <h1>ID:<%= request.getParameter("id") %></h1>
  <h1>Password:<%= request.getParameter("pwd") %></h1>
</body>
</html>