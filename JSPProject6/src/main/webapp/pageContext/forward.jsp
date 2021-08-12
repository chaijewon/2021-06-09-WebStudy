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
        화면 변경 , URL주소는 변경되지 않는다 
        
        link.jsp  ========> temp.jsp ========> forward.jsp
                               |                  실행된 결과를 temp.jsp에 덮어 쓴다
                             request를 유지하면 forward.jsp에 실행했된 HTML을 읽어온다 (MVC)
   --%>
  <h1>ID:<%= request.getParameter("id") %></h1>
  <h1>Password:<%= request.getParameter("pwd") %></h1>
</body>
</html>