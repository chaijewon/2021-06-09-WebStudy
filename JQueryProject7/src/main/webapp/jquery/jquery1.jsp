<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    //자바로부터 데이터를 읽어온다 
    MovieDAO dao=new MovieDAO();
    ArrayList<MovieVO> list=dao.movieListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
h1{
   text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- 
    자바 => 오라클에 있는 데이터를 읽어와서 화면에 출력 
    동작 => 자바스크립트로 처리 
    모든 화면은 HTML로 출력 
 -->
<script type="text/javascript">
// 브라우저에서 필요한 처리 
$(function(){
	$('.images').hover(function(){
		//$(this).css("border","2px solid green")
		$(this).css("opacity",0.2)
	},function(){
		//$(this).css("border","none")
		$(this).css("opacity",1.0)
	})
})
</script>
</head>
<body>
   <div class="container">
     <h1></h1>
     <div class="row"><!-- 한줄에 출력 : col-sm-8 -->
        <%
            for(MovieVO vo:list)
            {
        %>
                  
		          <div class="col-md-3"> <!--  3333 -->
				    <div class="panel panel-primary">
					  <div class="panel-heading"><%=vo.getTitle().length()>17?vo.getTitle().substring(0,15)+"...":vo.getTitle() %></div>
					  <div class="panel-body">
					    <div class="thumbnail">
					      <a href="#">
					        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:100%" class="images">
					      </a>
					    </div>
					  </div>
				  </div>
				 </div>
		<%
            }
		%>
     </div>
   </div>
</body>
</html>











