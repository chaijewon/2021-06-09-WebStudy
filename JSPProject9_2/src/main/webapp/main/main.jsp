<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
   JSP파일을 한번에 모아서 관리:Container
   => 레이아웃 
      header / nav / footer / aside / section (화면변경=> include)
                              =====   ========
                              Login/이벤트/공지 
      ajax => web2.0 
      ====
        화면 깜박거림 제거 (검색,페이징) , 댓글 , 리뷰 , 서제스트 , 실시간 (날씨정보 , 달러...),예매(좌석)
 --%>
<%
     String mode=request.getParameter("mode");
     if(mode==null)
    	 mode="1";
     int index=Integer.parseInt(mode);
     String jsp="";
     switch(index)
     {
     case 1:
    	 jsp="genie.jsp";
    	 break;
     case 2:
    	 jsp="melon.jsp";
    	 break;
     case 3:
    	 jsp="total.jsp";
    	 break;
     /*case 4:
    	 jsp="genie.jsp";
    	 break;*/
     case 5:
    	 jsp="genie_detail.jsp";
    	 break;
     case 6:
    	 jsp="melon_detail.jsp";
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
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">JSPInclude</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">뮤직
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="main.jsp?mode=1">지니뮤직</a></li>
          <li><a href="main.jsp?mode=2">멜론뮤직</a></li>
          <li><a href="main.jsp?mode=3">혼합뮤직</a></li>
        </ul>
      </li>
      <li><a href="main.jsp?mode=4">자료실</a></li>
    </ul>
  </div>
</nav>
<%-- include  --%>
<jsp:include page="<%=jsp %>"></jsp:include>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p><a href="#" title="jspstudy">강북쌍용교육센터 G강의장</a></p>
</footer> 
</body>
</html>












