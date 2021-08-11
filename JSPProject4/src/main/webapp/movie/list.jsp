<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.dao.*" %>
<%
    // 사용자가 요청한 페이지를 받는다 (이전,다음)
    String strPage=request.getParameter("page"); // page = this => 키워드
    // 페이지가 나눠지면 => 처음 실행시에 => 사용자가 페이지요청을 할 수 없다 => default
    if(strPage==null) 
    {
    	strPage="1";
    }
    
    // 현재페이지 설정 
    int curpage=Integer.parseInt(strPage);
    // DAO연결 
    OracleDAO dao=new OracleDAO();
    // 해당 페이지의 데이터 값을 받는다 
    ArrayList<MovieVO> list=dao.movieListData(curpage);
    // 총페이지 받기
    int totalpage=dao.movieTotalPage();
    // list에 있는 영화 목록 , 총페이지
    /*
        목록 => 자바(1) , HTML(2)
        데이터 추가 => HTML(1) , 자바(2)
                    =======   =======
                     jsp       jsp => _ok.jsp
    */
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
    <h1>네이버 영화목록</h1>
    <div class="row">
     <%
        for(MovieVO vo:list)
        {
     %>
		      <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="#">
			        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:245px;height:300px">
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









