<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%--
      error_ar.jsp => 0으로 나눌 경우 (산술) 
      error_nf.jsp => 정수 변환 (X)
      error_ai.jsp => 배열 범위 초과 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <center>
    <h1>0으로 나눌 수 없습니다</h1>
    <sub style="color:red"><%=exception.getMessage() %></sub>
  </center>
</body>
</html>