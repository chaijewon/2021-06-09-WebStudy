<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      pageContext => page 119 ~ page 121
      ===========
      1. 기본 객체 구하기 (사용빈도가 없다)
         내장객체 구하기 
          request => pageContext.getRequest()
          response => pageContext.getResponse()
          session => pageContext.getSession()
      2. 흐름 제어 (무조건 사용=>사이트 제작이 가능)
         include,forward
      3. 에러 구하기 (사용빈도가 없다)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  IP : <%= request.getRemoteAddr() %><br>
  <%--
        out객체 => out객체를 구할때 한번정도 사용이 가능 => 다운로드시에 나온다 
   --%>
  IP : <%= pageContext.getRequest().getRemoteAddr() %>
</body>
</html>