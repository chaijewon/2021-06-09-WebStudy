<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
    // 1. category.jsp에서 받은 카테고리 번호를 받는다 
    String cno=request.getParameter("cno");
    // 2. cno에 해당되는 맛집 목록을 받는다 (오라클 => 오라클연결 :OracleDAO)
    OracleDAO dao=new OracleDAO();
    ArrayList<FoodVO> list=dao.foodCategoryData(Integer.parseInt(cno));
    CategoryVO vo=dao.foodCategoryInfoData(Integer.parseInt(cno));
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
    width:900px;
}
h1,h3{
  text-align: center;
}
</style>
</head>
<body>
   <div class="container">
     <div class="jumbotron"><%--회색바탕 --%>
       <h1><%=vo.getTitle() %></h1>
       <h3><%=vo.getSubject() %></h3>
     </div>
     <div class="row">
       <table class="table">
        <tr>
         <td>
	       <%
	          for(FoodVO fvo:list)
	          {
	       %>
	             <table class="table">
	               <tr>
	                 <td width=40% class="text-center" rowspan="4">
	                  <a href="detail.jsp?no=<%=fvo.getNo()%>">
	                  <img src="<%=fvo.getPoster() %>" width=330 height=190 class="img-rounded"></a>
	                 </td>
	                 <td width=60%>
	                   <h3><a href="detail.jsp?no=<%=fvo.getNo()%>"><%=fvo.getName() %></a>&nbsp;<span style="color:orange"><%=fvo.getScore() %></span></h3>
	                 </td>
	               </tr>   
	               <tr>
	                 <td><%=fvo.getAddress() %></td>
	               </tr>
	               <tr>
	                 <td><%=fvo.getTel() %></td>
	               </tr>
	               <tr>
	                 <td height=45></td>
	               </tr>
	             </table>
	       <%
	          }
	       %>
	     </td>
	    </tr>
	   </table>
     </div>
   </div>
</body>
</html>





