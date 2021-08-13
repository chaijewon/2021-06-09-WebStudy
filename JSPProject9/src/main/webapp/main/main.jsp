<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     incude : 공통적으로 사용되는 영역을 한개만 만들어서 포함 
              =====
                메뉴(header => 검색기,로고), 로그인/로그아웃 , Footer
       ================================================
       
         로고              검색기  (고정) <정적 include>
               => 파일명을 변경할 수 없다
               <%@ include file="고정"%> include지시자  
       ================================================
                            메뉴  (고정) 
                        <%@ include file="고정파일명만 사용"%> : 소스를 합쳐서 컴파일 (소스 같은 변수명이 있는 경우 오류)
       ================================================
         로그인      |
        /로그아웃    |     Content(내용) => 메뉴 클릭시마다 변경
                   |     
               <동적 include> <jsp:include page="변수"> : jsp마다 따로 컴파일 => HTML만 합쳐준다 (변수명이 동일해도 상관없다)
                   |
                   |      String jsp=""
                          1=> jsp="movie.jsp"
                   |      2=> jsp="list.jsp"
                   |
                   |
       ================================================
             개인보호 방침 , 회사 정보 (고정)
             <%@ include file="고정파일명만 사용"%>
       ================================================
       
       a.jsp 
       <html>
       <body>
         <% int a=10; %>
         <%= a%>
         <hr>
         <%@ include file="b.jsp" %> => 정적 include ==> 변수 (메뉴,footer)
         ===========================
            <html>
	       <body>
	         <% int a=100;%>
	         <%= a%>
	       </body>
	       </html>
	       </body>
	       </html>
       
       b.jsp
       <html>
       <body>
         <% int a=100;%>
         <%= a%>
       </body>
       </html>
       
       
       a.jsp
       <html>
        <body>
         <% int a=100; %>
         <%= a%>
         <hr>
         <jsp:include page="b.jsp">   => a.jsp컴파일 , include파일(b.jsp) 컴파일 => a.jsp+b.jsp
       </body>
      </html>
      
      ==> 컴파일 
          <html>
            <body>
              100
              <hr>
              <html>
	          <body>
	           100
	           </body>
	         </html>
            </body>
          </html>
      
      b.jsp
       <html>
        <body>
         <% int a=100; %>
         <%= a%>
       </body>
      </html>
      
        ==> 컴파일
          <html>
           <body>
           100
           </body>
         </html>
         =========> 조립식으로 코딩 ==> 페이지 모듈화 
         =========> 
              JSP
              ====
               1. Component기능
                  = 사용자 입력폼  insert.jsp
                  = 입력된 데이터 처리 insert_ok.jsp
                  = 개별적인 JSP
               2. Container기능 =================> 템플릿 
                  =여러개의 JSP를 한번에 묶어서 한페이지  
                  
        include => JSP안에 특정 위치 다른 JSP를 포함 (사이트(X))
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
    String jsp="sub.jsp";
    jsp="";
%>
<body>
  <center>
    <h1>main.jsp영역</h1>
    <% int a=100; %>
    <%= a %>
    <hr>
    <%-- <%@ include file="<%=jsp%>" %> --%><!-- 파일을 변경할 수 없다 -->
    <jsp:include page="<%=jsp %>"></jsp:include>
  </center>
</body>
</html>