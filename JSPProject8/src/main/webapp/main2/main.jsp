<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../jsp/error.jsp"%>
<%--
      1. errorPage : 통합
      2. 예외처리별 에러  : Exception 
      3. 에러 코드별 
         ========
          401(403) : 접근거부 (인증)
          404 : 파일이 없는 경우 (요청) ==> <a> , <form> , sendRedirect() , location.href=""
                                       경로 (include) => 한개의 파일명으로 변경
                                       
          500 : 소스에러 (DB,Manager) 
          503 : 백신예약 => 부하 ...
          200 : 정상 수행 ==> 화면 출력 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
      //int a=10/0;
      //int[] arr=new int[2];
      //arr[2]=100;
      String no="10 ";
      int i=Integer.parseInt(no);
  %>
</body>
</html>