<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      session vs cookie
      ================= 9장,10장
      exception : 에러처리 (6장)
      pageContext: 태그형식 (7장)
      config,page (X) => web.xml , page=this
      
      => request , response, session , application(getRealPath())
      
      1. request : HttpServletRequest  ==> 72page , 76page , 80page (GET/POST)
         ======= 클라이언트 정보(IP) => getRemoteAddr()
         ======= 서버정보 => getRequestURL(),getRequestURI(),getContextPath()
         ======= 요청정보 => getParameter() , getParameterValues():checkbox
         ======= 추가정보 => setAttribute()
                           ============== MV (자바/HTML) => MVC
                           현재 권장 : JSP안에 <% %> <%= %>를 사용하지 않는다 => 태그형으로 프로그램을 제어
                           <%
                                for(int i=1;i<=9;i++)
                           %>
                           <c:forEach var="i" begin="1" end="9" step="1"> => 실무 (스프링)
      2. response : HttpServletResponse 93page (리다이렉트)
        ======== 응답 정보
            = 사전 전송 데이터 : header => setHeader:다운로드 (다운로드창=>파일명, 파일크기)
            = 실제 전송 데이터 : contentType("text/html")
            = HTML/XML , Cookie  ==> JSP에서는 1개만 선택 
        ======== 화면 이동 
            = sendRedirect() => 화면을 완전 이동(화면 변경, URL주소 변경) => request가 초기화
      3. out : JspWriter 118page
        ======= 출력정보 (메모리에 출력)
            = print()
            = println() <%= %>
            = newLine()
        ======= 출력버퍼정보
            = getBufferSize()
            = getRemaining()
            = isAutoFlush()
      4. pageContext : PageContext
        ====== 기본객체 얻기 (X)
               getRequest()=request , getResponse()=response
               pageContext.getRequest() , request
               String name=pageContext.getRequest().getParameter("name")
               String name=request.getParameter("name")
        ====== 흐름 제어 7장
            = include()
            = forward()
            = pushBody() : 내장 객체를 메모리 해제후 새로운 객체를 생성 
              out=null => pageContext.pushBody() => out객체 생성 
       5. application : ServletContext 129page
            = getInitParameter() : web.xml
            = getRealPath() => 그래프
            = getResource()
       
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
}
.row{
   width:800px;
   margin: 0px auto;
}
h1{
   text-align: center;
}
</style>
</head>
<body>
   <div class="container">
     <h1>request객체</h1>
     <div class="row">
       <table class="table">
        <tr>
          <th class="success text-right" width=20%>클래스명</th>
          <td width=80%>HttpServletRequest</td> 
        </tr>
        <tr>
          <th class="success text-right" width=20%>주요기능</th>
          <td width=80%>
            <ul>
              <li>서버정보/클라이언트 정보</li>
              <li>요청한 모든 정보</li>
              <li>세션이나 쿠키 읽기 정보(9,10)</li>
            </ul>
          </td> 
        </tr>
        <tr>
           <th class="success text-right" width=20%>주요메소드</th>
           <td width=80%>
             <ul>
               <li>클라이언트의 IP읽기 : getRemoteAddr()</li>
               <li>클라이언트가 URL읽기 : getRequestURL()</li>
               <li>클라이언트가 URI읽기 : getRequestURI()</li>
               <li>루프 폴더 읽기 : getContextPath()</li>
               <li>단일값 읽기 : getParameter()</li>
               <li>다중값 읽기 : getParameterValues()</li>
               <li>값을 추가: setAttribute()</li>
               <li>세션읽기: getSession()</li>
               <li>쿠키읽기: getCookie()</li>
             </ul>
           </td> 
        </tr>
       </table>
     </div>
   </div>
</body>
</html>












