<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <h1>response 객체</h1>
    <div class="row">
      <table class="table">
        <tr>
          <th class="success text-right" width=20%>클래스명</th>
          <td width=80%>HttpServletResponse</td> 
        </tr>
        <tr>
          <th class="success text-right" width=20%>주요기능</th>
          <td width=80%>
            <ul>
              <li>응답 정보</li>
              <li>화면이동 정보</li>
            </ul>
          </td> 
        </tr>
        <tr>
           <th class="success text-right" width=20%>주요메소드</th>
           <td width=80%>
             <ul>
               <li>HTML/XML로 응답 : setContentType("text/html"),setContentType("text/xml")</li>
               <li>쿠키 응답 : addCookie()</li>
               <li>사전 데이터 전송 : setHeader()</li>
               <li>화면 이동 : sendRedirect()</li>
             </ul>
           </td> 
        </tr>
       </table>
    </div>
  </div>
</body>
</html>