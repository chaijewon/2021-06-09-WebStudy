<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    // 1. mno를 받는다 
    String mno=request.getParameter("mno");
    // 2. DAO를 연결해서 데이터 받기 
    OracleDAO dao=new OracleDAO();
    MovieVO vo=dao.movieDetailData(Integer.parseInt(mno));
    // 3. HTML에 출력 
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let like=0;
$(function(){
	$('#like').click(function(){
		//alert("Hello");
		like++;
		$(this).text("좋아요("+like+")")
	})
})
</script>
</head>
<body>
   <div class="container">
     <h1>&lt;<%= vo.getTitle()%>&gt; 상세보기</h1>
     <div class="row">
      <table class="table">
        <tr>
          <td width=30% class="text-center" rowspan="6">
           <img src="<%=vo.getPoster() %>" width=210 height=300>
          </td>
          <td colspan="2" class="text-center">
            <h3><%=vo.getTitle() %></h3>
          </td>
        </tr>
        <tr>
          <td class="text-right" width=20%>감독</td>
          <td width=50%><%= vo.getDirector()%></td>
        </tr>
        <tr>
          <td class="text-right" width=20%>출연</td>
          <td width=50%><%=vo.getActor() %></td>
        </tr>
        <tr>
          <td class="text-right" width=20%>장르</td>
          <td width=50%><%=vo.getGenre() %></td>
        </tr>
        <tr>
          <td class="text-right" width=20%>등급</td>
          <td width=50%><%=vo.getGrade() %></td>
        </tr>
        <tr>
          <td class="text-right" width=20%>개봉일</td>
          <td width=50%><%=vo.getRegdate() %></td>
        </tr>
        <tr>
          <%-- 실제로 제작 --%>
          <td colspan="3" class="text-right">
           <a href="#" class="btn btn-sm btn-danger">예매</a>
           <a href="#" class="btn btn-sm btn-success">찜하기</a>
           <span class="btn btn-sm btn-primary" id="like">좋아요(0)</span>
           <a href="list.jsp" class="btn btn-sm btn-info">목록</a>
          </td>
        </tr>
      </table>
     </div>
   </div>
</body>
</html>







