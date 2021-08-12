<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
    // 오라클에 저장되어 있는 데이터 읽기
    OracleDAO dao=new OracleDAO();
    ArrayList<CategoryVO> list=dao.foodCategoryListData();
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
    width:1200px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
     <h3 style="color:orange">믿고 보는 맛집 리스트</h3>
     <hr>
     <%
         for(int i=0;i<12;i++)
         {
        	 CategoryVO vo=list.get(i);
        	 // HTML로 화면 출력 
     %>
             <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="../main/main.jsp?cno=<%=vo.getCno()%>&mode=4">
			        <img src="<%=vo.getPoster() %>" title="<%=vo.getSubject() %>" style="width:100%">
			        <div class="caption">
			          <p><%=vo.getTitle() %></p>
			        </div>
			      </a>
			    </div>
			   </div>
     <%
         }
     %>
    </div>
    <div class="row">
     <h3 style="color:orange">지역별 인기 맛집</h3>
     <%
         for(int i=12;i<18;i++)
         {
        	 CategoryVO vo=list.get(i);
        	 // HTML로 화면 출력 
     %>
             <div class="col-md-4">
			    <div class="thumbnail">
			      <a href="../main/main.jsp?cno=<%=vo.getCno()%>&mode=4">
			        <img src="<%=vo.getPoster() %>" title="<%=vo.getSubject() %>" style="width:100%">
			        <div class="caption">
			          <p><%=vo.getTitle() %></p>
			        </div>
			      </a>
			    </div>
			   </div>
     <% 
         }
     %>
     <hr>
    </div>
    <div class="row">
     <h3 style="color:orange">메뉴별 인기 맛집</h3>
     <hr>
     <%
         for(int i=18;i<30;i++)
         {
        	 CategoryVO vo=list.get(i);
        	 // HTML로 화면 출력 
     %>
             <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="../main/main.jsp?cno=<%=vo.getCno()%>&mode=4">
			        <img src="<%=vo.getPoster() %>" title="<%=vo.getSubject() %>" style="width:100%">
			        <div class="caption">
			          <p><%=vo.getTitle() %></p>
			        </div>
			      </a>
			    </div>
			   </div>
     <%
         }
     %>
    </div>
  </div>
</body>
</html>








