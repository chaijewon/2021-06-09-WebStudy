<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="JSP 일반 사용법,75page" import="java.util.*,java.text.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%--
       page 50
       1) 지시자 
          page : <%@ page 속성=값 속성=값....%>  속성은 이미 만들어져 있다 (3장)
          include : <%@ include file="파일명"%> : JSP안에 특정부분에 다른 JSP를 첨부 (조립식) (7장)
          tablib (12장)
          
          <table>
            <tr>
          <%
               for(int i=1;i<=9;i++)
               {
          %>
                   <td><%=i%></td>
          <%
               }
          %>
            </tr>
          </table>
          
          <table>
            <tr>
              <c:forEach begin="1" end="9">
                ${i}
              </c:forEach>
            </tr>
           </table>
           
           56 page 
           page 속성 (JSP파일에 대한 정보를 가지고 있다) => language="java" => 다른 언어도 사용이 가능
                                                    ===============
                                                    info="2021.08.09 수정 , 제작:홍길동,게시판 목록" => 누구가 개발했는지 확인,수정 날짜
                                                    ***contentType=""  => 문서 생성타입을 지정 
                                                                ==
                                                                text/html;charset=UTF-8 (EUC-KR:Default)
                                                                text/xml;charset=UTF-8
                                                                text/plain;charset=UTF-8 (JSON) => Kotlin연결
                                                    ***import="" => 자바라이브러리 첨부 (java.lang.* 생략)
                                                    ***page속성은 반드시 한번만 사용이 가능하다 
                                                    ***import는 여러번 사용이 가능 
                                                    =========================
                                                    <%@ page import="java.util.*,com.sist.dao.*"%>
                                                    <%@ page import="java.util.*"%>
                                                    <%@ page import="java.io.*"%>
                                                    
                                                    session => default (true) 
                                                    ======= 서버에 사용자의 일부정보를 저장후에 로그아웃,종료시까지 사용
                                                            id,password,이름 
                                                    buffer => 출력메모리(HTML) => 임시공간 => 8kb
                                                           => 16kb (포털) , 32kb
                                                    autoFlush =>브라우저에서 출력된 HTML을 읽어가면 => buffer비운다
                                                       => true
                                                    ***errorPage : 에러 발생시 어떤 에러가 발생했는 지 화면 출력
                                                                출력할 화면을 지정 
                                                                => 500,404,403,415 한개파일로 파일 
                                                    ***isErrorPage : 톰캣에서 처리 => 나눠서 처리 (web.xml)
                                                    pageEncoding : 현재 사용하고 있는 파일의 한글처리
       => 스크립트 요소 : HTML안에 자바코딩을 추가 
       ======================================================================
          <% %>  : 일반 자바 (변수 설정 , 연산자 , 제어문 , 메소드 호출)
          <%! %> : 메소드 제작 => 사용빈도가 거의 없다 ==> 자바로 클래스를 만들어서 처리
       ====================================================================== 일반 자바와 동일 (;를 생략하면 오류난다)
          <%= %> : 화면 출력 (데이터 출력) => ;을 사용하면 안된다 
          ======
            out.println(여기에 들어가는 출력물);
                                                    
 --%>
 <%--
       public class basic2_jsp extends HttpServlet
       {
          public String message()
          {
	               return "Hello JSP";
          } <%! %>
          public void _jspInit()  ====> 생성자 역할 (초기화)
          {
          }
          public void _jspDestory() ===> 소멸자 역할(소멸자=> 메모리 해제)
          {
          }
          public void _jspService()  ===> 사용자가 요청한 파일을 보내준다 (JSP코딩)
          {
               
              out.write("<!DOCTYPE html>");
              out.write("<html>");
              --
              --
              Date date=new Date();
              SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
              out.println(sdf.format(date));
          }
       }
 
  --%>
<!-- HTML코드는 out.write("<html>") out.write를 생략하고 있다(코드를 쉽게 만들수 있게 하고 있다) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!--  자바와 HTML을 분리해서 사용이 가능하게 만드는 부분  -->
  <%!
       // 메소드 만드는 영역 => 전역변수 => class 블럭안에 설정 
       public String message()
       {
	       return "Hello JSP";
       }
  %>
  <%
      // _jspService() 메소드안에 설정 하는 내용
      Date date=new Date();
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
      // 변수 , 클래스 메모리 할당 , 기타 메소드 
      /*
          여러줄 주석
      */
  %>
  <!-- _jspService()안에서 읽는다 out.println() -->
  <%= sdf.format(date) %> <%--출력 영역은 ;을 사용하면 안된다  --%>
  <br>
  <%= message() %> 
</body>
</html>







