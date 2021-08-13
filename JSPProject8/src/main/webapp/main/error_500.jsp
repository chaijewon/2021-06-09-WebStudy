<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <center>
    <h1>프로그램 소스에러 발생</h1> <!-- 이미지처리 -->
    <sub style="color:red"><%= exception.getMessage() %></sub>
  </center>
</body>
</html>