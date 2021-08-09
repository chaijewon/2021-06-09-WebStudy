<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    사용자가 입력한 값을 받는 연습(회원가입,글쓰기...) => request에 담아서 들어온다
    파일명?변수=값&변수=값 
         ============= request에 첨부된 상태에서 넘어 온다 (request에 담아주는 프로그램=> 톰캣)
         POST/GET 상관없이 => 전부 request안에 존재 
         
     request : 요청정보 (내장 객체) 이미 만들어져 있다 
                      ========= JSP에서 제공하는 내장 객체 
                      ***request : 요청정보
                      ***response : 응답정보 , 페이지 변경 
                      =========
                      ***session (8장/9장) =>  cookie 
                      ============
                      out
                      ***pageContext
                      page
                      config
                      exception
                      application
                      ============ 4장
       class => HttpServletRequest  
       73page / 76page
       = 클라이언트 정보 
         ***IP읽기 => getRemoteAddr() => log파일 
       = 서버 정보 
         getCharacterEncoding()
         getMethod() => GET/POST
         getProtocol() => 8080
         ***getRequestURL()
         ***getRequestURI()
         ***getContextPath()
         getServeName()
         getServerPort()
       = 사용자가 보낸 분 데이터 읽기 
         ***getParameter()
         ***getParameterValues()
       
       http://localhost:8080  /JSPProject2/jsp/input.jsp?no=10  ===> URL
                              ============              ======= request안에 첨부가 된다 
                                  |
                               ContextPath
              ========= ====  ==========================
                |        |                |
              서버주소    서버포트           URI 
 --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>클라이언트 정보 출력</h1>
   <u1>
     <li>***1.사용자(User) IP:<%= request.getRemoteAddr() %></li><!-- 게시물에서 조회수 증가,로그파일 -->
     <li>2.사용중인 한글 코딩:<%=request.getCharacterEncoding() %></li>
     <!-- 
            송신 ========> 수신
            EUC-KR       EUC-KR (UTF-8)
            UTF-8        UTF-8(EUC-KR로 받으면 한글깨짐) 
            ASC,UTF-8=> 알파벳,숫자 
            한글, 다른 나라 언어 
            ========================================== 통합개발 (한개의 프로젝트:Git)
            *** 한글전송 , 경로명 (윈도우 , 맥)
                               =====  ===  /
                               c:\\
      -->
     <li>3.사용중인 contentType:<%=request.getContentType() %></li>
     <li>***4.URL:<%=request.getRequestURL() %></li>
     <!-- MVC , 파일 업로드 , 다운로드 -->
     <li>***5.URI:<%=request.getRequestURI() %></li>
     <li>6.Method(GET/POST):<%=request.getMethod() %></li>
     <li>7.프로토콜(http):<%=request.getProtocol() %></li>
     <li>***8.루트주소(ContextPath):<%=request.getContextPath() %></li>
     <li>9.서버주소:<%=request.getServerName() %></li>
     <li>10.서버포트:<%=request.getServerPort() %>
   </u1>
</body>
</html>









