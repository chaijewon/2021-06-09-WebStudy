<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       1. 1장
          ===
          URL / URI
          https://sports.v.daum.net /v/20210810090218714 (URL)
          ========================= ====================
                 서버정보                클라이언트 요청(URI)
          
          http://localhost  /JSPProject3/total/total.jsp
          ================  ============================ URI
                서버정보      ============
                            ContextPath(루트)
          실행순서 (톰캣 => 웹서버(테스용))
          브라우저 ================> 서버(웹서버) =====> a.jsp를 실행하기 위해서 웹애플리케이션서버(톰캣)
          (유저)       /a.jsp   번역하지 않는 파일(html/xml)        |
                                                               |
                                                             a.jsp 찾는다 (a.jsp가 없는 경우 => 404)
                                                               |
                                                             자바로 변경 a_jsp.java
                                                               |
                                                              컴파일 => a_jsp.class
                                                               |
                                                              실행 (인터프리터) 
                                                             ===============
                                                              메모리에 HTML만 출력 
                                                              ================= 해당 브라우저에서 읽어 간다
                                                  *** 톰캣 (JSP엔진,WAS,미들웨어) : 기술면접 
          jsp는 메소드 영역 
          ==============
          a.jsp 
          ===== 자바변경 
             public class a_jsp extends HttpServlet
             {
                 <%! %> ==> 메소드 선언 , 멤버변수 설정 
                 // 생성자 => 초기화 (web.xml)
                 public void _jspInit()
                 {
                 }
                 // 소멸자 ===> JSP (새로고침 , 파일이동 => 자동으로 메모리 해제) 메모리해제 => 새로운 파일이 생성
                 public void _jspDestory()
                 {
                 }
                 // 사용자 요청처리 
                 public void _jspService(HttpServletRequest request,HttpServletResponse response)
                 {
                      //내장 객체
                      ServletContext application;
                      JspWriter out
                      HttpSession session
                      PageContext pageContext
                      ServletConfig config
                      Exeption exception
                      
                      사용자가 브라우저에서 볼 수 있는 영역
                      =========================================
                        JSP 코딩 => 메소드 내용을 코딩 
                        <% 
                            영역 => _jspService()  => 지역변수 , 일반자바 : 메소드호출 , 제어문 
                        %>
                        out.write("<!DOCTYPE html>")
						out.write("<html>")
						out.write("<head>")
						out.write("<meta charset="UTF-8">")
						out.write("<title>Insert title here</title>")
						out.write("</head>")
						out.write("<body>")
						<%= %> => out.println("") => 데이터를 화면 출력 
						out.write("</body>")
						out.write("</html>")
                      =========================================
                      
                 }
             }
          3장 
          ===
           page 지시자 => JSP파일에 대한 정보 
           <%@ page(지시자명) 속성="값" 속성="값" %> 
           속성 
           ===
           contentType   ==> 브라우저에 알림 (html,xml,json)
           =========== 문서형식 
           1. html = contentType="text/html;charset=UTF-8" => html번역 요청 , 한글사용여부 (2byte)
           2. xml = contentType="text/xml;charset=UTF-8" => xml변역 요청 , 한글사용여부 
           3. json = contentType="text/plain;charset=UTF-8" => json요청 , 한글사용여부 
                                 =========================== ajax,웹앱(코틀린)
           import => 자바라이브러리 로드 
                     <%@ page import="java.io.*"%>
                     <%@ page import="java.util.*"%>
                     <%@ page import="java.io.*,java.util.*"%>
           errorPage => 에러시에 화면에 출력할 JSP를 지정 (모든 에러)
           isErrorPage => 종류별 처리가 가능 (404,500,403,415...) ==> web.xml
           buffer : HTML/XML을 출력해 두는 메모리공간의 크기 (default:8kb, ===> 화면 출력이 미완성:16kb)                                                
        => 자바를 코딩하는 부분 (java/html)
           자바 코딩하는 부분 => 스크립트 
           1. 스크립트릿  <% %>  ========> 영역안에서는 자바문법을 적용한다 => // /**/ 문장 종료시 ;
           2. 선언식     <%! %> ========> 메소드 만드는 영역 (사용빈도가 없다)
           3. 표현식     <%= %> ========> out.println(); => ()안에 들어가능 코딩 => ;을 사용하면 안된다  
              String name="";
              <%= name;%> (오류)   => out.println(name;); 
              <%= name %>       
        => 내장 객체 
           request => 사용자의 요청정보 (사용자가 보내준 데이터 => request(톰캣)):회원가입,로그인,글쓰기..
           response  => 응답 (HTML,XML),cookie,화면을 서버에서 이동, 데이터보내기전에 다른 정보를 먼저 보낼 수 있다(header)                            
           1) request => 주요메소드와 기능 
              1. 서버정보 , 클라이언트 정보
                 = getServerName() , getServerPort() , 
                   *****getRequestURL() , *****getRequestURI() , *****getContextPath()=>MVC구조
                 = getRemoteAddr(): 중복 조회수 , 로그파일
              2. 사용자 요청정보 
                 = 단일값 읽을 경우 : ********getParameter() 
                 = 여러개 값 읽을 경우 : getParameterValues() => checkbox 
           2) response => 주요메소드와 기능 
                 = 사전에 다른 데이터 전송 , 쿠키 전송 => setHeader():다운로드 , addCookie() 
                                        ======= 최신방문 
                 = 서버에서 화면 이동 : ***sendRedirect() 
           => request/response => 완전한 게시판 =>header => 자료실(파일 업로드/다운로드)
                                  ========== 답변형게시판 ======= 댓글게시판 ======= 갤러리게시판 ===== 후기게시판 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>