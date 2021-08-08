<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>영화 목록</h1>
  <h3>ID:<%= request.getParameter("id") %></h3>
  <h3>Password:<%=request.getParameter("pwd") %></h3>
</body>
</html>