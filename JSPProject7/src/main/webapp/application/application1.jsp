<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     application : ServletContext 
     1. 서버정보 => 버전 , 서버명 , 프로토콜 : getMajorVersion() , getMinorVersion() , getServerInfo()
     2. web.xml에 등록된 데이터 읽기 ===> getInitParameter("<param-name>값")
     3. log파일 만들때 
     4. 자원 정보 (file,실제 저장 위치) 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  ***드라이버명:<%= application.getInitParameter("driver") %><br><!-- <param-name>driver</param-name> -->
  오라클 주소:<%= application.getInitParameter("url") %><br>
  유저명:<%= application.getInitParameter("username") %><br>
  비밀번호:<%= application.getInitParameter("password") %><br>
  서버명 : <%= application.getServerInfo() %><br>
  버전 : <%= application.getMajorVersion() %><br>
  버전2: <%= application.getMinorVersion() %><!-- 서블릿 버전  5.0 -->
  <!-- 
     10.08
     == ==
     5(구조가 변경).35(라이브러리 메소드 추가)
     = ==
   -->
   <!-- log에 출력  -->
   <%
       application.log("driver:"+application.getInitParameter("driver"));
	   application.log("url:"+application.getInitParameter("url"));
	   application.log("username:"+application.getInitParameter("username"));
	   application.log("password:"+application.getInitParameter("password"));
	   // 서버개발자 => 서버 (클라이언트) => 서버관리자 (모니터링)
	   /*
	         admin : 관리자 (공지사항 , 게시판 , 회원정리) => 테이블 출력 (관리모드)
	         *** user : 화면 
	   */
   %>
   <%=
      application.getRealPath("/")
   %>
   <%--
        C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPProject7\
    --%>
</body>
</html>





