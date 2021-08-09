<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // input2.jsp에서 전송한 데이터를 받아 본다 (모든 데이터 String)
    // <input type=text name=name id=name size=15>
    try
    {
    	request.setCharacterEncoding("UTF-8"); //POST방식일때 처리  tomcat8.5
    	// 스프링 (5.0) => 실무 (4.x) => 우리나라 실정에 맞게 변경 => 전자정부 프레임워크 (공기업) : Spring4.xx
    	// ========== 순수하게 자바로 코딩(차세대 개발)     4.x=XML을 사용 
    }catch(Exception ex){}
    
    String name=request.getParameter("name");
    // <input type=radio name=sex checked value="남자">
    String sex=request.getParameter("sex"); // name이 없는 경우 => null
    // <input type=text name=addr size=25>
    String addr=request.getParameter("addr");
    // <select name=tel1>
    String tel1=request.getParameter("tel1");
    // <input type=text name=tel2 size=15>
    String tel2=request.getParameter("tel2");
    // <textarea rows="5" cols="30" name=content></textarea>
    String content=request.getParameter("content");
    /*
            <input type="checkbox" name=hobby value="등산">등산
            <input type="checkbox" name=hobby value="게임">게임
            <input type="checkbox" name=hobby value="낚시">낚시
            <input type="checkbox" name=hobby value="여행">여행
            <input type="checkbox" name=hobby value="독서">독서
    */
    // checkbox==> String[]
    String[] hobby=request.getParameterValues("hobby");
    // 한글 깨짐 => JDK15버전 / tomcat10버전 => 한글이 자동화 
    // 한글이 깨진다 (was:제우스)
    // GET 방식 => server.xml (등록)
    // POST => request.setCharacterEncoding("UTF-8")
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>전송받은 값</h1>
  이름:<%=name %><br>
  성별:<%=sex %><br>
  주소:<%=addr %><br>
  전화:<%=tel1 %>)<%=tel2 %><br>
  소개:<%=content %><br>
  <ul>
    <%
      try{
           for(String s:hobby) // 체크박스에 체크가 없는 경우에 500에러 발생 => hobby=null
           {
    %>
            <li><%=s %></li>
    <%
          }
      }catch(Exception ex)
      {
    %>
         <!-- 선택이 없는 경우에 처리  -->
         <span style="color:red">취미가 없습니다</span>
    <%  
      }
    %>
  </ul>
  
</body>
</html>







