<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      4장 
      ===
      1. JSP 순서 (웹 프로그램은 브라우저 주소창을 통해서 파일을 실행=> 
                  실행결과를 메모리에 저장(HTML/XML) => 응답 => 브라우저에서 읽어간다) 주소에는 항상 파일명을 첨부
                             a.jsp                 a.jsp
         클라이언트 요청(브라우저) =====> 웹서버(httped) ======> WAS(톰캣,제우스(실무)) 
                                                                |
                                                             JSP파일 찾기 ==> 없는 경우(404파일 전송) 
                                             
                                                                |  찾은 경우 
                                                             JSP를 자바파일로 변경 (a_jsp.java:서블릿)
                                                                |
                                                             변경된 자바파일 컴파일 => 에러발생(500파일 전송)
                                                                | 정상수행 
                                                             컴파일된 파일 생성 (바이트 코드) a_jsp.class
                                                                | 실행 
                                                             메모리에 저장 (결과값)
                                                                   ==> HTML만 출력 
                                                                       ==========
                                                                         ==> 브라우저에 읽어서 한줄씩 번역
                                                             *** 자바는 <% %>가 없는 경우 
                                                                 브러우저에서 일반 텍스트로 인식 
         => 일반 자바
            public class A
            {
                public static void main(String[] arg)
                {
                    System.out.println("Hello Java");
                }
            }
            ==> Hello Java
      2. buffer(출력 메모리) => page 101 
         
                                              javac          java
         클라이언트 요청 ==> 톰캣 (jsp=> .java) => 컴파일 => .class => 실행 => 메모리에 HTML만 저장 (buffer)
                                                                             | 
                                                                       브라우저에서 읽어서 출력 
         buffer => 8kb (이상을 초과하면 오류) 
         =======
            클라이언트 브라우저와 서버 메모리와 연결 (클라이언트당 html을 출력하는 공간이 1개=> 새로고침 ,페이지이동)
                                             a.jsp=>b.jsp
                                             =====
                                               지운다
                                 1. 버퍼에 HTML을 저장 (a.jsp)
                                 2. 버퍼에 있는 HTML을 브라우저에서 읽어간다 
                                 3. 버퍼에 있는 HTML을 지운다 (a.jsp의 내용은 사라진다)
                                 4. 버퍼에 새로운 HTML을 저장 (b.jsp)
                                 ==============================================
            ===============================> 내용변경이 되면 => 버퍼를 지우기고 다시 쓰다 (autoFlush)
            
      3. 배포 => 자바(jar) , 웹(war)=>웹파일은 그대로 저장 , 자바파일 .class
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
      for(int i=0;i<100000;i++)
      {
  %>
         <%= "Hello" %>
  <%
      }
  %>
</body>
</html>






