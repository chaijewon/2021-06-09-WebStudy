<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
        JSP 라이브러리 => 내장 객체(미리 객체를 생성후에 사용이 가능하게 만들어준다)
        ======================= 기본 객체
        기본객체 (9개) => 웹에서 사용이 가능한 객체
        ===========
        request : 클라이언트 정보,서버 정보 , 클라이언트 요청 정보 (클라이언트가 보내준 데이터)
        response : 화면 이동 정보 , 데이터 전송전에 데이터를 사전에 보낸다 , 쿠키정보 
        =========  1. HTML을 브라우저로 보내준다 , 2. 쿠키를 전송 , 3. 파일 전송 , 4. 화면 이동 (응답 정보)
            클라이언트    ==========>  서버
                        request
            클라이언트    <=========   서버
                        response
                        
            ===================================
            TCP ==> 신뢰성 좋다(데이터를 잃어버리지 않는다) ==> 메모리에 저장 => 메모리에서 읽기 (HTTP,SMTP,FTP)
                        write => read 
            클라이언트   ==========>  서버
                        read <= write(buffer)
                      <==========
        out  ====> 사용 빈도 극히 드물다 (메모리에 저장) => <%= %> , ${} 
        ===== JspWriter 
              주요 메소드 : out.println() => <%= %>
                         ============== Servlet
                         out.getBufferSize() : 출력 메모리 크기 확인 
                         out.getRemaining() : 출력하고 남아 있는 버퍼 크기 확인 
                         out.clear() : 버퍼에 있는 모든 지울때 사용 
                         out.flush() :       ""
        pageContext : PageContext => 웹 흐름 제어 
                      ===========
                        ***include() , ***forward()
                        =========   ========= MVC구조 (request를 유지해야 될때)
                        조립식 프로그램 
                        => 변경 => 액션 태그로변경 <jsp:include page=""> <jsp:forward page="">
        application : 서버 정보 확인 
                      log()
                      ***getRealPath() => 실시간 그림을 출력할 수 없다 
                      *** 갤러리 게시판 => 그림파일 업로드 ==> 목록 (그림이 출력하지 않는다)
                      getInitParameter()
        session : 서버에 클라이언트의 일부 정보 저장 (ID,Name) => 로그아웃 , 브라우저 종료 
                  setAttribute() : 저장 
                  getAttribute() : 저장된 값 읽기 
                  invalidate() : 모든 데이터 지울때  => 로그아웃
                  setMaxactiveInterval() : 저장 시간  ==> 초단위 (30분)
                  removeAttribute() : 저장된 데이터 중에 1개 제거 => 회원수정 , 장바구니 제거 
        exception : 예외처리 => try~catch ==> 에러페이지 => getMessage() , printStackTrace()
        page   : 자바의 this  ==> page=this 
        config : 환경 설정 (서블릿등록 , XML등록 , 클래스 파일 등록) => 사용빈도가 없다 => web.xml에 처리
                                                                             =========
        1장 ~ 10장 : 기본 
        11장 ~ 12장 : ==> EL/JSTL => MVC
        13장 ==> 이클립수 사용법 
        14장 ==> 데이터베이스 
        15  ==> 예제 (방명록) XXXXX 
        16 
        17 => 서블릿 
        18 => MVC
        ==================================================================================
        Spring
 --%>
<%--
       request , response , application , session(10장)
       ===================  ===========
                             파일업로드 
       pageContext : (7장) => include / forward
       exception : (6장) => 에러페이지 만들때 
       config : web.xml 
       out : ${} , <%= %>
       Spring : EL,JSTL , 서블릿 , 구조(18장)  ====> include/tiles, JSON(restful)
                ==========================
                DAO / VO
                
       = out 
         ====
          출력과 관련 
            ===============
            = print()
            = println()
            = newLine() 
            =============== 브라우저 출력 관련이 아니고 메모리에 출력과 관련 
          출력 버퍼 관련 
            = 버퍼의 크기(HTML를 출력하는 메모리 공간) => getBufferSize()
            = 남아 있는 버퍼 크기 => getRemaining()
            = 버퍼를 비우는 메소드 => clear() , flush() , isAutoFlush() => true 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- 일반 JSP이용 주석: ctrl+shift+/  : 주석해제 : ctrl+shift+\ -->
  <%-- <%= "Hello JSP" %>
  <%
     out.print("Hello JSP"); // 복잡한 JSP코드 생성 
  %>
  <br>
  <%
     out.println("Hello JSP");
  %> --%>
  <h1>구구단(JSP)</h1>
  <table border=1 bordercolor=black width=500>
   <tr>
      <%
          for(int i=2;i<=9;i++)
          {
	  %>
	         <td align=center><%= i+"단" %></td> <%-- <%= %> : out.println() : JSP는 태그형 프로그램(권장)--%>
	  <%
	     }
	  %>
   </tr>
  </table>
  <p>
  <h1>구구단(out)</h1>
  <table border=1 bordercolor=black width=500>
   <tr>
     <%
         for(int i=2;i<=9;i++)
         {
        	 out.println("<td align=center>"+(i+"단")+"</td>"); //Servlet
        	 // 답변형 게시판 , 댓글형 게시판 출력  ==> 
        	 /*
        	      AAAAAA
        	      ()=> BBBBB
        	      ()()=> CCCCC   out.println("&nbsp;")
        	 */
         }
     %>
   </tr>
  </table>
  <h1>out(JspWriter)의 버퍼관련 메소드</h1>
  버퍼크기(기본 : 8kb => 8*1024) : <%= out.getBufferSize() %> <br>
  현재 남아 있는 버퍼 : <%= out.getRemaining() %><br>
  현재 사용중인 버퍼크기: <%= out.getBufferSize()-out.getRemaining() %><br>
  자동 flush : <%= out.isAutoFlush() %>
</body>
</html>










