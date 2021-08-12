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
    	 jsp="../movie/list.jsp";
    	 break;
     case 2:
    	 jsp="../movie/detail.jsp";
    	 break;
     case 3:
    	 jsp="../food/category.jsp";
    	 break;
     case 4:
    	 jsp="../food/food.jsp";
    	 break;
     case 5:
    	 jsp="../food/detail.jsp";
    	 break;
     }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db0485ed4f0d0ece879a4510ed7f48e6&libraries=services"></script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">JSPStudy</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="main.jsp?mode=1">영화</a></li>
      <li><a href="main.jsp?mode=3">맛집</a></li>
      <li><a href="main.jsp?mode=6">뮤직</a></li>
    </ul>
  </div>
</nav>
<jsp:include page="<%=jsp %>"></jsp:include>
</body>
</html>