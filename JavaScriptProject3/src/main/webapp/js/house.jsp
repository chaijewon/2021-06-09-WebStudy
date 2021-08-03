<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
     FoodDAO dao=new FoodDAO();
     ArrayList<FoodVO> list=dao.foodListData(1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script type="text/javascript">
 function hover()
 {
	 
 }
 </script>
</head>
<body>
  <div style="height:50px"></div>
  <div class="container-fluid">
    <div class="row">
      <%
          for(FoodVO vo:list)
          {
      %>
                <div class="col-md-2">
				    <div class="thumbnail">
				      <a href="#">
				        <img src="<%=vo.getPoster().substring(0,vo.getPoster().indexOf("^")) %>" alt="Lights" style="width:100%">
				        <div class="caption">
				          <p><%=vo.getName() %></p>
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





