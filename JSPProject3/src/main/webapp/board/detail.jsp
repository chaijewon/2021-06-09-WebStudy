<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
   //1. list.jsp에 보내준 값을 받는다 
   // detail.jsp?no=1
   String no=request.getParameter("no");
   //2. 받은 데이터를 => DAO로 전송 => 해당 데이터를 받아 온다 
   BoardDAO dao=new BoardDAO();
   //3. DAO에서 받은 데이터 출력 
   BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
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
    width:700px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
   <h1>내용보기</h1>
   <div class="row">
     <table class="table">
       <tr>
        <th width=20% class="success text-center">번호</th>
        <td width=30% class="text-center"><%=vo.getNo() %></td>
        <th width=20% class="success text-center">작성일</th>
        <td width=30% class="text-center"><%=vo.getRegdate().toString() %></td>
       </tr>
       <tr>
        <th width=20% class="success text-center">이름</th>
        <td width=30% class="text-center"><%=vo.getName() %></td>
        <th width=20% class="success text-center">조회수</th>
        <td width=30% class="text-center"><%=vo.getHit() %></td>
       </tr>
       <tr>
        <th width=20% class="success text-center">제목</th>
        <td colspan="3"><%=vo.getSubject() %></td>
       </tr>
       <tr>
         <td colspan="4" valign="top" height="200">
          <pre style="white-space: pre-wrap;background-color:white;border:none"><%=vo.getContent() %></pre>
         </td>
       </tr>
       <tr>
         <td colspan="4" class="text-right">
          <%--
             데이터는 한개만 제어 ==> 반드시 primary key값중에 한개를 넘긴다
             *** 모든 데이터베이스 테이블른 primary key반드시 한개를 가지고 있어야 한다 (여러개 있을 수도 있다)
             primary key=>정수 
             => 문자열 (id)
           --%>
          <a href="update.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-success">수정</a>
          <a href="delete.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-info">삭제</a>
          <a href="list.jsp" class="btn btn-xs btn-warning">목록</a>
         </td>
       </tr>
     </table>
   </div>
  </div>
</body>
</html>




















