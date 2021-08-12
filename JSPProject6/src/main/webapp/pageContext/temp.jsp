<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String mode=request.getParameter("mode");
     // id , pwd
     int i=Integer.parseInt(mode);
     if(i==1)
     {
    	 response.sendRedirect("redirect.jsp");// id,pwd 받아볼 수 있는가? => null (request초기화)
     }
     else if(i==2)
     {
    	 pageContext.forward("forward.jsp");// id,pwd 받아볼 수 있는가? => admin,1234(request를 유지)
    			 // <jsp:forward page=""> , <jsp:include page=""> => 7장
     }
%>