<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      132,133page
      1. 내장 객체(기본 객체)
         request,response,application,(session,cookie),out
      2. 사용범위 (사용자 데이터)
         ======
         1) request : 전송시마다 사용(한번 사용하고 초기화) => JSP마다 request
                      = 공유 (JSP <==> JSP)
                            ============== include , forward
                                           ================== request를 공유할 수 있다 
                      = include , forward외에 화면 이동하면 request는 초기화
         2) session : 서버에 저장 => 웹 프로그램 전체 JSP에서 사용 (전역변수) = 한개만 가지고 있다
         ================
         3) application
         4) page
         ================(사용빈도가 거의 없다)
         
      6장 
      ===
        에러 처리 
        1) 전체 에러처리 => <%@ page errorPage="에러시 이동 파일"%> 404,500...(한개설정)
        ======================================================================================
        *** 2) 에러별 처리 (404처리 , 500처리, 403....)
        3) 에러타입처리 => NumberFormatException , ArrayIndexOutOfBoundsException : 예외처리별 처리 
                     =>  / zero
        ============================= exception ==============================================
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <center>
     <h1>시스템에 의한 에러가 발생했습니다</h1>
   </center>
</body>
</html>





