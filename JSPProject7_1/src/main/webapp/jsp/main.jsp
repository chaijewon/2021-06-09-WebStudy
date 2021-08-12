<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String mode=request.getParameter("mode");
     if(mode==null)
    	 mode="1";
     int index=Integer.parseInt(mode);
     String jsp="";
     switch(index)
     {
     case 1:
    	 jsp="request.jsp";
    	 break;
     case 2:
    	 jsp="response.jsp";
    	 break;
     case 3:
    	 jsp="out.jsp";
    	 break;
     case 4:
    	 jsp="pageContext.jsp";
    	 break;
     case 5:
    	 jsp="application.jsp";
    	 break;
     }
%>
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
   <nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">JSP내장객체</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li><a href="main.jsp?mode=1">request</a></li>
	      <li><a href="main.jsp?mode=2">response</a></li>
	      <li><a href="main.jsp?mode=3">out</a></li>
	      <li><a href="main.jsp?mode=4">pageContext</a></li>
	      <li><a href="main.jsp?mode=5">application</a></li>
	    </ul>
	  </div>
	</nav>
	<% pageContext.include(jsp); %> <%-- 조립식 --%>
</body>
</html>










