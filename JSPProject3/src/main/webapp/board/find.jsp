<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%--
      1. JSP 
         자바 코딩  ======> <%  %> : 클래스 메모리 할당 , 메소드 호출 , 변수선언 , 연산 처리, 제어문 
                          ======= 일반 클래스로 변경 
                          ======= 자바코딩을 jsp에서 사용하지 않는다 (순수하게 출력 담당) : MVC(실무)
         자바 데이터 출력 ==> <%= %> ;을 사용하지 않는다 
                          ======= 11장 ${} => EL
         *** 흐름 : 화면 이동 
             ===
              화면 변경 : <a href="변경할 파일명"> : 사용자가 선택 => GET방식만 사용이 가능 
                        => 데이터 전송시에  파일명?변수=값...
                        사용자와 상관없이 서버에서 변경 : sendRedirect("이동할 파일명") => GET방식만 사용이 가능 
                        자바스크립트에서 이동 : location.href="이동할 파일명" => GET방식만 사용이 가능 
                        =========================================================================
                        GET => 데이터 전송시에 URL뒤에 ?를 붙여서 데이터 전송
                        여러개 데이터전송,보안(보여주면 안되는 데이터) : POST(내부 네트워크를 통해서 전송)
                        =================================================================
                        POST => <form>: GET/POST , ajax: GET/POST 
         *** 사용자 입력폼 / 입력된 데이터를 받아서 처리하는 JSP
             insert.jsp ====> insert_ok.jsp  
             ==========       =============
              사용자 입력
              
              ======> HTML의 화면 처리 ==> Java가 우선순위
              insert.jsp
              <%
                  BoardDAO dao=new BoardDAO();
                  dao.insert() => 데이터베이스 추가  ===> NOT NULL  : 먼저는 한번 오라클에 입력이 먼저 수행 
              %>
              <html>
                <body>
                  입력폼 
                </body>
              </html>
              
         2. 내장 객체 
            =======
            1) 사용자의 정보나 사용자가 입력한 데이터를 받아서 처리 
               HttpServletRequest => request(톰캣)
               list.jsp?page=1
               detail.jsp?page=1&no=10
               => 
               톰캣 역할 
               =======
               request.setAttribute("page",1)
               request.setAttribute("no",10)
               
               ==> request.getParameter(키) => 값을 가지고 온다 
               
               ==> request의 주요 메소드  (은퇴할때까지) => 스프링 동일 (스프링 => 복잡한 클래스구조를 단순하게한다)
                                                                ===== 웹프로그램 아니라 (클래스 관리자)
                   ==================
                    = getParameter() , getParameterValues():checkbox,select(멀티) : 사용자 입력값 받는 경우
                      ==============
                      text,password,radio,textarea,select,date 
                    = *** request는 화면 변경이 되면 request에 담겨있는 모든 데이터는 초기화가 된다
                      insert.jsp ==> insert_ok.jsp ===> list.jsp
                               request            request
                               =======            =======
                                       다른 request
                                       ===> 매개변수로 사용하기 때문에 
                                       ===> request는 지역변수 , 모든 jsp는 request를 가지고 있다 
                                            ================
                                            전역변수 : session (request는 일회성이다)
                     = getRequestURL(),getRequestURI(),getContextPath()
                     = getRemoteAddr()
                     = setCharacterEncoding() => 한글처리 (EUC-KR,UTF-8)
                                                                ===== 운영체제,버전호환 , 다른 프로그램 호환
                              
            2) 사용자에게 결과값을 응답 정보, 화면 이동 정보
               HttpServletResponse => response 
               주요메소드 : 응답 (HTML,Cookie)
                 => 화면이동 : sendRedirect(), addCookie() 
                 => 사전에 데이터 전송 : setHeader()
                        
--%>
<%
    // list.jsp에 보내준 데이터를 받는다 
    // 한글 => jdk-15 => 실무(jdk1.8) , 스프링 5.0(설정파일:자바) => 실무(4.xx)(설정파일:XML)
    // JDK => 1.8 ==> Spring(JDK15 적용이 안된다)
    try
    {
    	request.setCharacterEncoding("UTF-8");// 데이터가 한글일 경우에만 설정 
    }catch(Exception ex){}
    String fs=request.getParameter("fs");// 태그속성중에 name=fs
    String ss=request.getParameter("ss");
    System.out.println("fs="+fs);
    System.out.println("ss="+ss);
    // 데이터베이스에서 값을 얻어온다 => 찾은 데이터를 HTML에 출력 
    BoardDAO dao=new BoardDAO();
    ArrayList<BoardVO> list=dao.boardFindData(fs, ss);
    //

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
.container{
   margin-top: 30px;
   font-family: 'Single Day', cursive;
}
.row {
    margin: 0px auto;
    width:800px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
   <h1>검색 결과</h1>
   <div class="row">
     <table class="table">
       <tr>
         <td class="text-right">
           <a href="list.jsp" class="btn btn-sm btn-primary">목록</a>
         </td>
       </tr>
     </table>
     <%
        if(list.size()<1) // 검색된 데이터가 없다
        {
     %>
            <table class="table">
             <tr>
              <td class="text-center">검색된 결과가 없습니다</td>
             </tr>
            </table> 
     <%
        }
        else // 검색된 데이터가 존재
        {
     %>
            <table class="table table-striped">
              <tr class="info">
                <th class="text-center" width=10%>번호</th>
                <th class="text-center" width=45%>제목</th>
                <th class="text-center" width=15%>이름</th>
                <th class="text-center" width=20%>작성일</th>
                <th class="text-center" width=10%>조회수</th>
              </tr>
              <%
                  for(BoardVO vo:list)
                  {
              %>
                      <tr>
                        <td class="text-center" width="10%"><%=vo.getNo() %></td>
                        <td width="45%"><%=vo.getSubject() %></td>
                        <td class="text-center" width="15%"><%=vo.getName() %></td>
                        <td class="text-center" width="20%"><%=vo.getRegdate().toString() %></td>
                        <td class="text-center" width="10%"><%=vo.getHit() %></td>
                      </tr>
              <%
                  }
              %>
            </table>    
     <% 	
        }
     %>
   </div>
  </div>
</body>
</html>






