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
    <h1>application 객체</h1>
    <div class="row">
      <table class="table">
        <tr>
          <th class="success text-right" width=20%>클래스명</th>
          <td width=80%>ServletContext</td> 
        </tr>
        <tr>
          <th class="success text-right" width=20%>주요기능</th>
          <td width=80%>
            <ul>
              <li>로그 출력</li>
              <li>web.xml 데이터 읽기</li>
              <li>자원 정보(파일,이미지)</li>
            </ul>
          </td> 
        </tr>
        <tr>
           <th class="success text-right" width=20%>주요메소드</th>
           <td width=80%>
             <ul>
               <li>log()</li>
               <li>getInitParameter()</li>
               <li>getRealPath()</li>
             </ul>
           </td> 
        </tr>
       </table>
    </div>
  </div>
</body>
</html>