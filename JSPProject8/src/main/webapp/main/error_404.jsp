<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%--
    exception객체(내장객체) 사용시에는 반드시  isErrorPage="true"로 설정해야 사용이 가능 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <center>
    <h1>파일을 찾을 수 없습니다</h1>
    <%-- <sub style="color:red"><%= exception.getMessage() %></sub> --%>
  </center>
</body>
</html>