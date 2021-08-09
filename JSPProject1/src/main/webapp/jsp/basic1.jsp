<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       1. JSP (Java Server Page) : 서버에서 실행하는 자바파일
       2. 실행과정
                           톰캣 
          basci1.jsp ===============> 자바파일로 변경 ===========> JVM
                                      basic1_jsp.java         컴파일 => basic1_jsp.class (javac)
                                      (서블릿)                      |
                     실행 (ctrl+f11)                               |
                                                               인터프리터 (java)
                                                                 => 출력 (HTML만 출력)
                                                                => 브라우저에서 읽어서 출력 
                      out.println("<html>");
                      out.println("<body>");
                      out.println("</body>");
                      out.println("</html>"); ===> 순수 자바로 만든 파일 => Servlet (Server+Let)
                                                   let은 가벼운 프로그램 (서버에서 실행되는 가볍다)
                      =>자바만 가지고 코딩 : 단점 
                        => 수정시마다 컴파일 : 색상을 변경 => 컴퍼일없이 사용하는 파일(스크립트)을 제작 => JSP
                      JSP : 사용이 편리하게 만들어져 있다 
                            기본 Java만 알고 있어도 제작이 가능 
                            호환성이 좋다 (운영체제와 상관없이 실행이 가능)
                            단점: 보안에 취약하다 , 확장성이 약하다 (재사용) => 자바(상속,포함)
                            ==> 보안 , 확장성 , 재사용 => MVC (JSP는 출력만하는 역할 => View)
                                ========================== 실무
                      JSP는 class 
                      public class basic1_jsp extends HttpServlet
                      {
                           public void _jspInit()
                           {
                           }
                           public void _jspDestory()
                           {
                           }
                           public void _jspServiec()
                           {
                               // 실행할 HTML을 첨부 => 실제적으로 메소드안에 내용을 채워는 역할
                               // 일반유저에 전송할 화면을 만든다
                                               =====
                                               HTML/CSS/JavaScript(Jquery) 
                                               중간에 필요한 내용은 java로 처리 
                           }
                      }
                      => JAVA파일을 만드는 것이 아니라 => _jspService()메소드를 만들어 주는 역할
                         => 사용자 요청에 대한 응답 내용을 만드는 영역 
                         => 프로그램 편리 => 
                            생략 
                            => HTML앞에 
                               out.write("<html>")  ==> out.write("") => 생략이 가능 
                               ======================================
                               <html>
                      
       3. URL처리 
             http://localhost:8080   /JSPProject1/jsp/basic1.jsp  => URL
             ====   ========= ===     ===========================
             프로토콜  서버IP    서버포트     사용자 요청한 파일경로 => URI
             => 웹 사이트는 사용자가 요청 할때 (중복이 없는 내용)=> 파일 ==> URL주소 마지막에 반드시 파일명을 추가 
             => 파일이 없는 경우는 서버에서 임시파일 전송 (404)
             => 생략할 수 있는 부분 (메인페이지에서 생략이 가능)
     ===========================================================================================
       4. 디렉티브(지시자) 
             = page : JSP파일에 대한 정보 
                      => 속성 
                      contentType=""  => 변환 (text/html,text/xml,text/plain)
                                             ========== ======== =========== JSON
                      response.setContentType(); => 브라우저에서 출력하는 타입을 지정 
                      import => 자바라이브러리 첨부 
                      errorPage => error가 난 경우에 이동하는 파일을 지정  
                      session사용여부 
                      buffer:메모리 크기 지정 
             = include : JSP안에 특정부분에 다른 JSP를 추가  => file=""
                         => 조립식 프로그램 
             ================================================================
             = taglib : 태그로 자바문법을 제작 (자바없이 태그만 이용해서 처리) => JSTL
                        <c:forEach> => for
                        <c:if> => if
             =========================================================MVC====
       5. 스크립트
          자바표현식 => 자바 코딩 위치 
          <% %> : 스크립트릿 ==> 일반 자바  => 연산자처리 , 변수선언 , 제어문처리 , 메소드 호출 
          <%! %> : 선언식 ==> JSP영역이 메소드안에 코드처리 
                            =======================
                            멤버변수나 메소드를 제작할 수 없다  ==> <%! 멤버변수,메소드제작 %> => 사용빈도가 없다
          <%= %> : 표현식 ==> out.println("출력할 내용물을 설정")
       6. 내장객체
       7. 표현식 
       8. 액션태그
       9. 자바빈 (VO)
       10.EL
       11.JSTL
       12.MVC   
       
       => Model1 ==> (2000년)
       => Model2 ==> MVC (현재 사용기술)
       
       교재 21page
       ==========
       웹사이트를 만들때 사용 기술
       1) 개발 언어 : 자바 / 코틀린 => 데이터베이스 연결해서 브라우저에 데이터 출력 
                    ===
       2) WAS : JSP를 자바로 변경 => 컴파일 => 실행 => 브라우저에서 읽을 수 있게 HTML로 변환 역할 
          ==== 톰켓 , 레진 ...
       3) 브라우저로 전송를 하기 위해서 HTML을 출력하는 역할 : 서블릿(자바), JSP
       4) 브라우저에서 실행 파일 : HTML/CSS/JavaScript
          역할분담 
            1. 데이터를 저장하는 장소  : 오라클 
            2. 데이터를 읽어서 브라우저로 전송  : 자바 
            3. 화면 출력    : HTML / CSS
            4. 브라우저에서 제어 : JavaScript
            ==================================  + 웹프로그램 
       5) 브라우저를 제어하는 (자바스크립트의 라이브러리) => Jquery , AngularJS(구글) . ReactJS(페이스북) , VueJS,NodeJS
                                                 =========
       6) 자바에서 데이터베이스 연결 : JDBC(~DAO), JPA , MyBatis , Hibernate 
                                                  ========
       7) 데이터베이스 : 오라클 , MySql(마리아디비) , MS-SQL , DB2...
                     ====== 빅데이터 : 몽고디비 , 카산드라 
       8) 통신 프로토콜 : HTTP 
       
       page 22
       =======
       1. 변수 , 데이터형 
       2. 연산자 , 제어문 
       3. 클래스 제작 (생성자 , 멤버변수 , 메소드) => 객체지향의 3대 요소 (캡슐화:~VO , 상속,포함 , 오버라이딩(수정))
       4. 인터페이스 : 여러개의 클래스를 1개로 묶어서 제어
       5. 예외처리 : 비정상종료를 방지하고 정상 수행을 할 수 있게 만드는 기능 , 사전에 예어를 방지하는 프로그램 
       6. 라이브러리 
            java.lang (Object , String , StringBuffer , Math)
            java.util (Date, Calendar,ArrayList,Map,Vector,StringTokenizer) 
                                      ===================== 제네릭스 (형변환 => 통합) Object => <>원하는 데이터형으로 변환
            java.text (SimpleDateFormat , MessageFormat)
            java.io   (File , FileInputStream,FileOutputStream,FileReader,FileWriter,BufferedReader)
            java.net  (URL , URLEncoder)
       7. HTML의 기본태그 , 약간의 CSS 
          JavaScript / Jquery 
       8. 준비물 
          = JDK
          = Tomcat
          = 소스 코딩 => 편집기(이클립스)
       ===> URL => 사이트 전체 주소 
       https://sports.v.daum.net  /v/20210809063444013 ==> URL
       =========================  ====================
          서버 주소                      사용자 요청 파일 (URI)
               -----------------
                 도메인 
                 포트번호 : 80 (생략이 가능)
       ===> ?는 사용자가 요청한 데이터를 다른 파일로 전송  (37page)
            a.jsp?변수=값
            a.jsp?변수=값&변수=값
                  ============ 보내는 데이터가 2개이상 &구분해서 사용 => 공백이 있으면 안된다 
                  
       38page  : 실행 과정 
       =======
       DNS 
         localhost = 127.0.0.1
         www.daum.net = 203.133.167.81
         www.naver.com = 125.209.222.141
                DNS
                 | ip변환 
       브라우저 ==============> 203.133.167.81 컴퓨터 접근 =======> 요청한 파일을 찾는다 
              www.daum.net/index.html                               |
                                                                 메모리에 저장 (HTML/XML)
                                <===============================
                                   브라우저에서는 메모리에 저장된 데이터를 읽어서 출력 (버퍼)
              *** 브라우저에서는 HTML/XML/이미지외에 다른 모든것은 일반 문자열 취급을 한다 
                             ==============
                             자바도 변역없이 그냥 문자열로 출력을 한다 
                             
              *** 44page 
                  브라우저   =========>  was(tomcat)  =======> jsp
                                      ============ JSP/Servlet번역기 => HTML/XML
              *** jsp (45page)
                  1) 프로젝트 
                  2) webapp => 폴더 제작 => jsp파일 제작 
                  ==================================
                  src/main/java => 패키지제작 => 자바 코딩 (데이터베이스 연결 , 웹 크롤링 , 데이터분석 , 통계)
                  src
                  ===
                   => main
                     => webapp =====> web파일이 들어가는 위치(html,xml,그림파일,css,js)
                         => WEB-INF ===> 환경설정 파일 (환경설정: XML , properties)
                            =======
                               => lib : 자바에서 사용하는 라이브러리추가(외부파일) => ojdbc8.jar,servlet-api.jar
              *** 에러(48page) 
                  ===
                  404 : 파일이 없는 경우  => <a> 태그, ajax
                  500 : 소스에러 (자바 오류)
                  415 : 데이터를 잘못보낸 경우 => [] , ArrayList
                  403 : 접근 거부 
                  200 : 정상 수행 => 정상적으로 화면 출력 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <center>
   <a href="a.jsp">aa</a>
   <%
       int a=10/0;
   %>
   </center>
</body>
</html>






