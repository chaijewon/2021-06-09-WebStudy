<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%--
     errorPage지정 => 오류가 나면 지정된 파일을 출력 
     => 화면 이동 
        =======
        1) sendRedirect() => URL주소 자체가 변경 ==> 사용자가 전송한값 (request=>초기화)
           ==========================================================
        2) forward() => URL주소는 변경되지 않고 화면 내용만 변경 : error페이지
           http://localhost:8080/JSPProject1/jsp/basic5.jsp (request=>초기화가 되지 않는다)
           ==============================================MVC구조 중심
     => 프로그램 (개발자(X), 특정인(X)) => 처음 사용하는 사용자 증심으로 사이트 제작 (User중심) daum/naver
        유지보수 : 사용자가 기능 요청 
                 ==============
        개발자 : 언어 만든 업체에 요청 (오라클)  ==> 버전 변경
 --%>
<%--

     1. 사용자의 요청값을 받는다 (페이지,이름,동...)
     2. 데이터베이스 연결 
     3. 데이터 읽기
     4. 읽은 데이터 출력 
     ****** 결과를 반드시 알려준다 (회원가입:메인페이지=로그인처리,회원탈퇴 완료(메세지), 예매완료:마이페이지)
     ****** 사용자 요청이 있으면 확인을 해준다
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <!-- error 발생(HTML은 에러가 없다) -->
  <%-- 66page --%>
  <%
       int sum=0;
       // 1~10의 합을 구해서 출력 
       for(int i=1;i<=10;i++)
       {
    	   sum+=i;
       }
  %>
  <%-- 67page  --%>
  <%="1~10까지의 합:"+sum %>
  <%--68page 선언식:메소드제작  --%>
  <%!
      // 자바로 클래스를 만들어서 활용  ==> JSP의 단점은 모든 파일이 노출된다 =>Java(.class)
      public int add(int a,int b)
      {
	      return a+b;
      }
      public int minus(int a,int b)
      {
    	  return a-b;
      }
  %>
  <%=
      add(10,10) // JSP (권장)
  %>
  <br>
  <%
     out.println(add(10,5));// 서블릿 방식
  %>
  <br>
  <%=
     minus(100,50)
  %>
  <%
     out.println(minus(100,50));
  %>
</body>
</html>




























